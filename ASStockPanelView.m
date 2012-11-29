//
//  ASShowDataView.m
//  UpDemo
//
//  Created by WangM on 12-11-26.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockPanelView.h"

@implementation ASStockPanelView


-(void)initWithIndex
{
    m_labelIndex = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 170, 80)];
    [m_labelIndex setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40]];
    m_labelIndex.textColor = [UIColor greenColor];
    m_labelIndex.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelIndex];
}
-(void)initWithAddOrSubPrice
{
    m_labelAddOrSubPrice = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, 80, 40)];
    [m_labelAddOrSubPrice setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    m_labelAddOrSubPrice.textColor = [UIColor greenColor];
    m_labelAddOrSubPrice.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelAddOrSubPrice];
}

-(void)initWithAddOrSubRate
{
    m_labelAddOrSubRate = [[UILabel alloc] initWithFrame:CGRectMake(100, 60, 80, 40)];
    [m_labelAddOrSubRate setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    m_labelAddOrSubRate.textColor = [UIColor greenColor];
    m_labelAddOrSubRate.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelAddOrSubRate];
}
-(void)initWithTodayBeginPrice
{
    m_labelTodayBeginPrice = [[UILabel alloc] initWithFrame:CGRectMake(175, 28, 50, 40)];
    m_labelTodayBeginPrice.text = @"—-";
    [m_labelTodayBeginPrice setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    m_labelTodayBeginPrice.textColor = [UIColor whiteColor];
    m_labelTodayBeginPrice.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelTodayBeginPrice];
}
-(void)initWithYesterdayEndPrice
{
    m_labelYesterdayEndPrice = [[UILabel alloc] initWithFrame:CGRectMake(235, 28, 50, 40)];
    m_labelYesterdayEndPrice.text = @"—-";
    [m_labelYesterdayEndPrice setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    m_labelYesterdayEndPrice.textColor = [UIColor whiteColor];
    m_labelYesterdayEndPrice.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelYesterdayEndPrice];
}
-(void)initWithDoneDealPrice
{
    m_labelDoneDealPrice = [[UILabel alloc] initWithFrame:CGRectMake(175, 62, 50, 40)];
    m_labelDoneDealPrice.text = @"—-";
    [m_labelDoneDealPrice setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    m_labelDoneDealPrice.textColor = [UIColor whiteColor];
    m_labelDoneDealPrice.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelDoneDealPrice];
}
-(void)initWithSwingPercent
{
    m_labelSwingPercent = [[UILabel alloc] initWithFrame:CGRectMake(235, 62, 50, 40)];
    m_labelSwingPercent.text = @"—-";
    [m_labelSwingPercent setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    m_labelSwingPercent.textColor = [UIColor whiteColor];
    m_labelSwingPercent.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelSwingPercent];
}
-(void)initWithTodayHighestPrice
{
    m_labelTodayHighestPrice = [[UILabel alloc] initWithFrame:CGRectMake(40, 92, 120, 40)];
    m_labelTodayHighestPrice.text = @"—-";
    [m_labelTodayHighestPrice setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    m_labelTodayHighestPrice.textColor = [UIColor grayColor];
    m_labelTodayHighestPrice.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelTodayHighestPrice];
    
}
-(void)initWithTodayLowestPrice
{
    m_labelTodayLowestPrice = [[UILabel alloc] initWithFrame:CGRectMake(130, 92, 120, 40)];
    m_labelTodayLowestPrice.text = @"—-";
    [m_labelTodayLowestPrice setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    m_labelTodayLowestPrice.textColor = [UIColor grayColor];
    m_labelTodayLowestPrice.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelTodayLowestPrice];
}
-(void)initWithDealNumber
{
    m_labelDealNumber = [[UILabel alloc] initWithFrame:CGRectMake(230, 92, 120, 40)];
    m_labelDealNumber.text = @"—-";
    [m_labelDealNumber setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    m_labelDealNumber.textColor = [UIColor grayColor];
    m_labelDealNumber.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelDealNumber];
    
}
-(void)initWithRiseNumber
{
    m_labelRiseNumber = [[UILabel alloc] initWithFrame:CGRectMake(50, 112, 120, 40)];
    m_labelRiseNumber.text = @"—-";
    [m_labelRiseNumber setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    m_labelRiseNumber.textColor = [UIColor grayColor];
    m_labelRiseNumber.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelRiseNumber];
}
-(void)initWithSmoothNumber
{
    m_labelSmoothNumber = [[UILabel alloc] initWithFrame:CGRectMake(140, 112, 120, 40)];
    m_labelSmoothNumber.text = @"—-";
    [m_labelSmoothNumber setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    m_labelSmoothNumber.textColor = [UIColor grayColor];
    m_labelSmoothNumber.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelSmoothNumber];
    
}
-(void)initWithFallNumber
{
    m_labelFallNumber = [[UILabel alloc] initWithFrame:CGRectMake(230, 112, 120, 40)];
    m_labelFallNumber.text = @"—-";
    [m_labelFallNumber setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    m_labelFallNumber.textColor = [UIColor grayColor];
    m_labelFallNumber.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:m_labelFallNumber];
}

