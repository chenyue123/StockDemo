//
//  ASStockLeftLabel.m
//  LineChart2
//
//  Created by  on 12-11-28.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockLabel.h"

@implementation ASStockLabel

-(id)init :(UIImageView *)aLabelBackGroundImg :(double)aFontSize :(UIColor *)aFontColor
{
    self = [super init];
    if(self != nil)
    {
        m_FontColor = aFontColor;
        m_FontSize = aFontSize;
        self.frame = aLabelBackGroundImg.frame;
        m_LabelBackGroundImg = aLabelBackGroundImg;
        //m_changeableStockInfo = [[ASChangeableStockInfo alloc]init];
    }
    return self;
}
-(void)AddStockPriceLabel
{
    double db_HighestPrice = [m_changeableStockInfo GetTodayHighestPrice];
    double db_lowestPrice = [m_changeableStockInfo GetTodayLowestPrice];
    
    double dUnitPrice = (db_HighestPrice - db_lowestPrice) / LONGITUDINAL_COUNT;
    for(int i = 0;i <= LONGITUDINAL_COUNT; i++)
    {
        double dUnit_Y = m_LabelBackGroundImg.frame.size.height / LONGITUDINAL_COUNT;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, dUnit_Y * i , 30, 20)];
        double tmp = db_HighestPrice - i * dUnitPrice;
        label.text = [[NSString alloc]initWithFormat:@"%.2f",tmp];
        [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:m_FontSize]];
        label.textColor = m_FontColor;
        label.backgroundColor = [UIColor clearColor];
        [m_LabelBackGroundImg addSubview:label];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(290, dUnit_Y * i , 30, 20)];
        label1.text = @"0.00";
        [label1 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:m_FontSize]];
        label1.textColor = m_FontColor;
        label1.backgroundColor = [UIColor clearColor];
        [m_LabelBackGroundImg addSubview:label1];
    }
}
-(UIImageView*)GetLabelImg
{
    return m_LabelBackGroundImg;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
