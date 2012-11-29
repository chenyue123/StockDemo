//
//  ASNetStockInfo.m
//  WEB
//
//  Created by WangM on 12-11-20.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASNetStockInfo.h"

@implementation ASNetStockInfo
-(id)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.title = NSLocalizedString(@"WebTitle", @"");
    
	CGRect webFrame = CGRectMake(WEB_FRAME_X,WEB_FRAME_Y,WEB_FRAME_WIDTH,WEB_FRAME_HEIGHT);
    
    m_arrayNextNet = [[NSMutableArray alloc] initWithCapacity:0];
    m_strInfoString = [[NSMutableString alloc]initWithString:@""];
    m_dictURLType = [[NSMutableDictionary alloc]init];
    
	m_webView = [[UIWebView alloc] initWithFrame:webFrame];
	m_webView.backgroundColor = [UIColor whiteColor];
	m_webView.scalesPageToFit = YES;
	m_webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	m_webView.delegate = self;
    
    self.view.frame = webFrame;
	[self.view addSubview: m_webView];
}

-(NSString *)FormatUrlString:(NSString *)aMyJsString
{
    NSString *firstChar = [aMyJsString substringToIndex:2];
    NSString *upperStr = [firstChar uppercaseString];
    NSString *strMyJsStringValue = [aMyJsString substringFromIndex:2];
    NSString * strMyStockUrl;
    if([upperStr isEqualToString:@"SH"])
    {
        strMyStockUrl = [NSString stringWithFormat:@"http://data.gtimg.cn/flashdata/hushen/minute/sh%@.js?maxage=10",strMyJsStringValue];
    }
    if([upperStr isEqualToString:@"SZ"])
    {
        strMyStockUrl = [NSString stringWithFormat:@"http://data.gtimg.cn/flashdata/hushen/minute/sz%@.js?maxage=10",strMyJsStringValue];
    }
    return strMyStockUrl;
}

-(BOOL)  AddURLInfo: (NSString *) strURL : (NSString*) strStockCode : (int) nType
{
    ASStockURLInfo* stockURLInfo = [[ASStockURLInfo alloc]init :strURL : strStockCode];
    [m_arrayNextNet addObject:stockURLInfo];
    NSNumber* nsNumType = [[NSNumber alloc]initWithInt:nType];
    [m_dictURLType setObject:nsNumType forKey:strURL];
    
    if (m_arrayNextNet.count == ARR_NEXT_NET_COUNT) {
        [m_strInfoString setString:strURL];
       
        return TRUE;
    }
    return FALSE;
}

-(void) StartNetStockInfoOfMinute : (NSString *)aJsString 
{
    //[m_webView stopLoading];
    NSString *strURL = [self FormatUrlString:aJsString];

    BOOL bRequest = [self AddURLInfo : strURL :aJsString : NET_MINUTE];
    if (!bRequest)  return;
        
    [m_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:m_strInfoString]]];
}

