//
//  ASStockURLInfo.h
//  LineChart2
//
//  Created by xyooyy on 12-11-23.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASStockURLInfo : NSObject
{
    NSString* m_strURL;
    NSString* m_strStockCode;
}

-(id) init : (NSString*) strURL : (NSString*) strStockCode;
-(NSString*) GetStockURL;
-(NSString*) GetStockCode;

@end
