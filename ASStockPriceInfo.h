//
//  ASStockInfo.h
//  Finance
//
//  Created by WangM on 12-11-13.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASStockPriceInfo : NSObject
{
    double m_dbHighestPrice;
    double m_dbLowestPrice;
    double m_dbBeginPrice;
    double m_dbEndPrice;
}

-(id) initWithHighestPrice : (double) dbHighestPrice1 andLowestPrice : (double) dbLowestPrice1 andBeginPrice : (double) dbBeginPrice1 andEndPrice : (double) dbEndPrice1;

-(double) GetHighestPrice;
-(double) GetLowestPrice;
-(double) GetBeginePrice;
-(double) GetEndPrice;

@end