-(void) StartNetStockInfoOfDay :(NSString *)aJsString : (NSInteger) dataBeginYear :(NSInteger)dataBeginMonth : (NSInteger)dataBeginDay: (NSInteger) dataEndYear : (NSInteger)dataEndMonth :(NSInteger)dataEndDay :(NSString *)strType
{    
    int n_beginMonth = dataBeginMonth - 1;
    int n_endMonth = dataEndMonth - 1;
    
    NSString *firstChar = [aJsString substringToIndex:2];
    NSString *upperStr = [firstChar uppercaseString];
    NSString *strURL;
    NSString *JsStringValue = [aJsString substringFromIndex:2];
    if([upperStr isEqualToString:@"SH"])
    {
        strURL = [NSString stringWithFormat:@"http://ichart.yahoo.com/table.csv?s=%@.ss&a=%d&b=%d&c=%d&d=%d&e=%d&f=%d&g=%@",JsStringValue,n_beginMonth,dataBeginDay,dataBeginYear,n_endMonth,dataEndDay,dataEndYear,strType];
    }
    if([upperStr isEqualToString:@"SZ"])
    {
        strURL = [NSString stringWithFormat:@"http://ichart.yahoo.com/table.csv?s=%@.sz&a=%d&b=%d&c=%d&d=%d&e=%d&f=%d&g=%@",JsStringValue,n_beginMonth,dataBeginDay,dataBeginYear,n_endMonth,dataEndDay,dataEndYear,strType];
    }
    
    //m_strDayString = tmp;
    BOOL bRequest = [self AddURLInfo : strURL : aJsString : NET_KLINE];
    if (!bRequest)  return;
    
    [m_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:m_strInfoString]]];

}
-(void) StartNetStockInfoOfDay :(NSString *)aJsString :(int)nType
{    
    NSString *firstChar = [aJsString substringToIndex:2];
    NSString *lowerStr = [firstChar lowercaseString];
    NSString *strURL;
    NSString *JsStringValue = [aJsString substringFromIndex:2];
    NSString *strKLineCircle = [[NSString alloc]init];
    if(nType == 1)
    {
        strKLineCircle = @"daily";
    }
    if(nType == 2)
    {
        strKLineCircle = @"weekly";
    }
    if(nType == 3)
    {
        strKLineCircle = @"monthly";
    }
    if([lowerStr isEqualToString:@"sh"])
    {
        strURL = [NSString stringWithFormat:@"http://data.gtimg.cn/flashdata/hushen/latest/%@/sh%@.js?maxage=43201",strKLineCircle,JsStringValue];
    }
    if([lowerStr isEqualToString:@"sz"])
    {
        strURL = [NSString stringWithFormat:@"http://data.gtimg.cn/flashdata/hushen/latest/%@/sz%@.js?maxage=43201",strKLineCircle,JsStringValue];
    }
    
    //m_strDayString = tmp;
    BOOL bRequest = [self AddURLInfo : strURL : aJsString : NET_KLINE];
    if (!bRequest)  return;
    
    [m_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:m_strInfoString]]];
}


#pragma mark -
#pragma mark UIWebViewDelegate

- (void) RequestListURL
{
    for (int n = 0; n != m_arrayNextNet.count ; n++)
    {
        ASStockURLInfo* stockURLInfo = [m_arrayNextNet objectAtIndex : n];
        NSString *strStockURL = [stockURLInfo GetStockURL];
        
        if ([strStockURL isEqualToString : m_strInfoString ])
        {
            [m_arrayNextNet removeObjectAtIndex : n];
            [m_dictURLType removeObjectForKey:m_strInfoString];
            if (m_arrayNextNet.count != 0) {
                ASStockURLInfo* stockCurrentURLInfo = [m_arrayNextNet objectAtIndex : 0];
                NSString* strCurrentURL = [stockCurrentURLInfo  GetStockURL];
                [m_strInfoString setString:strCurrentURL];
                [m_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:strCurrentURL]]];
            }
            break;
        }
    }
    return;
}

- (void) SendNoticeWithType : (NSDictionary*) dicInfo :(int) nType
{
    NSNotification * notification;
    
    if(nType == NET_MINUTE)
    {
        notification = [NSNotification notificationWithName:@"GetHtmlContentMinute" object:nil userInfo:dicInfo];
    }
    if(nType == NET_KLINE)
    {
        notification = [NSNotification notificationWithName:@"GetHtmlContentKLine" object:nil userInfo:dicInfo];
    }
    //发通知
    if (notification != nil)
    {
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString *strContentJs = @"document.documentElement.innerText";
    NSString *strHtml = [webView stringByEvaluatingJavaScriptFromString:strContentJs];
    NSString *strContent = [[NSString alloc]initWithFormat:@"html_content"];
    
    NSString *strName = [[NSString alloc]initWithFormat:@"stockCode"];
    ASStockURLInfo* stockURLInf = [m_arrayNextNet objectAtIndex : 0];
    NSString *strCode = [stockURLInf GetStockCode];
    
    NSMutableDictionary * dictContentInfo = [[NSMutableDictionary alloc]init];
    
    [dictContentInfo setObject : strHtml forKey : strContent];
    [dictContentInfo setObject : strCode forKey : strName];
    
    NSNumber *nsType = [m_dictURLType objectForKey : m_strInfoString];
    
    [self SendNoticeWithType : dictContentInfo : nsType.intValue];
    [self RequestListURL];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	// load error, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
   
    
	// report the error inside the webview
}

@end
