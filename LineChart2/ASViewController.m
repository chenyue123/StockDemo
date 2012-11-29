//
//  ASViewController.m
//  LineChart2
//
//  Created by chenyue on 12-11-15.
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
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //背景颜色
    self.view.backgroundColor = [UIColor blackColor];
    
    //屏幕大小
    CGRect rectScreen = [[UIScreen mainScreen] bounds];
    
    double toolbarFrameX = rectScreen.origin.x + 20;
    double toolbarFrameY = 0.4 * rectScreen.size.height;
    double toolbarFrameWidth = rectScreen.size.width - 40;
    double toolbarFrameHeight = 0.075 * rectScreen.size.height;
    CGRect frame = CGRectMake(toolbarFrameX, toolbarFrameY, toolbarFrameWidth, toolbarFrameHeight);
    NSArray *array = [[NSArray alloc]initWithObjects:@"分时",@"日K",@"周K",@"月K" ,nil];
    
    UIColor *redColor = [UIColor darkGrayColor];
    UIColor *blueColor = [UIColor lightGrayColor];
    UIColor *yellowColor = [UIColor whiteColor];
    
    double griddingImageX = rectScreen.origin.x + 30;
    double griddingImageY = 0.5 * rectScreen.size.height;
    double griddingImageWidth = rectScreen.size.width - 60;
    double griddingImageHeight = 0.35 * rectScreen.size.height;
    
    UIImageView *griddingImage = [[UIImageView alloc]initWithFrame:CGRectMake(griddingImageX , griddingImageY, griddingImageWidth, griddingImageHeight)];
    
    double dataSourceImageX = rectScreen.origin.x + 30 + 1;
    double dataSourceImageY = 0.5 * rectScreen.size.height + 1;
    double dataSourceImageWidth = rectScreen.size.width - 60 - 2;
    double dataSourceImageHeight = 0.35 * rectScreen.size.height - 2;
    UIImageView *dataSourceImage = [[UIImageView alloc]initWithFrame:CGRectMake(dataSourceImageX, dataSourceImageY, dataSourceImageWidth, dataSourceImageHeight)];
    
    NSString * strJsMinString = @"sh000001";
    
    m_stockDataViewController = [[ASStockDataViewController alloc]init:frame :array :redColor :blueColor :yellowColor :griddingImage :dataSourceImage :strJsMinString];
    
    [self.view addSubview:m_stockDataViewController.view];
    
    UIImageView * imageBackGround = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 310, 150)];
    m_stockPaneViewlController = [[ASStockPanelController alloc] init :imageBackGround];
    [self.view addSubview:m_stockPaneViewlController.view];
    
    
    
    UIImageView *labelImage = [[UIImageView alloc]initWithFrame:CGRectMake(0 , griddingImageY, 320, griddingImageHeight)];
    labelImage.backgroundColor = [UIColor clearColor];
    m_stockLabel = [[ASStockLabel alloc]init:labelImage :10 :[UIColor grayColor]];
    [m_stockLabel AddStockPriceLabel];
    [self.view addSubview:[m_stockLabel GetLabelImg]];
    
    
    m_inputTextFieldStockCode = [[UITextField alloc] initWithFrame:CGRectMake(5,0, 220, 30)];
    m_inputTextFieldStockCode.borderStyle = UITextBorderStyleRoundedRect;
    m_inputTextFieldStockCode.keyboardType = UIKeyboardTypeDefault;
    m_inputTextFieldStockCode.placeholder = @"请输入股票代码";
    m_inputTextFieldStockCode.delegate = self;
    [self.view addSubview:m_inputTextFieldStockCode];
    
    UIButton * buttonChangeStockCode = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonChangeStockCode.frame = CGRectMake(235, 0, 70, 30);
    [buttonChangeStockCode setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:buttonChangeStockCode];
    [buttonChangeStockCode addTarget:self action:@selector(ButtonChangeStockCodePressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * labelButtonChangeStockCode = [[UILabel alloc] init];
    labelButtonChangeStockCode.frame = CGRectMake(20, 0, 30, 30);
    labelButtonChangeStockCode.text = @"查询";
    //labelButtonChangeStockCode.textColor = [UIColor whiteColor];
    labelButtonChangeStockCode.font = [UIFont boldSystemFontOfSize:15];
    labelButtonChangeStockCode.backgroundColor = [UIColor clearColor];
    [buttonChangeStockCode addSubview:labelButtonChangeStockCode];
}

-(IBAction)ButtonChangeStockCodePressed:(id)sender
{
    NSString * strNewStockCode = [[NSString alloc] initWithFormat:@"%@",m_inputTextFieldStockCode.text];
    [m_stockPaneViewlController ChangeStockCode:strNewStockCode];
    [m_stockDataViewController ChangeStockCode:strNewStockCode];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [m_inputTextFieldStockCode resignFirstResponder];
    return YES;
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
