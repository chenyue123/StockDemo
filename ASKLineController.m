//
//  ASKLineController.m
//  Finance
//
//  Created by WangM on 12-11-16.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import "ASKLineController.h"

@implementation ASKLineController

-(id)init : (UIImageView *)aImageView
{
    self = [super init];
    if (self != nil) {
        self.frame = aImageView.frame;
        m_positionConv = [[ASKLinePositionConv alloc] init:aImageView];
        m_backgroundImage = aImageView;
    }
    
    return self;
}

-(void) AddStockInfo : (ASStockPriceInfo *) aStockInfo;
{
    [m_positionConv AddStockInfo:aStockInfo];
}
-(void) DrawAllKLineInfo
{
    //NSMutableArray * stockPosInfo = m_positionConv->m_arrStockPosInfo;
    [m_positionConv CreatePos];
    
    ASStockDrawInfo * posStockPosInfo;
    
    
    do{
        posStockPosInfo = [m_positionConv GetNextPosInfo];
        
        
        ASDrawKLine * drawKLine = [[ASDrawKLine alloc] initWithHigestPoint:[posStockPosInfo GetHighestPos] andLowestPoint:[posStockPosInfo GetLowestPos] andRectCenterPoint:[posStockPosInfo GetRectCenterPos] andRectWidth:[posStockPosInfo GetRectWidth] andRectHeight:[posStockPosInfo GetRectHeight] andImageDrawKLineBackground:m_backgroundImage andColorKLine:[posStockPosInfo GetKLineColor]];
        [drawKLine DrawKLine];
    }while (posStockPosInfo != nil);

}

-(void) Reset
{
    [m_positionConv ResetInfo];
}
@end
