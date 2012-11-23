//
//  ASStockBackGroundGridding.m
//  LineChart2
//
//  Created by  on 12-11-20.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockGridding.h"

@implementation ASStockGridding

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init :(int)widthNum :(int)heightNum :(UIImageView*) imageView
{
    self = [super init];
    if(self){
        m_nWidthNum = widthNum;
        m_nHeightNum = heightNum;
        self.frame = imageView.frame;
        m_DrawGridding = imageView;
    }
    return self;
}

-(void)CreateGridding
{
    //每个网格的宽度
    int griddingWidth = (self.frame.size.width - 4) / m_nWidthNum;
    //每个网格的高度
    int griddingHeight = (self.frame.size.height - 4) / m_nHeightNum;
    
    UIGraphicsBeginImageContext(m_DrawGridding.frame.size);
    //得到上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置线的格式
    CGContextSetLineCap(context, kCGLineCapRound);
    //设置线的宽度
    CGContextSetLineWidth(context, 2.0);
    CGContextSetAllowsAntialiasing(context, YES);
    //设置颜色的透明度
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(context);
    
    //画横线
    for(int i = 0; i <= m_nHeightNum; i ++)
    {
        int pointX = self.frame.size.width - 2;
        int pointY = i * griddingHeight + 2;
        CGContextMoveToPoint(context, 2, pointY);
        CGContextAddLineToPoint(context, pointX, pointY);
    }
    
    //画竖线
    for(int j = 0; j <= m_nWidthNum; j++)
    {
        int pointX = j * griddingWidth + 2;
        int pointY = self.frame.size.height - 2;
        CGContextMoveToPoint(context, pointX, 2);
        CGContextAddLineToPoint(context, pointX, pointY);
    }
    
    
    CGContextStrokePath(context);
    m_DrawGridding.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
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
