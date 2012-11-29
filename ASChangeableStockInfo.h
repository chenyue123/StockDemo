//
//  ASChangeableUpDemoInfo.h
//  UpDemo
//
//  Created by WangM on 12-11-26.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASChangeableStockInfo : NSObject//ASStockInfo
{
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
}

-(id)init;

-(void)SetIndex:(double)aIndex;
-(void)SetAddOrSubPrice:(double)aAddOrSubPrice;
-(void)SetAddOrSubRate:(double)aAddOrSubRate;

-(void)SetTodayBeginPrice:(double)aTodayBeginPrice;
-(void)SetYesterdayEndPrice:(double)aYesterdayEndPrice;
-(void)SetDoneDealPrice:(double)aDoneDealPrice;
-(void)SetSwingPercent:(double)aSwingPercent;

-(void)SetTodayHighestPrice:(double)aTodayHighestPrice;
-(void)SetTodayLowestPrice:(double)aTodayLowestPrice;
-(void)SetDealNumber:(double)aDealNumber;
-(void)SetRiseNumber:(double)aRiseNumber;
-(void)SetSmoothNumber:(double)aSmoothNumber;
-(void)SetFallNumber:(double)aFallNumber;

-(double)GetIndex;
-(double)GetAddOrSubPrice;
-(double)GetAddOrSubRate;

-(double)GetDoneDealPrice;
-(double)GetSwingPercent;
-(double)GetYesterdayEndPrice;

-(double)GetTodayHighestPrice;
-(double)GetTodayLowestPrice;
-(double)GetDealNumber;
-(double)GetRiseNumber;
-(double)GetSmoothNumber;
-(double)GetFallNumber;


@end
