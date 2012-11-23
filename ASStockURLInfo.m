//
//  ASStockURLInfo.m
//  LineChart2
//
//  Created by xyooyy on 12-11-23.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockURLInfo.h"

@implementation ASStockURLInfo

-(id) init : (NSString*) strURL : (NSString*) strStockCode
{
    self = [super init];
    if (self != nil) {
        m_strURL = [[NSString alloc]initWithString:strURL];
        m_strStockCode = [[NSString alloc]initWithString:strStockCode];
    }
    return self;
}
-(NSString*) GetStockURL
{
    return m_strURL;
}
-(NSString*) GetStockCode
{
    return m_strStockCode;
}

@end
