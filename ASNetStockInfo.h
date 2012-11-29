//
//  ASNetStockInfo.h
//  WEB
//
//  Created by WangM on 12-11-20.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASStockURLInfo.h"
#import "HeadDefine.h"



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
-(void) StartNetStockInfoOfDay :(NSString *)aJsString : (int) dataBeginYear
                               :(int)dataBeginMonth : (int)dataBeginDay
                               : (int) dataEndYear : (int)dataEndMonth
                               :(int)dataEndDay : (NSString *)strType;
-(void) StartNetStockInfoOfDay :(NSString *)aJsString :(int)nType;

@end
