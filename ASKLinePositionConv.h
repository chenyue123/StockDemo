//
//  ASPositionConv.h
//  LineChart2
//
//  Created by  on 12-11-16.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASPosConv.h"

@interface ASKLinePositionConv : ASPosConv
{
    //分别保存最高点和最低点，把stockinfo压到数组
    NSMutableArray * m_arrStockInfos;
    NSMutableArray * m_arrStockPosInfo;
    
    double m_dbHighestPrice;
    double m_dbLowestPrice;
    
    UIImageView *  m_imageView;
    
    int m_nArrStockPosInfoIndex;
}

-(id) init:(UIImageView *) aImageView;

-(BOOL) AddStockInfo : (ASStockPriceInfo*)stockInfo;

-(void) CreatePos;

-(ASStockDrawInfo*) GetNextPosInfo;

-(void) ResetCount;

-(void) ResetInfo;




@end