-(void)ShowIndex:(double)aIndex
{
    [m_changeableStockInfo SetIndex:aIndex];
    
    NSString * strIndex = [[NSString alloc] initWithFormat:@"%.2f",aIndex];
    m_labelIndex.text = strIndex;
}
-(void)ShowAddOrSubPrice:(double)aAddOrSubPrice
{
    [m_changeableStockInfo SetAddOrSubPrice:aAddOrSubPrice];
    
    //增加减少额
    NSString * strAddOrSubPrice = [[NSString alloc]initWithFormat:@"%.2f",aAddOrSubPrice];
    m_labelAddOrSubPrice.text = strAddOrSubPrice;
}
-(void)ShowAddOrSubRate:(double)aAddOrSubRate
{
    [m_changeableStockInfo SetAddOrSubRate:aAddOrSubRate];
    
    //增加减少额率
    NSString * strAddOrSubRate = [[NSString alloc]initWithFormat:@"%.2f%%",aAddOrSubRate];
    m_labelAddOrSubRate.text = strAddOrSubRate;
}

-(void)ShowTodayBeginPrice:(double)aTodayBeginPrice
{
    [m_changeableStockInfo SetTodayBeginPrice:aTodayBeginPrice];
    
    //今开价
    NSString * strTodayBeginPrice = [[NSString alloc]initWithFormat:@"%.2f",aTodayBeginPrice];
    m_labelTodayBeginPrice.text = strTodayBeginPrice;
}
-(void)ShowYesterdayEndPrice:(double)aYesterdayEndPrice
{
    [m_changeableStockInfo SetYesterdayEndPrice:aYesterdayEndPrice];
    
    //昨收价
    NSString * strYesterdayEndPrice = [[NSString alloc]initWithFormat:@"%.2f",aYesterdayEndPrice];
    m_labelYesterdayEndPrice.text = strYesterdayEndPrice;
}
-(void)ShowDoneDealPrice:(double)aDoneDealPrice
{
    [m_changeableStockInfo SetDoneDealPrice:aDoneDealPrice];
    
    //成交额价
    NSString * strDoneDealPrice = [[NSString alloc]initWithFormat:@"%.2f亿",aDoneDealPrice];
    m_labelDoneDealPrice.text = strDoneDealPrice;
}
-(void)ShowSwingPercent:(double)aSwingPercent
{
    [m_changeableStockInfo SetSwingPercent:aSwingPercent];
    
    //振幅%
    NSString * strSwingPercent = [[NSString alloc]initWithFormat:@"%.2f%%",aSwingPercent];
    m_labelSwingPercent.text = strSwingPercent;
}

-(void)ShowTodayHighestPrice:(double)aTodayHighestPrice
{
    [m_changeableStockInfo SetTodayHighestPrice:aTodayHighestPrice];
    
    //最高价格
    NSString * strTodayHighestPrice = [[NSString alloc]initWithFormat:@"%.2f",aTodayHighestPrice];
    m_labelTodayHighestPrice.text = strTodayHighestPrice;
}
-(void)ShowTodayLowestPrice:(double)aTodayLowestPrice
{
    [m_changeableStockInfo SetTodayLowestPrice:aTodayLowestPrice];
    
    //最低价格
    NSString * strTodayLowestPrice = [[NSString alloc]initWithFormat:@"%.2f",aTodayLowestPrice];
    m_labelTodayLowestPrice.text = strTodayLowestPrice;
}
-(void)ShowDealNumber:(double)aDealNumber
{
    [m_changeableStockInfo SetDealNumber:aDealNumber];
    
    //成交数量
    NSString * strDealNumber = [[NSString alloc]initWithFormat:@"%.2f万手",aDealNumber];
    m_labelDealNumber.text = strDealNumber;
}

-(void)ShowRiseNumber:(int)aRiseNumber
{
    [m_changeableStockInfo SetRiseNumber:aRiseNumber];
    
    //涨家数值
    NSString * strRiseNumber = [[NSString alloc]initWithFormat:@"%d",aRiseNumber];
    m_labelRiseNumber.text = strRiseNumber;
}
-(void)ShowSmoothNumber:(int)aSmoothNumber
{
    [m_changeableStockInfo SetSmoothNumber:aSmoothNumber];
    
    //平家数值
    NSString * strSmoothNumber = [[NSString alloc]initWithFormat:@"%d",aSmoothNumber];
    m_labelSmoothNumber.text = strSmoothNumber;
}
-(void)ShowFallNumber:(int)aFallNumber
{
    [m_changeableStockInfo SetSmoothNumber:aFallNumber];
    
    //跌家数值
    NSString * strFallNumber = [[NSString alloc]initWithFormat:@"%d",aFallNumber];
    m_labelFallNumber.text = strFallNumber;
}

-(void)initWordTodayOpen
{
    //今开
    UILabel * labelTodayBegin = [[UILabel alloc] initWithFrame:CGRectMake(175, 10, 50, 40)];
    labelTodayBegin.text = @"今开";
    labelTodayBegin.adjustsFontSizeToFitWidth = YES;
    [labelTodayBegin setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    labelTodayBegin.textColor = [UIColor grayColor];
    labelTodayBegin.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:labelTodayBegin];
}

