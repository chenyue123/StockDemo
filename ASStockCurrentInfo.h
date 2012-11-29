//
//  ASNetStockInfo.h
//  WEB
//
//  Created by WangM on 12-11-20.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASStockCurrentInfo : UIView<UIWebViewDelegate>
{
    UIWebView * m_webView;
    NSMutableString * m_strMinString;
}

-(id)init;
-(void) StartNetStockInfoOfMinute : (NSString *)aJsString;
-(NSString *)FormatUrlString:(NSString *)aJsString;
-(void)WebViewFresh;

@end
