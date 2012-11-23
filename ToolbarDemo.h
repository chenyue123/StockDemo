//
//  ToolbarDemo.h
//  LineChart2
//
//  Created by  on 12-11-19.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASDrawLineChart.h"
#import "ASStockGridding.h"

@interface ToolbarDemo : UIView
{
    UISegmentedControl *segmentedControl;
    ASDrawLineChart *m_drawLineChart;
    ASStockGridding *m_BackgroundGridding;
}
-(void)CreateToolBar;
-(IBAction)ToolBarPressed:(id)sender;
@end
