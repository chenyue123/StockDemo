//
//  ASShowDataView.h
//  UpDemo
//
//  Created by WangM on 12-11-26.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASChangeableStockInfo.h"

@interface ASStockPanelView : UIView
{
    ASChangeableStockInfo * m_changeableStockInfo;
    UIImageView * m_imageBackground;
    
    UILabel * m_labelIndex;
    UILabel * m_labelAddOrSubPrice;
    UILabel * m_labelAddOrSubRate;
    
    UILabel * m_labelTodayBeginPrice;
    UILabel * m_labelYesterdayEndPrice;
    UILabel * m_labelDoneDealPrice;
    UILabel * m_labelSwingPercent;
    
    UILabel * m_labelTodayHighestPrice;
    UILabel * m_labelTodayLowestPrice;
    UILabel * m_labelDealNumber;
    UILabel * m_labelRiseNumber;
    UILabel * m_labelSmoothNumber;
    UILabel * m_labelFallNumber;
}

-(id)init:(UIImageView *)aImageBackground;

-(void)ShowIndex:(double)aIndex;
-(void)ShowAddOrSubPrice:(double)aAddOrSubPrice;
-(void)ShowAddOrSubRate:(double)aAddOrSubRate;

-(void)ShowTodayBeginPrice:(double)aTodayBeginPrice;
-(void)ShowYesterdayEndPrice:(double)aYesterdayEndPrice;
-(void)ShowDoneDealPrice:(double)aDoneDealPrice;
-(void)ShowSwingPercent:(double)aSwingPercent;

-(void)ShowTodayHighestPrice:(double)aTodayHighestPrice;
-(void)ShowTodayLowestPrice:(double)aTodayLowestPrice;
-(void)ShowDealNumber:(double)aDealNumber;
-(void)ShowRiseNumber:(int)aRiseNumber;
-(void)ShowSmoothNumber:(int)aSmoothNumber;
-(void)ShowFallNumber:(int)aFallNumber;

-(void)ShowPanelWithoutData;
@end
