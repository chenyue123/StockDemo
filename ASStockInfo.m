//
//  ASStockInfo.m
//  Finance
//
//  Created by WangM on 12-11-13.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import "ASStockInfo.h"

@implementation ASStockInfo

-(id) initWithHighestPrice : (double) dbHighestPrice1 andLowestPrice : (double) dbLowestPrice1 andBeginPrice : (double) dbBeginPrice1 andEndPrice : (double) dbEndPrice1
{
    self = [super init];
    if (self != nil) {
        m_dbHighestPrice = dbHighestPrice1;
        m_dbLowestPrice = dbLowestPrice1;
        m_dbBeginPrice = dbBeginPrice1;
        m_dbEndPrice = dbEndPrice1;
    }
    return self;
}

-(double) GetHighestPrice
{
    return m_dbHighestPrice;
}

-(double) GetLowestPrice
{
    return m_dbLowestPrice;
}

-(double) GetBeginePrice
{
    return m_dbBeginPrice;
}

-(double) GetEndPrice
{
    return m_dbEndPrice;
}

@end
