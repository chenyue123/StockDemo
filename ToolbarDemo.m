//
//  ToolbarDemo.m
//  LineChart2
//
//  Created by  on 12-11-19.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import "ToolbarDemo.h"

@implementation ToolbarDemo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)CreateToolBar
{   
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",nil];  
    
    //初始化UISegmentedControl  
    
    segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];  
    
    segmentedControl.frame = self.frame;  
    
    segmentedControl.selectedSegmentIndex = 2;//设置默认选择项索引  
    
    segmentedControl.tintColor = [UIColor redColor]; 
    
    
    [segmentedControl addTarget:self action:@selector(ToolBarPressed:) forControlEvents:UIControlEventValueChanged];
    
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;//设置样式
    
    
    [self addSubview:segmentedControl];
}

-(IBAction)ToolBarPressed:(id)sender
{
    return;
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
