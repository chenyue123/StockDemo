//
//  ASNetStockInfo.h
//  WEB
//
//  Created by WangM on 12-11-20.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NetMinute 1
#define NetKLine  2

@interface ASNetStockInfo : UIViewController<UIWebViewDelegate>
{
    UIWebView * m_webView;
    NSMutableString * m_strInfoString;
    //int m_nNetType;
    NSMutableDictionary* m_dictURLType;
    NSMutableArray * m_arrayNextNet;
}

-(id)init;
-(void) StartNetStockInfoOfMinute : (NSString *)aJsString;
-(void) StartNetStockInfoOfDay :(NSString *)aJsString : (int) dataBeginYear :(int)dataBeginMonth : (int)dataBeginDay: (int) dataEndYear : (int)dataEndMonth :(int)dataEndDay :(NSString *)strType;
//-(NSString *)FormatUrlString:(NSString *)aJsString;

@end
