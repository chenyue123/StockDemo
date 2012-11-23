//
//  ASStockPosInfo.m
//  
//
//  Created by  on 12-11-16.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockDrawInfo.h"

@implementation ASStockDrawInfo

-(id) initWithHighestPos : (CGPoint) aHighestPos andWithLowestPos : (CGPoint) aLowestPos andWithRectCenterPos : (CGPoint)aRectCenterPos andWithRectWidth:(double)aRectWidth andWithRectHeight:(double)aRectHeight andColorKLine:(UIColor *)aColorKLine
{
    self = [super init];
    if (self != nil) {
        m_cgpHeightestPos = aHighestPos;
        m_cgpLowestPos = aLowestPos;
        m_cgpRectCenterPos = aRectCenterPos;
        m_dbRectWidth = aRectWidth;
        m_dbRectHeight = aRectHeight;
        m_colorKLine = aColorKLine;
    }
    
    return self;
}
-(CGPoint) GetHighestPos
{
    return m_cgpHeightestPos;
}
-(CGPoint) GetLowestPos
{
    return m_cgpLowestPos;
}
-(CGPoint) GetRectCenterPos
{
    return m_cgpRectCenterPos;
}
-(double) GetRectWidth
{
    return m_dbRectWidth;
}
-(double) GetRectHeight
{
    return m_dbRectHeight;
}
-(UIColor *) GetKLineColor
{
    return m_colorKLine;
}

@end
