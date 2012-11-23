//
//  ASStockPosInfo.h
//  
//
//  Created by  on 12-11-16.
//  Copyright (c) 2012年 Alpha Studio. All rights reserved.
//



@interface ASStockPosInfo : NSObject
{
    CGPoint m_PointHighestPos;
    CGPoint m_PointLowestPos;
    CGPoint m_PointBeginPos;
    CGPoint m_PointEndPos;
}

-(id) init : (CGPoint) pointHighPos :(CGPoint) pointLowPos :(CGPoint) pointBeginPos :(CGPoint) pointEndPos;

-(CGPoint) GetHighestPos;
-(CGPoint) GetLowestPos;
-(CGPoint) GetBeginePos;
-(CGPoint) GetEndPos;


@end
