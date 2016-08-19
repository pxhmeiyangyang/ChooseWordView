//
//  WordButton.h
//  题型二demo
//
//  Created by pxh on 16/8/17.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDuration 1.0

@interface WordButton : UIButton

@property(nonatomic,assign)CGPoint fromPosition;
@property(nonatomic,assign)CGPoint toPosition;

-(void)animationShow;
-(void)animationDismiss;

@end
