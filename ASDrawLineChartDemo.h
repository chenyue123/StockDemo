//
//  ASDrawLineChart.h
//  StockFinance
//
//  Created by  on 12-11-15.
//  Copyright (c) 2012年 xyooyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStockInfo.h"

@interface ASDrawLineChartDemo : UIView
{
    NSMutableArray* m_arraySockInfo;
    UIImageView *m_DrawImage;
    double m_dUnit;
}
-(id) init : (UIImageView*) imageView ;

-(void) AddStockInfo : (ASStockInfo*) stockInfo;

-(void) DrawLineChart;


@end
