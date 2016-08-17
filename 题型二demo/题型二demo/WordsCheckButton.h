//
//  WordsCheckButton.h
//  题型二demo
//
//  Created by pxh on 16/8/16.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBlueColor     [UIColor colorWithRed:96/255.0 green:189/255.0 blue:250/255.0 alpha:1.0]
#define kGreenColor    [UIColor colorWithRed:122/255.0 green:205/255.0 blue:137/255.0 alpha:1.0]
#define kRedColor      [UIColor colorWithRed:255/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]

#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height

typedef void (^EndEditBlock) (NSString* text);

typedef NS_ENUM(NSInteger,btnType){
    btnNomal,
    btnRight,
    btnEorror
};

@interface WordsCheckButton : UIButton

@property(nonatomic,assign)NSInteger btnType;

@property(nonatomic,strong)NSString* content;

@property(nonatomic,copy)EndEditBlock endEditBlock;

@property(nonatomic,strong)NSString* answer;

@end
