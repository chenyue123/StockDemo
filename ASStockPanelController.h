//
//  ASUpDemoViewController.h
//  UpDemo
//
//  Created by WangM on 12-11-23.
//  Copyright (c) 2012年 AlphaStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStockPanelView.h"
#import "ASStockCurrentInfo.h"

@interface ASStockPanelController : UIViewController
{
    ASStockPanelView * m_showDataView;
    ASStockCurrentInfo * m_currentStockInfo;
    
    double m_dbIndex;
    double m_dbAddOrSubPrice;
    double m_dbAddOrSubRate;
    
    double m_dbTodayBeginPrice;
    double m_dbYesterdayEndPrice;
    double m_dbDoneDealPrice;
    double m_dbSwingPercent;
    
    double m_dbTodayHighestPrice;
    double m_dbTodayLowestPrice;
    double m_dbDealNumber;
    int m_nRiseNumber;
    int m_nSmoothNumber;
    int m_nFallNumber;
    
    NSString * m_strCurrentStockCode;
    
    UIImageView * m_imageViewBackground;
}

-(id)init:(UIImageView *)aImageViewBackground;
-(void)ChangeStockCode:(NSString*)aStockCode;
-(void)CurrentViewFresh;



@end
