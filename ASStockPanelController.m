//
//  ASUpDemoViewController.m
//  UpDemo
//
//  Created by WangM on 12-11-23.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockPanelController.h"

@interface ASStockPanelController ()

@end

@implementation ASStockPanelController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init:(UIImageView *)aImageViewBackground
{
    self = [super init];
    if (self != nil) {
        m_imageViewBackground = aImageViewBackground;
        self.view.frame = aImageViewBackground.frame;
        m_strCurrentStockCode= [[NSString alloc] init];
    }
    return self;
}

-(void) GetHtmlContent:(NSNotification *)notification
{
    NSDictionary *userInfo= [notification userInfo];
    //NSLog(@"观察者中的：%@",userInfo);
    
    
    NSString * strNetData = [userInfo objectForKey:@"HtmlContent"];
    //NSLog(@"%@",strNetData);
    
    NSArray  * array= [strNetData componentsSeparatedByString:@","];
    //NSLog(@"%@",array);
    
    if (array.count == 1) {
        return;
    }
    
    //NSString * strStockName = [[NSString alloc] initWithFormat:@"%@",[array objectAtIndex:0]];
    //NSLog(@"%@",strStockName);
    
    m_dbIndex = [[array objectAtIndex:3] doubleValue];
    [m_showDataView ShowIndex:m_dbIndex];
    
    //没得到的
    [m_showDataView ShowAddOrSubPrice:-19.42];
    [m_showDataView ShowAddOrSubRate:-0.96];
    
    m_dbTodayBeginPrice = [[array objectAtIndex:1] doubleValue];
    [m_showDataView ShowTodayBeginPrice:m_dbTodayBeginPrice];
    
    m_dbYesterdayEndPrice = [[array objectAtIndex:2] doubleValue];
    [m_showDataView ShowYesterdayEndPrice:m_dbYesterdayEndPrice];
    
    
    m_dbDoneDealPrice = [[array objectAtIndex:9] doubleValue]/100000000;
    [m_showDataView ShowDoneDealPrice:m_dbDoneDealPrice];
    
    //没得到的
    [m_showDataView ShowSwingPercent:0.61];
    
    m_dbTodayHighestPrice = [[array objectAtIndex:4] doubleValue];
    [m_showDataView ShowTodayHighestPrice:m_dbTodayHighestPrice];
    
    m_dbTodayLowestPrice = [[array objectAtIndex:5] doubleValue];
    [m_showDataView ShowTodayLowestPrice:m_dbTodayLowestPrice];
    
    
    m_dbDealNumber = [[array objectAtIndex:8] doubleValue]/10000;
    [m_showDataView ShowDealNumber:m_dbDealNumber];
    
    //没得到的
    [m_showDataView ShowRiseNumber:100];
    [m_showDataView ShowSmoothNumber:36];
    [m_showDataView ShowFallNumber:805];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetHtmlContent:) name:@"GetHtmlContent" object:nil];
    
    m_currentStockInfo = [[ASStockCurrentInfo alloc]init];
    //NSString * strJsMinString = @"sh000001";
    m_strCurrentStockCode = @"sh000001";
    [m_currentStockInfo StartNetStockInfoOfMinute:m_strCurrentStockCode];
    [self.view addSubview:m_currentStockInfo];
    
    m_showDataView = [[ASStockPanelView alloc] init:m_imageViewBackground];
    m_imageViewBackground.backgroundColor = [UIColor blackColor];
    [self.view addSubview:m_imageViewBackground];
}

-(void)ChangeStockCode:(NSString*)aStockCode
{
    m_strCurrentStockCode = aStockCode;
    [m_currentStockInfo StartNetStockInfoOfMinute:m_strCurrentStockCode];
}
-(void)CurrentViewFresh
{
    [m_currentStockInfo WebViewFresh];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
