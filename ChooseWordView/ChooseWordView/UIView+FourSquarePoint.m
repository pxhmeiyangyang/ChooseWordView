//
//  UIView+FourSquarePoint.m
//  ChooseWordView
//
//  Created by pxh on 16/8/19.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import "UIView+FourSquarePoint.h"


#define kOriginX   self.frame.origin.x
#define kOriginY   self.frame.origin.y
#define kWidth     self.frame.size.width
#define kHeight    self.frame.size.height


@implementation UIView (FourSquarePoint)

//左上角坐标
-(CGPoint)topLeftPoint{
    return self.frame.origin;
}
//右上角坐标
-(CGPoint)topRightPoint{
    return CGPointMake(kOriginX + kWidth, kOriginY);
}
//左下角坐标
-(CGPoint)buttomLeftPoint{
    return CGPointMake(kOriginX, kOriginX + kHeight);
}
//右下角坐标
-(CGPoint)buttomRightPoint{
    return CGPointMake(kOriginX + kWidth, kOriginY + kHeight);
}

//左边x值
-(CGFloat)leftX{
    return kOriginX;
}
//右边x值
-(CGFloat)rightX{
    return kOriginX + kWidth;
}
//顶部y值
-(CGFloat)topY{
    return kOriginY;
}
//底部y值
-(CGFloat)buttomY{
    return kOriginY + kHeight;
}

@end
