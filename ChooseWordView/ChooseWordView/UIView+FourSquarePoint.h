//
//  UIView+FourSquarePoint.h
//  ChooseWordView
//
//  Created by pxh on 16/8/19.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FourSquarePoint)

//左上角坐标
-(CGPoint)topLeftPoint;
//右上角坐标
-(CGPoint)topRightPoint;
//左下角坐标
-(CGPoint)buttomLeftPoint;
//右下角坐标
-(CGPoint)buttomRightPoint;

//左边x值
-(CGFloat)leftX;
//右边x值
-(CGFloat)rightX;
//顶部y值
-(CGFloat)topY;
//底部y值
-(CGFloat)buttomY;


@end
