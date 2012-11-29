//
//  ASViewController.h
//  LineChart2
//
//  Created by  on 12-11-15.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASDrawLineChart.h"
#import "ASStockToolBar.h"
#import "ASStockGridding.h"
#import "ASNetStockInfo.h"
#import "ASKLineController.h"
#import "ASStockPanelController.h"

#import "ASStockDataViewController.h"
#import "ASStockLabel.h"

@interface ASViewController : UIViewController<UITextFieldDelegate>
{
     //ASDrawLineChartDemo *m_drawLineChart;
    ASDrawLineChart *m_drawLineChart;
    ASStockToolBar *m_Toolbar;
    ASStockGridding *m_BackgroundGridding;
    ASKLineController *m_drawKLineController;
    ASNetStockInfo * m_netStockInfo;
    
    ASStockDataViewController *m_stockDataViewController;
    ASStockLabel *m_stockLabel;
    
    NSArray *m_SegmentedImageArray;
    UIImageView *m_ImageLine;
    
    ASStockPanelController * m_stockPaneViewlController;
    
    UITextField *m_inputTextFieldStockCode;
}

-(IBAction)ButtonChangeStockCodePressed:(id)sender;
@end
