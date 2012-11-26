//
//  ASStockDataViewController.m
//  LineChart2
//
//  Created by  on 12-11-23.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockDataView.h"

@implementation ASStockDataView

-(void) GetHtmlContentMinute:(NSNotification *)notification
{
    NSDictionary *userInfo= [notification userInfo];
    
    NSString * strNetData = [userInfo objectForKey:@"html_content"];
    NSArray  *array= [strNetData componentsSeparatedByString:@"\n"];
    [m_drawLineChart Reset];
    for (int i = 0; i != array.count -1; i++)
    {
        NSString * strArrayObject = [array objectAtIndex:i];
        NSRange range = [strArrayObject rangeOfString:@" "];
        if (range.length != 0)
        {
            NSString *strBegin = [strArrayObject substringFromIndex : range.location + 1];
            range = [strBegin rangeOfString:@" "];
            NSString *strPrice = [strBegin substringToIndex : range.location];
            double dbRealPrice = [strPrice doubleValue];
            ASStockInfo * tmp = [[ASStockInfo alloc]initWithHighestPrice:10.0 andLowestPrice:5.0 andBeginPrice:6.0 andEndPrice:dbRealPrice];
            [m_drawLineChart AddStockInfo:tmp];
            
        }
    }
    
    [m_drawLineChart DrawLineChart];
}

-(void) GetHtmlContentKLine :(NSNotification *)notification
{
    NSDictionary *userInfo= [notification userInfo];
    
    NSString * strNetData = [userInfo objectForKey:@"html_content"];
    NSArray  *array= [strNetData componentsSeparatedByString:@"\n"];
    [m_drawKLineController Reset];
    for(int i = array.count -1 ; i != 0; i--)
    {
        NSString * strArrayObject = [array objectAtIndex:i];
        NSArray  *arrayObject= [strArrayObject componentsSeparatedByString:@"\t"];
        
        double highPrice = [[arrayObject objectAtIndex:2] doubleValue];
        double lowPrice = [[arrayObject objectAtIndex:3] doubleValue];
        double beginPrice = [[arrayObject objectAtIndex:1] doubleValue];
        double endPrice = [[arrayObject objectAtIndex:4] doubleValue];
        
        if (highPrice == lowPrice)
            continue;
        ASStockPriceInfo *tmp = [[ASStockPriceInfo alloc]initWithHighestPrice:highPrice andLowestPrice:lowPrice andBeginPrice:beginPrice andEndPrice:endPrice];
        [m_drawKLineController AddStockInfo:tmp]; 
        
    }
    
    [m_drawKLineController DrawAllKLineInfo];
}

-(id)init :(CGRect)toolbarFrame :(NSArray *)toolbarName 
          :(UIColor *)toolbarColor :(UIColor *)toolbarFontColor 
        :(UIColor *)changeFontColor
          :(UIImageView *)backGroundImage 
          :(UIImageView *)dataSourceImage 
          : (NSString*) strStockCode
{
    self = [super init];
    if(self)
    {
        m_CGFrame = toolbarFrame;
        m_toolbarColor = toolbarColor;
        m_toolbarFontColor = toolbarFontColor;
        m_changeFontColor = changeFontColor;
        m_backGroundImage = backGroundImage;
        m_datasourceImage = dataSourceImage;
        m_strStockCode = [[NSMutableString alloc]initWithCapacity:0];
        [m_strStockCode setString:strStockCode];
        m_Array = toolbarName;
    }
    return self;
}


//点击事件
-(IBAction)segmentAction:(id)sender
{
    [self CurrentViewFresh];
}
//初始化数据成员
-(void)initMemberVariable
{
    m_backGroundImage.backgroundColor = [UIColor clearColor];
    m_datasourceImage.backgroundColor = [UIColor clearColor];
    
    m_drawLineChart = [[ASDrawLineChart alloc]init:m_datasourceImage];
    m_drawKLineController = [[ASKLineController alloc]init:m_datasourceImage];
    
    m_netStockInfo = [[ASNetStockInfo alloc]init];
}

    
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initMemberVariable];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetHtmlContentMinute:) name:@"GetHtmlContentMinute" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetHtmlContentKLine:) name:@"GetHtmlContentKLine" object:nil];
    
    [self.view addSubview:m_netStockInfo.view];
  
    [m_netStockInfo StartNetStockInfoOfMinute:m_strStockCode];
    
    m_ToolbarView = [[ASStockToolBar alloc]initWithFrame:m_CGFrame :m_Array :m_toolbarColor :m_toolbarFontColor :m_changeFontColor];
    [m_ToolbarView CreateToolBar];   
    [m_ToolbarView addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    m_BackgroundGridding = [[ASStockGridding alloc]init:TRANSVERSE_COUNT :LONGITUDINAL_COUNT :m_backGroundImage];
    [m_BackgroundGridding CreateGridding];
    
    
    [self.view addSubview:m_backGroundImage];
    [self.view addSubview:m_datasourceImage];
    [self.view addSubview:m_ToolbarView];
}

