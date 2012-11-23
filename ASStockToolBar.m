//
//  ASStockToolBar.m
//  LineChart2
//
//  Created by  on 12-11-19.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ASStockToolBar.h"

@implementation ASStockToolBar



- (id)initWithFrame: (CGRect)frame : (NSArray*) arrayChar 
                   : (UIColor*)colorBackGround  : (UIColor*) colorFont : (UIColor*) colorHighLight
{
    self = [super initWithItems:arrayChar];
    if(self)
    {
        self.frame = frame;
        m_SegmentedArray = [[NSArray alloc]initWithArray:arrayChar];
        
        m_cBackGroundColor = colorBackGround;
        m_cFontColor = colorFont;
        m_cHighLightColor = colorHighLight;
    }
    
    return self;
}

-(void)CreateToolBar
{    
    //初始化UISegmentedControl  
    
    //设置样式
    self.segmentedControlStyle = UISegmentedControlStyleBar;
    
    self.selectedSegmentIndex = 0;//设置默认选择项索引  
    
    
    //这个设置的是此视图的背景
    //[segmentedControl setBackgroundColor:m_cBackGroundColor];
    
    
    self.tintColor = m_cBackGroundColor;
    [self setHighlighted:YES];
    
    
//    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    //正常状态下字体的颜色
    NSDictionary* textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    m_cFontColor, UITextAttributeTextColor,
                                    nil];
    [self setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    
    //选中状态下字体的颜色
    textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                      m_cHighLightColor, UITextAttributeTextColor,
                      nil];
    [self setTitleTextAttributes:textAttributes forState:UIControlStateHighlighted];
}

@end