-(void)initWordYesterdayEnd
{
    //昨收
    UILabel * labelYesterdayEnd = [[UILabel alloc] initWithFrame:CGRectMake(235, 10, 50, 40)];
    labelYesterdayEnd.text = @"昨收";
    [labelYesterdayEnd setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    labelYesterdayEnd.textColor = [UIColor grayColor];
    labelYesterdayEnd.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:labelYesterdayEnd];
}

-(void)initWordDoneDeal
{
    //成交额
    UILabel * labelDoneDeal = [[UILabel alloc] initWithFrame:CGRectMake(175, 45, 50, 40)];
    labelDoneDeal.text = @"成交额";
    labelDoneDeal.adjustsFontSizeToFitWidth = YES;
    [labelDoneDeal setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    labelDoneDeal.textColor = [UIColor grayColor];
    labelDoneDeal.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:labelDoneDeal];
}

-(void)initWordSwing
{
    //振幅
    UILabel * labelSwing = [[UILabel alloc] initWithFrame:CGRectMake(235, 45, 50, 40)];
    labelSwing.text = @"振幅";
    labelSwing.adjustsFontSizeToFitWidth = YES;
    [labelSwing setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    labelSwing.textColor = [UIColor grayColor];
    labelSwing.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:labelSwing];
}

-(void)initWordHighest
{
    //最高
    UILabel * labelTodayHighestPrice = [[UILabel alloc] initWithFrame:CGRectMake(5, 92, 120, 40)];
    labelTodayHighestPrice.text = @"最高:";
    [labelTodayHighestPrice setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    labelTodayHighestPrice.textColor = [UIColor grayColor];
    labelTodayHighestPrice.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:labelTodayHighestPrice];
}

-(void)initWordLowest
{
    //最低
    UILabel * labelTodayLowestPrice = [[UILabel alloc] initWithFrame:CGRectMake(95, 92, 120, 40)];
    labelTodayLowestPrice.text = @"最低:";
    [labelTodayLowestPrice setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    labelTodayLowestPrice.textColor = [UIColor grayColor];
    labelTodayLowestPrice.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:labelTodayLowestPrice];
}

-(void)initWordDealNumber
{
    //成交量
    UILabel * labelDealNumber = [[UILabel alloc] initWithFrame:CGRectMake(185, 92, 120, 40)];
    labelDealNumber.text = @"成交量:";
    [labelDealNumber setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    labelDealNumber.textColor = [UIColor grayColor];
    labelDealNumber.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:labelDealNumber];
}

-(void)initWordRiseNumber
{
    //涨家数
    UILabel * labelRiseNumber = [[UILabel alloc] initWithFrame:CGRectMake(5, 112, 120, 40)];
    labelRiseNumber.text = @"涨家数:";
    [labelRiseNumber setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    labelRiseNumber.textColor = [UIColor grayColor];
    labelRiseNumber.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:labelRiseNumber];
}

-(void)initWordSmoothNumber
{
    //平家数
    UILabel * labelSmoothNumber = [[UILabel alloc] initWithFrame:CGRectMake(95, 112, 120, 40)];
    labelSmoothNumber.text = @"平家数:";
    [labelSmoothNumber setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    labelSmoothNumber.textColor = [UIColor grayColor];
    labelSmoothNumber.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:labelSmoothNumber];
}

-(void)initWordFallNumber
{
    //跌家数
    UILabel * labelFallNumber = [[UILabel alloc] initWithFrame:CGRectMake(185, 112, 120, 40)];
    labelFallNumber.text = @"跌家数:";
    [labelFallNumber setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    labelFallNumber.textColor = [UIColor grayColor];
    labelFallNumber.backgroundColor = [UIColor clearColor];
    [m_imageBackground addSubview:labelFallNumber];
}

-(id)init:(UIImageView *)aImageBackground
{
    self = [super init];
    if (self != nil) {
        m_changeableStockInfo = [[ASChangeableStockInfo alloc] init];
        m_imageBackground = aImageBackground;
        
        [self initWordTodayOpen];
        [self initWordYesterdayEnd];
        [self initWordDoneDeal];
        [self initWordSwing];
        [self initWordHighest];
        [self initWordLowest];
        [self initWordDealNumber];
        [self initWordRiseNumber];
        [self initWordSmoothNumber];
        [self initWordFallNumber];
        
        [self initWithIndex];
        [self initWithAddOrSubPrice];
        [self initWithAddOrSubRate];
        [self initWithTodayBeginPrice];
        [self initWithYesterdayEndPrice];
        [self initWithDoneDealPrice];
        [self initWithSwingPercent];
        [self initWithTodayHighestPrice];
        [self initWithTodayLowestPrice];
        [self initWithDealNumber];
        [self initWithRiseNumber];
        [self initWithSmoothNumber];
        [self initWithFallNumber];
    }
    return self;
}



@end
