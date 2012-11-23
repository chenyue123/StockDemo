//
//  ASKLineController.h
//  Finance
//
//  Created by WangM on 12-11-16.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASKLinePositionConv.h"
#import "ASStockDrawInfo.h"
#import "ASStockPriceInfo.h"
#import "ASDrawKLine.h"

@interface ASKLineController : UIView
{
    ASKLinePositionConv * m_positionConv;
    UIImageView * m_backgroundImage;
}

-(id)init : (UIImageView *)aImageView;
-(void) AddStockInfo : (ASStockPriceInfo *) aStockInfo;
-(void) DrawAllKLineInfo;
-(void) Reset;

@end
