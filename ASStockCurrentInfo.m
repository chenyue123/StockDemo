//
//  ASNetStockInfo.m
//  WEB
//
//  Created by WangM on 12-11-20.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockCurrentInfo.h"

@implementation ASStockCurrentInfo

-(id)init
{
    self = [super init];
    if (self != nil) {
        m_webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,0,0)];
        m_webView.backgroundColor = [UIColor clearColor];
        m_webView.scalesPageToFit = YES;
        m_webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        m_webView.delegate = self;
        [self addSubview:m_webView];
    }
    return self;
}

-(void) StartNetStockInfoOfMinute : (NSString *)aJsString 
{
    [m_webView reload];
    m_strMinString = [[NSMutableString alloc] initWithCapacity:0];
    m_strMinString = [self FormatUrlString:aJsString];
    NSURL * url = [NSURL URLWithString:m_strMinString];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [m_webView loadRequest:request];
    
}

-(NSString *)FormatUrlString:(NSString *)aMyJsString
{
    NSString * strMyStockUrl = [NSString stringWithFormat:@"http://hq.sinajs.cn/list=%@",aMyJsString];
    return strMyStockUrl;
}

-(void)WebViewFresh
{
    [m_webView reload];
}

//去掉HTML标签函数
- (NSString *)flattenHTML:(NSString *)html {
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@" "];
        
    } // while //
    
    return html;
    
}

#pragma mark -
#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    
    NSString * lJs = @"document.body.innerHTML";
    NSString * lHtml1 = [m_webView stringByEvaluatingJavaScriptFromString:lJs];
    //NSLog(@"%@",lHtml1);
    NSString * strFlattenedNetData =  [self flattenHTML:lHtml1];
    //NSLog(@"%@",strFlattenedNetData);
    
    NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:strFlattenedNetData, @"HtmlContent",nil];
    
    //NSLog(@"%@",dict);
    NSNotification * notification= [NSNotification notificationWithName:@"GetHtmlContent" object:nil userInfo:dict];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	// load error, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
	// report the error inside the webview
    if ([error code] != NSURLErrorCancelled) {
        //show error alert, etc.
        NSString* errorString = [NSString stringWithFormat: @"<html><center><font size=+5 color='red'>An error occurred:<br>%@</font></center></html>",error.localizedDescription];
        [m_webView loadHTMLString:errorString baseURL:nil];
    }
	
}

@end
