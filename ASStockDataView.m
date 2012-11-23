//
//  ASStockDataViewController.m
//  LineChart2
//
//  Created by  on 12-11-23.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockDataView.h"

@implementation ASStockDataView
-(id)init :(CGRect)toolbarFrame :(NSArray *)toolbarName :(UIColor *)toolbarColor :(UIColor *)toolbarFontColor :(UIImageView *)backGroundImage :(UIImageView *)dataSourceImage
{
    self = [super init];
    if(self)
    {
        m_ToolbarView.frame = toolbarFrame;
        m_toolbarColor = toolbarColor;
        m_toolbarFontColor = toolbarFontColor;
        m_backGroundImage = backGroundImage;
        m_datasourceImage = dataSourceImage;
    }
    return self;
}

-(void)CurrentViewFresh
{
    
}
@end
