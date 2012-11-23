//
//  ASDrawKLine.h
//  Finance
//
//  Created by WangM on 12-11-13.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASDrawKLine : UIView
{
    CGPoint m_cgpHighestPoint;
    CGPoint m_cgpLowestPoint;
    CGPoint m_cgpRectCenterPoint;
    
    double m_dbRectWidth;
    double m_dbRectHeight;
    
    UIImageView * m_imageDrawKLineBackground;
    UIColor * m_colorKLine;
}

-(id) initWithHigestPoint : (CGPoint)aHighestPoint andLowestPoint : (CGPoint)aLowestPoint andRectCenterPoint : (CGPoint)aRectCenterPoint andRectWidth : (double)aRectWidth andRectHeight : (double)aRectHeight andImageDrawKLineBackground : (UIImageView*) imageView  andColorKLine:(UIColor *)aColorKLine;
-(void) DrawKLine;

@end
