//
//  ASStockDataViewController.h
//  LineChart2
//
//  Created by  on 12-11-23.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStockToolBar.h"
@interface ASStockDataView : UIViewController
{
    ASStockToolBar *m_ToolbarView;
    UIImageView *m_backGroundImage;
    UIImageView *m_datasourceImage;
    UIColor *m_toolbarColor;
    UIColor *m_toolbarFontColor;
}
-(id)init :(CGRect)toolbarFrame :(NSArray *)toolbarName :(UIColor *)toolbarColor :(UIColor *)toolbarFontColor :(UIImageView *)backGroundImage :(UIImageView *)dataSourceImage;

-(void)CurrentViewFresh;

-(void)BuildDayCount : (int) nDayCount;
-(void)BuildWeekCount : (int) nWeekCount;
-(void)BuildMonthCount : (int) nMonthCount;
@end
