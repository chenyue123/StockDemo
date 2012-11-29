//
//  ASStockDataViewController.h
//  LineChart2
//
//  Created by  on 12-11-23.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStockToolBar.h"
#import "ASNetStockInfo.h"
#import "ASDrawLineChart.h"
#import "ASKLineController.h"
#import "ASStockGridding.h"
#import "HeadDefine.h"


@interface ASStockDataViewController : UIViewController
{
    UIImageView *m_backGroundImage;
    UIImageView *m_datasourceImage;
    UIColor *m_toolbarColor;
    UIColor *m_toolbarFontColor;
    UIColor *m_changeFontColor;
    NSMutableString *m_strStockCode;
    CGRect m_CGFrame;
    NSArray *m_Array;
    
    ASDrawLineChart *m_drawLineChart;
    ASKLineController *m_drawKLineController;
    ASStockGridding *m_BackgroundGridding;
    ASStockToolBar *m_ToolbarView;
    ASNetStockInfo * m_netStockInfo;
    
    int m_nSegIndex;
    
}
-(id)init :(CGRect)toolbarFrame :(NSArray *)toolbarName 
          :(UIColor *)toolbarColor :(UIColor *)toolbarFontColor 
            :(UIColor *)changeFontColor
          :(UIImageView *)backGroundImage 
          :(UIImageView *)dataSourceImage 
          : (NSString*) strStockCode;

-(void)ChangeStockCode : (NSString*) strStockCode;

-(void)CurrentViewFresh;

-(void)BuildDayCount : (int) nDayCount;
-(void)BuildWeekCount : (int) nWeekCount;
-(void)BuildMonthCount : (int) nMonthCount;
@end
