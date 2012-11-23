//
//  ASDrawLineChart.h
//  LineChart2
//
//  Created by  on 12-11-16.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStockInfo.h"
#import "ASPositionConv.h"
@interface ASDrawLineChart : UIView
{
    UIImageView *m_DrawImage;
    NSMutableArray* m_arrSockInfo;
    ASPositionConv * m_positionConv;
}
-(id) init : (UIImageView*) imageView ;
-(void) AddStockInfo : (ASStockInfo*) stockInfo;
-(void) DrawLineChart;
-(void) Reset;
@end
