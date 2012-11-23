//
//  ASDrawLineChart.m
//  StockFinance
//
//  Created by  on 12-11-15.
//  Copyright (c) 2012年 xyooyy. All rights reserved.
//

#import "ASDrawLineChartDemo.h"

@implementation ASDrawLineChartDemo

-(id) init : (UIImageView*) imageView
{
    self = [super init];
    if(self)
    {
        m_arraySockInfo = [[NSMutableArray alloc]initWithCapacity:0];
        self.frame = imageView.frame;
        m_DrawImage = imageView;
    }
    return self;
}
-(void) AddStockInfo : (ASStockInfo*) stockInfo
{
    [m_arraySockInfo addObject:stockInfo];
}
-(void) DrawLineChart
{
    //保存第一个点 的价格
    double d_First = [[m_arraySockInfo objectAtIndex:0] GetEndPrice];
    double d_maximum = d_First;//最高点
    double d_minimum = d_First;//最低点
    int bigerTmpCount = 0;//大于第一个值的点个数
    int litterTmpCount = 0;//小于第一个值的点个数
    for(int i = 1;i < m_arraySockInfo.count; i++)
    {
        double testTmp = [[m_arraySockInfo objectAtIndex:i] GetEndPrice];
        if(testTmp > d_maximum)
        {
            d_maximum = testTmp;
        }
        if(testTmp < d_minimum)
        {
            d_minimum = testTmp;
        }
        if(testTmp > d_First)
        {
            bigerTmpCount ++;
        }
        if(testTmp < d_First)
        {
            litterTmpCount ++;
        }
    }
    double temp = (d_maximum - d_First) - (d_First - d_minimum);
    double d_Xunit = m_DrawImage.frame.size.width/240;
    //以上面的为准
    if(temp >= 0)
    {
        //差值
        double dbHeight = m_DrawImage.frame.size.height;
        double dbDiff = d_maximum - d_First;
        m_dUnit = 2 * dbDiff/dbHeight;
    }
    if(temp < 0)
    {
        double dbHeight = m_DrawImage.frame.size.height;
        double dbDiff = d_First - d_minimum;
        m_dUnit = 2 * dbDiff/dbHeight;
    }
    
    
    //self.backgroundColor = [UIColor blueColor]; 
    UIGraphicsBeginImageContext(m_DrawImage.frame.size);
    //得到上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置线的格式
    CGContextSetLineCap(context, kCGLineCapRound);
    //设置线的宽度
    CGContextSetLineWidth(context, 1.0);
    CGContextSetAllowsAntialiasing(context, YES);
    //设置颜色的透明度
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(context);
    
    
    //画第一条线
    double point2 = [[m_arraySockInfo objectAtIndex:1]GetEndPrice];
    double d_Point2Y =m_DrawImage.frame.size.height - ((point2 - d_First) / m_dUnit + m_DrawImage.frame.size.height / 2);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, m_DrawImage.frame.size.height / 2);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), d_Xunit , d_Point2Y);
    
    for(int i = 1; i < m_arraySockInfo.count - 1; i++)
    {
        //获得相邻两个点的价格
        double d_tmpi = [[m_arraySockInfo objectAtIndex:i] GetEndPrice];
        double d_tmpj = [[m_arraySockInfo objectAtIndex:(i + 1)] GetEndPrice];
        //组成直线两个点的Y值
        double d_Yi =m_DrawImage.frame.size.height - ((d_tmpi - d_First) / m_dUnit + m_DrawImage.frame.size.height / 2);
        double d_Yj =m_DrawImage.frame.size.height - ((d_tmpj - d_First) / m_dUnit + m_DrawImage.frame.size.height / 2);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), d_Xunit * i, d_Yi);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), d_Xunit * (i + 1), d_Yj);
        //应该是除法
    }
    
    CGContextStrokePath(context);
    m_DrawImage.image=UIGraphicsGetImageFromCurrentImageContext();
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
