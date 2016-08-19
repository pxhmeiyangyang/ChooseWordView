//
//  CodeView.h
//  题型二demo
//
//  Created by pxh on 16/8/17.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSString+StringToWords.h"


typedef NS_ENUM(NSInteger,CodeViewType) {
    CodeViewTypeCustom,//普通样式
    CodeViewTypeSecret//密码风格
};

@interface CodeView : UIView

//输入完成回调
@property (nonatomic, copy) void(^EndEditBlcok)(NSString *text);

//样式
@property (nonatomic, assign) CodeViewType codeType;

//是否需要分隔符
@property (nonatomic, assign) BOOL hasSpaceLine;
//是否有下标线
@property (nonatomic, assign) BOOL hasUnderLine;

//是否需要输入之后清空，再次输入使用,默认为NO
@property (nonatomic, assign) BOOL emptyEditEnd;

@property(nonatomic,strong)NSString* content;


-(instancetype)initWithFrame:(CGRect)frame
                   LineColor:(UIColor* )lColor
                    textFont:(CGFloat)font;

-(void)setWithNum:(NSInteger)num;

@end
