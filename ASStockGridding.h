//
//  ASStockBackGroundGridding.h
//  LineChart2
//
//  Created by  on 12-11-20.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASStockGridding : UIView
{
    int m_nWidthNum;
    int m_nHeightNum;
    UIImageView *m_DrawGridding;
}
- (id)init :(int)widthNum :(int)heightNum :(UIImageView*) imageView;
-(void)CreateGridding;
@end
