//
//  ASViewController.h
//  LineChart2
//
//  Created by  on 12-11-15.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASDrawLineChartDemo.h"
#import "ASStockInfo.h"
#import "ASDrawLineChart.h"
#import "ToolbarDemo.h"
#import "ASStockToolBar.h"
#import "ASStockGridding.h"
#import "ASNetStockInfo.h"
#import "ASStockPriceInfo.h"
#import "ASKLineController.h"


@interface ASViewController : UIViewController
{
     //ASDrawLineChartDemo *m_drawLineChart;
    ASDrawLineChart *m_drawLineChart;
    ASStockToolBar *m_Toolbar;
    ASStockGridding *m_BackgroundGridding;
    ASKLineController *m_drawKLineController;
    
    NSArray *m_SegmentedImageArray;
    
    ASNetStockInfo * m_netStockInfo;
    
    UIImageView *m_ImageLine;
}
@end