-(void)ChangeBeginDaily:(int)currentDay :(int *)nOldDay
{
    if(currentDay <= 28)
    {
        *nOldDay = currentDay;
    }else{
        *nOldDay = 28;
    }
    return;
}

- (void)GetBeginDayKLine :(int)currentMonth :(int)currentYear :(int *)nOldMonth :(int *)nOldYear
{
    if(currentMonth > 3)
    {
        *nOldYear = currentYear;
        *nOldMonth = currentMonth - 3;
    }
    else 
    {
        *nOldMonth = currentMonth + 9;
        *nOldYear = currentYear - 1;
    }
    return;
}
-(void)GetBeginWeekKLine : (int)currentMonth :(int)currentYear :(int *)nOldMonth :(int *)nOldYear
{
    *nOldYear = currentYear - 1;
    *nOldMonth = currentMonth;
    return;
}
-(void)GetBeginMonthKLine : (int)currentMonth :(int)currentYear :(int *)nOldMonth :(int *)nOldYear
{
    *nOldYear = currentYear - 4;
    *nOldMonth = currentMonth;
    return;
}
-(void)getOldData:(int)currentYear :(int)currentMonth :(int)currentDay
                : (int*) nOldYear : (int*) nOldMonth : (int*) nOldDay;
{
    int index = m_ToolbarView.selectedSegmentIndex;
    
    [self ChangeBeginDaily:currentDay :nOldDay];
    
    if (index == 1) {
        [self GetBeginDayKLine:currentMonth :currentYear :nOldMonth :nOldYear];
    }
    if(index == 2)
    {
        [self GetBeginWeekKLine : currentMonth : currentYear : nOldMonth : nOldYear];
    }
    if(index == 3)
    {
        [self GetBeginMonthKLine : currentMonth : currentYear : nOldMonth : nOldYear];
    }
    
    return;
}

-(void)receiveNotification:(int)currentYear :(int)currentMonth :(int)currentDay
{
    int index = m_ToolbarView.selectedSegmentIndex;
    int nOldYear,nOldMonth ,nOldDay;
    
    [self getOldData:currentYear :currentMonth :currentDay 
                    :&nOldYear :&nOldMonth :&nOldDay];
    if(index == 1)
    {
        [m_netStockInfo StartNetStockInfoOfDay:m_strStockCode :nOldYear :nOldMonth :nOldDay :currentYear :currentMonth :currentDay : @"d"];
    }
    if(index == 2)
    {
        [m_netStockInfo StartNetStockInfoOfDay:m_strStockCode :nOldYear :nOldMonth :nOldDay :currentYear :currentMonth :currentDay : @"w"];
    }
    if(index == 3)
    {
        [m_netStockInfo StartNetStockInfoOfDay:m_strStockCode :nOldYear :nOldMonth :nOldDay:currentYear :currentMonth :currentDay : @"m"];
    }
    if(index == 0)
    {
        [m_netStockInfo StartNetStockInfoOfMinute:m_strStockCode];
    }
}
//重新加载当前页面
-(void)CurrentViewFresh
{
    m_datasourceImage.image = nil;    
    
    NSDate *  senddate=[NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSInteger unitFlags = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    NSDateComponents *conponent = [cal components:unitFlags fromDate:senddate];
    NSInteger currentYear = [conponent year];
    NSInteger currentMonth = [conponent month];
    NSInteger currentDay = [conponent day];
    
    [self receiveNotification:currentYear :currentMonth :currentDay];
    
    [self.view addSubview:m_datasourceImage];
    
}

-(void)ChangeStockCode : (NSString*) strStockCode
{
    
}

-(void)BuildDayCount : (int) nDayCount
{
    
}
-(void)BuildWeekCount : (int) nWeekCount
{
    
}
-(void)BuildMonthCount : (int) nMonthCount
{
    
}
@end
