//
//  ASStockLeftLabel.h
//  LineChart2
//
//  Created by  on 12-11-28.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadDefine.h"
#import "ASChangeableStockInfo.h"
@interface ASStockLabel : UIView
{
    UIImageView *m_LabelBackGroundImg;
    UIColor *m_FontColor;
    double m_FontSize;
    
    ASChangeableStockInfo * m_changeableStockInfo;
}
-(id)init :(UIImageView *)aLabelBackGroundImg :(double)aFontSize :(UIColor *)aFontColor;
//在image上贴label
-(void)AddStockPriceLabel;
-(UIImageView*)GetLabelImg;
@end
