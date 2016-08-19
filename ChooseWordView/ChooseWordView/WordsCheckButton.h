//
//  WordsCheckButton.h
//  题型二demo
//
//  Created by pxh on 16/8/16.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import <UIKit/UIKit.h>



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
