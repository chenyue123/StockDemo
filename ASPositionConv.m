//
//  ASPositionConv.m
//  LineChart2
//
//  Created by  on 12-11-16.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//
#import "ASPositionConv.h"

@implementation ASPositionConv

//-(id)initWith:(NSMutableArray *)arrStockInfo
//{
//    self = [super init];
//    if(self)
//    {
//        m_arrStockInfo = arrStockInfo;
//        m_nCount = 0;
//    }
//    return self;
//}
-(id)init :(UIImageView*)image
{
    self = [super init];
    if(self)
    {
        m_nCount = 0;
        m_arrStockInfoPos = [[NSMutableArray alloc]initWithCapacity:0];
        m_imageView = image;
        m_arrStockInfo = [[NSMutableArray alloc]initWithCapacity:0];
        m_dbHighestPoint = 0;
        m_dbLowestPoint = 100000;
        
    }
    return self;
}

-(BOOL) AddStockInfo : (ASStockInfo*)stockInfo 
{
    [m_arrStockInfo addObject:stockInfo];
    double tmp = [stockInfo GetEndPrice];
    if(m_dbHighestPoint < tmp)
    {
        m_dbHighestPoint = tmp;
        return TRUE;
    }
    if(m_dbLowestPoint > tmp)
    {
        m_dbLowestPoint = tmp;
        return TRUE;
    }
    return false;
}
//数组
-(void) CreateLineChartPos
{
    //已知最高点和最低点，创建数组
    double dFirstPoint = [[m_arrStockInfo objectAtIndex:0] GetEndPrice];
    //最高点与第一个点的差值
    double dDiff1 = m_dbHighestPoint - dFirstPoint;
    //第一个点与最低点的差值
    double dDiff2 = dFirstPoint - m_dbLowestPoint;
        
    double dbHeight = m_imageView.frame.size.height / 2;
    
    
    
    if(dDiff1 >= dDiff2)
    {
        m_dbUnitY = dbHeight / dDiff1;
    }
    if(dDiff1 < dDiff2)
    {
        m_dbUnitY = dbHeight / dDiff2;
    }
        
    [self SaveInMutableArray];
    

}

-(void)SaveInMutableArray
{
    double dFirstPoint = [[m_arrStockInfo objectAtIndex:0] GetEndPrice];
    double dbHeight = m_imageView.frame.size.height / 2;
    double dbUnitX = m_imageView.frame.size.width / 240;
    CGPoint tmp;
    tmp.x = 0;
    tmp.y = dbHeight;
    ASStockPosInfo *firstPoint = [[ASStockPosInfo alloc]init:CGPointMake(0, 0) :CGPointMake(0, 0) :CGPointMake(0, 0) :tmp];
    [m_arrStockInfoPos addObject:firstPoint];
    for(int i = 1; i < m_arrStockInfo.count ; i++)
    {
        
        double pointTmp = [[m_arrStockInfo objectAtIndex:i]GetEndPrice];
        tmp.y = dbHeight + (pointTmp - dFirstPoint) * m_dbUnitY;
        //tmp.y = 2*dbHeight - (pointTmp - dFirstPoint) * d_UnitY ;
        tmp.x = i * dbUnitX;
        
        ASStockPosInfo *tmpStockPos = [[ASStockPosInfo alloc]init:CGPointMake(0, 0) :CGPointMake(0, 0) :CGPointMake(0, 0) :tmp];
        
        [m_arrStockInfoPos addObject:tmpStockPos];
    }
}

-(ASStockPosInfo*) GetNextPosInfo
{
    
    ASStockPosInfo *nextPosInfo;
    

    if(m_nCount > m_arrStockInfoPos.count - 1)
    {
        nextPosInfo = nil;
    }
    if(m_nCount <= m_arrStockInfoPos.count - 1)
    {
        nextPosInfo = [m_arrStockInfoPos objectAtIndex:m_nCount];
        m_nCount ++;
    }
    
    return nextPosInfo;
}

-(void) ResetCount
{
    m_nCount = 0;
}

-(void) ResetInfo
{
    [m_arrStockInfo removeAllObjects];
    [m_arrStockInfoPos removeAllObjects];
    m_nCount = 0;
    m_dbHighestPoint = 0;
    m_dbLowestPoint = 1e+32;
    
}
@end
