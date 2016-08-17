//
//  WordButton.m
//  题型二demo
//
//  Created by pxh on 16/8/17.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import "WordButton.h"

@implementation WordButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)click{
    UIWindow* keyWindow = [UIApplication sharedApplication].keyWindow;
    UILabel* label = [[UILabel alloc]initWithFrame:self.frame];
    label.center = self.center;
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = CGRectGetHeight(label.frame) * 0.5;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.titleLabel.text;
    [label setBackgroundColor:self.backgroundColor];
    [keyWindow addSubview:label];
    [UIView animateWithDuration:kDuration animations:^{
        //位移
        CABasicAnimation* position = [CABasicAnimation animationWithKeyPath:@"position"];
        position.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.frame.origin.x, self.frame.origin.y)];
        position.toValue = [NSValue valueWithCGPoint:CGPointMake(20, 50)];
        position.duration = kDuration;
        position.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [label.layer addAnimation:position forKey:@"positionAnimation"];
//        [label setFrame:CGRectMake(20, 50, label.frame.size.width, label.frame.size.height)];
        //缩小
//        CABasicAnimation* scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        scale.toValue = [NSNumber numberWithFloat:0.1];
//        scale.duration = kDuration;
//        [label.layer addAnimation:scale forKey:@"scaleAnimation"];
        label.transform = CGAffineTransformMakeScale(0.1, 0.1);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((kDuration - 0.25) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [label removeFromSuperview];
    });
    [self setHidden:YES];
}

@end
