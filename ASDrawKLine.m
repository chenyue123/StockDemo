//
//  ASDrawKLine.m
//  Finance
//
//  Created by WangM on 12-11-13.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import "ASDrawKLine.h"

@implementation ASDrawKLine

-(id) initWithHigestPoint : (CGPoint)aHighestPoint andLowestPoint : (CGPoint)aLowestPoint andRectCenterPoint : (CGPoint)aRectCenterPoint andRectWidth : (double)aRectWidth andRectHeight : (double)aRectHeight andImageDrawKLineBackground : (UIImageView*) imageView andColorKLine:(UIColor *)aColorKLine
{
    self = [super init];
    if (self != nil) {
        m_cgpHighestPoint = aHighestPoint;
        m_cgpLowestPoint = aLowestPoint;
        m_cgpRectCenterPoint = aRectCenterPoint;
        m_dbRectWidth = aRectWidth;
        m_dbRectHeight = aRectHeight;
    
        m_imageDrawKLineBackground = imageView;
        m_colorKLine = aColorKLine;
        self.frame = m_imageDrawKLineBackground.frame;
    }
    
    return self;
}

-(void) DrawCenterLine : (CGContextRef) context
{
    CGContextSaveGState(context);
    
    CGContextSetLineCap(context, kCGLineCapRound);//设置线终点形状
	CGContextSetLineWidth(context, 2.0);

    
    
    CGContextSetStrokeColorWithColor (context,m_colorKLine.CGColor);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, m_cgpHighestPoint.x,m_cgpHighestPoint.y);
	CGContextAddLineToPoint(context, m_cgpLowestPoint.x ,m_cgpLowestPoint.y);
	CGContextStrokePath(context);
    CGContextRestoreGState(context);
    CGContextFlush(context);//刷新
}

-(void) drawCenterRect : (CGContextRef) context
{
    CGContextSaveGState(context);
    
    CGContextSetFillColorWithColor(context,m_colorKLine.CGColor);
    
    
    double dbRectBeginPointX = m_cgpRectCenterPoint.x-m_dbRectWidth/2;
    double dbRectBeginPointY = m_cgpRectCenterPoint.y-m_dbRectHeight/2;
    CGRect rectRectangle = CGRectMake(dbRectBeginPointX,dbRectBeginPointY, m_dbRectWidth, m_dbRectHeight);
    CGContextFillRect(context, rectRectangle);
    CGContextSetStrokeColorWithColor (context,m_colorKLine.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextAddRect(context,rectRectangle);
    CGContextStrokePath(context);

}

-(void) DrawKLine
{
    UIGraphicsBeginImageContext(self.frame.size);//当前环境变量
    CGContextRef context = UIGraphicsGetCurrentContext();
    //
    
   
    
    [m_imageDrawKLineBackground.image drawInRect:CGRectMake(0, 0, m_imageDrawKLineBackground.frame.size.width, m_imageDrawKLineBackground.frame.size.height)];
    /*画线*/
	[self DrawCenterLine : context];
    /*画矩形*/
    [self drawCenterRect : context];
    m_imageDrawKLineBackground.image = UIGraphicsGetImageFromCurrentImageContext();

   	UIGraphicsEndImageContext();
}



@end
