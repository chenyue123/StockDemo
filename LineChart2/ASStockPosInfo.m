//
//  ASStockPosInfo.m
//  
//
//  Created by  on 12-11-16.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockPosInfo.h"

@implementation ASStockPosInfo
-(id) init : (CGPoint) pointHighPos :(CGPoint) pointLowPos :(CGPoint) pointBeginPos :(CGPoint) pointEndPos
{
    self = [super init];
    if(self)
    {
        m_PointHighestPos = pointHighPos;
        m_PointLowestPos = pointLowPos;
        m_PointBeginPos = pointBeginPos;
        m_PointEndPos = pointEndPos;
    }
    return self;
}

-(CGPoint) GetHighestPos
{
    return m_PointHighestPos;
}
-(CGPoint) GetLowestPos
{
    return m_PointLowestPos;
}
-(CGPoint) GetBeginePos
{
    return m_PointBeginPos;
}
-(CGPoint) GetEndPos
{
    return m_PointEndPos;
}
@end
