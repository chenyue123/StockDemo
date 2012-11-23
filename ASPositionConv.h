//
//  ASPositionConv.h
//  LineChart2
//
//  Created by  on 12-11-16.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASStockInfo.h"
#import "ASStockPosInfo.h"

@interface ASPositionConv : NSObject
{
    //分别保存最高点和最低点，把stockinfo压到数组
    NSMutableArray *m_arrStockInfo;
    NSMutableArray *m_arrStockInfoPos;
    
    double m_dbHighestPoint;
    double m_dbLowestPoint;
    //获得下一个位置
    
    
    UIImageView *m_imageView;
    double m_dbUnitY ;
    
    int m_nCount;
}
//-(id)initWith:(NSMutableArray *)arrStockInfo;
-(id)init :(UIImageView*)image;
//找最后的那个最高点和最低点
-(BOOL) AddStockInfo : (ASStockInfo*)stockInfo;
//数组
-(void) CreateLineChartPos;

-(void)SaveInMutableArray;

-(ASStockPosInfo*) GetNextPosInfo;

-(void) ResetCount;

-(void) ResetInfo;

@end
