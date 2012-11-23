//
//  ASPositionConv.m
//  LineChart2
//
//  Created by  on 12-11-16.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//
#import "ASKLinePositionConv.h"

@implementation ASKLinePositionConv


-(double)convertBeginOrEnd:(ASStockPriceInfo *) aStockInfo
{
    double begin = [aStockInfo GetBeginePrice];
    double end = [aStockInfo GetEndPrice];
    
    double dbBeginOrEnd = begin;
    
    if (end > begin) {
        dbBeginOrEnd = end;
    }
    
    return dbBeginOrEnd;
}

-(double)convertRectHeightToLocation:(ASStockPriceInfo *) aStockInfo
{
    double begin = [aStockInfo GetBeginePrice];
    double end = [aStockInfo GetEndPrice];
    
    double rectHeight = fabs(end - begin);
    return rectHeight;
}

-(UIColor *) GetKLineColor : (ASStockPriceInfo*)aStockInfo
{
    double begin = [aStockInfo GetBeginePrice];
    double end = [aStockInfo GetEndPrice];
    UIColor * color = [UIColor redColor];
    if (begin > end) {
        color = [UIColor greenColor];
    }
    return color;
}

-(id) init : (UIImageView *) aImageView
{
    self = [super init];
    if (self != nil) {
        m_arrStockInfos = [[NSMutableArray alloc] initWithCapacity:0];
        m_arrStockPosInfo = [[NSMutableArray alloc] initWithCapacity:0];
        m_imageView = aImageView;
        m_nArrStockPosInfoIndex = 0;
        m_dbHighestPrice = 0;
        m_dbLowestPrice = 1e+32;
    }
    
    return self;
}
-(BOOL) AddStockInfo : (ASStockPriceInfo*)stockInfo
{
    [m_arrStockInfos addObject:stockInfo];
    
    double dbStockHigh = [stockInfo GetHighestPrice];
    double dbStockLow = [stockInfo GetLowestPrice];
    
    if (dbStockHigh > m_dbHighestPrice)
    {
        m_dbHighestPrice = dbStockHigh;
    }
    
    if (dbStockLow < m_dbLowestPrice) {
        m_dbLowestPrice = dbStockLow;
    }
    
    
    return true;
}

-(void) CreatePos
{
    double dbDiff = m_dbHighestPrice-m_dbLowestPrice;
    double Pixel = m_imageView.frame.size.height/(dbDiff*100);
    double rectWidth = m_imageView.frame.size.width/m_arrStockInfos.count;
    
    for (int i = 0; i != m_arrStockInfos.count;i++){
        
        ASStockPriceInfo * stockInfo = [m_arrStockInfos objectAtIndex:i];
        
        double dbXLocation = rectWidth*i+rectWidth/2;
        double dbPriceHeight = [self convertRectHeightToLocation:stockInfo];
        double dbrectHeight = dbPriceHeight*Pixel*100;
        
        double dbHighestPrice = [stockInfo GetHighestPrice];
      
        double dbHighDiff = m_dbHighestPrice-dbHighestPrice;
        double dbHighestYLocation = dbHighDiff*Pixel*100;
      
        CGPoint cgpHighest = CGPointMake(dbXLocation, dbHighestYLocation);
      
        double lowestPrice = [stockInfo GetLowestPrice];
        double dbLowDiff = lowestPrice-m_dbLowestPrice;
        
        double dbLowestLocation = m_imageView.frame.size.height - dbLowDiff*Pixel*100;
      
        CGPoint cgpLowest = CGPointMake(dbXLocation, dbLowestLocation);
      
        double dbBeginOrEnd = [self convertBeginOrEnd:stockInfo];
        double dbRectHeightHalf = [self convertRectHeightToLocation:stockInfo]/2;
        
        double dbPriceMidDiff = m_dbHighestPrice - dbBeginOrEnd+dbRectHeightHalf;
        double dbRectCenterY = dbPriceMidDiff*Pixel*100;
        
        CGPoint cgpRectCenter = CGPointMake(dbXLocation, dbRectCenterY);
      
        UIColor * color = [self GetKLineColor:stockInfo];
        
        ASStockDrawInfo * stockPosInfo = [[ASStockDrawInfo alloc] initWithHighestPos:cgpHighest andWithLowestPos:cgpLowest andWithRectCenterPos:cgpRectCenter andWithRectWidth:rectWidth andWithRectHeight:dbrectHeight andColorKLine:color];
        
      
      [m_arrStockPosInfo addObject:stockPosInfo];
    }
}

-(ASStockDrawInfo*) GetNextPosInfo 
{
        
    int stockPosInfoCount = m_arrStockPosInfo.count;
    
    if (stockPosInfoCount <= m_nArrStockPosInfoIndex) {
        return nil;
    }
    
    
    ASStockDrawInfo * stockPosInfo = [m_arrStockPosInfo objectAtIndex:m_nArrStockPosInfoIndex];
    m_nArrStockPosInfoIndex++;
    return stockPosInfo;
}

-(void) ResetCount
{
    m_nArrStockPosInfoIndex = 0;
}


-(void) ResetInfo
{
    [m_arrStockInfos removeAllObjects];
    [m_arrStockPosInfo removeAllObjects];
    m_nArrStockPosInfoIndex = 0;
    m_dbHighestPrice = 0;
    m_dbLowestPrice = 1e+32;
    
}


@end
