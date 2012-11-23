//
//  ASDrawLineChart.m
//  LineChart2
//
//  Created by  on 12-11-16.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASDrawLineChart.h"

@implementation ASDrawLineChart

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id) init : (UIImageView*) imageView 
{
    self = [super init];
    if(self)
    {
        m_arrSockInfo = [[NSMutableArray alloc]initWithCapacity:0];
        self.frame = imageView.frame;
        m_DrawImage = imageView;
        m_positionConv  = [[ASPositionConv alloc]init:imageView];
    }
    return self;
}
-(void) AddStockInfo : (ASStockInfo*) stockInfo
{
    [m_arrSockInfo addObject:stockInfo];
    [m_positionConv AddStockInfo:stockInfo];
    
}
-(void)DrawLine : (CGContextRef) context
{
    [m_positionConv CreateLineChartPos];
    //CGContextRef context = UIGraphicsGetCurrentContext();
    ASStockPosInfo *nextPositonInfo = [m_positionConv GetNextPosInfo];
    
    for(; nextPositonInfo != nil;)
    {
        CGContextMoveToPoint(context, [nextPositonInfo GetEndPos].x, [nextPositonInfo GetEndPos].y);
        nextPositonInfo = [m_positionConv GetNextPosInfo];
        if(nextPositonInfo != nil)
        {
            CGContextAddLineToPoint(context, [nextPositonInfo GetEndPos].x, [nextPositonInfo GetEndPos].y);
        }
    }
}

-(void) DrawLineChart
{
    UIGraphicsBeginImageContext(m_DrawImage.frame.size);
    //得到上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, m_DrawImage.frame.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    //设置线的格式
    CGContextSetLineCap(context, kCGLineCapRound);
    //设置线的宽度
    CGContextSetLineWidth(context, 1.0);
    CGContextSetAllowsAntialiasing(context, YES);
    //设置颜色的透明度
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(context);
    
    [self DrawLine : context];   
    
    CGContextStrokePath(context);
    m_DrawImage.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}


-(void) Reset
{
    [m_positionConv ResetInfo];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
