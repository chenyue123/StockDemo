//
//  ASPosConv.h
//  StockFinance
//
//  Created by xyooyy on 12-11-18.
//  Copyright (c) 2012年 xyooyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASStockPriceInfo.h"
#import "ASStockDrawInfo.h"
#import "ASStockPosInfo.h"

@interface ASPosConv : NSObject

-(id) init:(UIImageView *) aImageView;

-(BOOL) AddStockInfo : (ASStockPriceInfo*)stockInfo;

-(void) CreatePos;

-(NSObject*) GetNextPosInfo ;

-(void) ResetCount;

-(void) ResetInfo;

@end
