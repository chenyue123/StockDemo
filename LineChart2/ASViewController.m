//
//  ASViewController.m
//  LineChart2
//
//  Created by  on 12-11-15.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASViewController.h"

@implementation ASViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
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
        
        NSLog(@"%d  开盘%f 最高%f 最低%f 结束%f\n",i,beginPrice,highPrice,lowPrice,endPrice);

        if (highPrice == lowPrice)
            continue;
        ASStockPriceInfo *tmp = [[ASStockPriceInfo alloc]initWithHighestPrice:highPrice andLowestPrice:lowPrice andBeginPrice:beginPrice andEndPrice:endPrice];
        NSLog(@"%@",tmp);
        [m_drawKLineController AddStockInfo:tmp]; 
        
    }
    
    [m_drawKLineController DrawAllKLineInfo];
    }
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect frame = CGRectMake(0, 30, 320, 40);
    NSArray *array = [[NSArray alloc]initWithObjects:@"分时",@"日K",@"周K",@"月K" ,nil];
    //背景颜色
    self.view.backgroundColor = [UIColor blackColor];
    
    //屏幕大小
    CGRect rectScreen = [[UIScreen mainScreen] bounds];
    
    
    UIColor *redColor = [UIColor darkGrayColor];
    UIColor *blueColor = [UIColor lightGrayColor];
    UIColor *yellowColor = [UIColor whiteColor];
    
    UIImageView *griddingImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 320, 200)];
    //UIImageView *griddingImage = [[UIImageView alloc]initWithFrame:rectScreen];
    
    UIImageView *dataSourceImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 320, 200)];
    NSString * strJsMinString = @"600031";
    
    m_MainView = [[ASStockDataView alloc]init:frame :array :redColor :blueColor :yellowColor :griddingImage :dataSourceImage :strJsMinString];
    
    [self.view addSubview:m_MainView.view];
    
}

-(int)getOldYear:(int)currentYear :(int)currentMonth :(int)currentDay
{
    int oldYear;
    if(currentMonth > 3)
    {
        oldYear = currentYear;
    }
    if(currentMonth <= 3)
    {
        oldYear = currentYear - 1;
    }
    return oldYear;
}
-(int)getOldMonth:(int)currentYear :(int)currentMonth :(int)currentDay
{
    int oldMonth;
    if(currentMonth > 3)
    {
        oldMonth = currentMonth - 3;
    }
    if(currentMonth <= 3)
    {
        oldMonth = currentMonth + 9;
    }
    return oldMonth;
}
-(int)getOldDay:(int)currentYear :(int)currentMonth :(int)currentDay
{
    int oldDay;
    if(currentMonth > 3)
    {
        if(currentDay <= 28)
        {
            oldDay = currentDay;
        }else{
            oldDay = 28;
        }
    }
    if(currentMonth <= 3)
    {
        if(currentDay <= 28)
        {
            oldDay = currentDay;
        }else{
            oldDay = 28;
        }
    }
    return oldDay;
}
-(void)receiveNotification:(int)currentYear :(int)currentMonth :(int)currentDay
{
    int index = m_Toolbar.selectedSegmentIndex;
    NSString * strJsMinString = @"600031"; 
    if(index == 1)
    {
        int oldYear = [self getOldYear:currentYear :currentMonth :currentDay];
        int oldMonth = [self getOldMonth:currentYear :currentMonth :currentDay];
        int oldDay = [self getOldDay:currentYear :currentMonth :currentDay];
        [m_netStockInfo StartNetStockInfoOfDay:strJsMinString :oldYear :oldMonth :oldDay :currentYear :currentMonth :currentDay : @"d"];
    }
    if(index == 2)
    {
        int oldDay = currentDay;
        int oldMonth = currentMonth;
        int oldYear = currentYear - 1;
        [m_netStockInfo StartNetStockInfoOfDay:strJsMinString :oldYear :oldMonth :oldDay :currentYear :currentMonth :currentDay : @"w"];
    }
    if(index == 3)
    {
        int oldYear = currentYear - 4;
        int oldMonth = currentMonth;
        int oldDay = currentDay;
        [m_netStockInfo StartNetStockInfoOfDay:strJsMinString :oldYear :oldMonth :oldDay :currentYear :currentMonth :currentDay : @"m"];
    }
    if(index == 0)
    {
        [m_netStockInfo StartNetStockInfoOfMinute:strJsMinString];
    }
}
-(IBAction)segmentAction:(id)sender
{ 
    m_ImageLine.image = nil;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetHtmlContentKLine:) name:@"GetHtmlContentKLine" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetHtmlContentMinute:) name:@"GetHtmlContentMinute" object:nil];
    
    
    NSDate *  senddate=[NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSInteger unitFlags = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    NSDateComponents *conponent = [cal components:unitFlags fromDate:senddate];
    NSInteger currentYear = [conponent year];
    NSInteger currentMonth = [conponent month];
    NSInteger currentDay = [conponent day];
    
    [self receiveNotification:currentYear :currentMonth :currentDay];

    [self.view addSubview:m_ImageLine];
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
