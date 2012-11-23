//
//  ASStockPosInfo.h
//  
//
//  Created by  on 12-11-16.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface ASStockDrawInfo : NSObject
{
    CGPoint m_cgpHeightestPos;
    CGPoint m_cgpLowestPos;
    CGPoint m_cgpRectCenterPos;
    double m_dbRectWidth;
    double m_dbRectHeight;
    UIColor * m_colorKLine;
}

-(id) initWithHighestPos : (CGPoint) aHighestPos andWithLowestPos : (CGPoint) aLowestPos andWithRectCenterPos : (CGPoint)aRectCenterPos andWithRectWidth : (double) aRectWidth andWithRectHeight : (double) aRectHeight andColorKLine:(UIColor *)aColorKLine;

-(CGPoint) GetHighestPos;
-(CGPoint) GetLowestPos;
-(CGPoint) GetRectCenterPos;
-(double) GetRectWidth;
-(double) GetRectHeight;
-(UIColor *) GetKLineColor;

@end
