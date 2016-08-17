//
//  WordsCheckButton.m
//  题型二demo
//
//  Created by pxh on 16/8/16.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import "WordsCheckButton.h"

#import "CodeView.h"

@interface WordsCheckButton()
{
    CodeView* view;
}
@property(nonatomic,strong)UIImageView* image;
@end

@implementation WordsCheckButton


-(void)awakeFromNib{
    [super awakeFromNib];
    float width = CGRectGetWidth(self.frame);
    float height = CGRectGetHeight(self.frame);
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(15, height * 0.25, height * 0.5, height * 0.5)];
    [self addSubview:_image];

    view = [[CodeView alloc]initWithFrame:CGRectMake(0, 0, width * 0.5, height * 0.5) LineColor:kBlueColor textFont:height * 0.3];
    view.userInteractionEnabled = NO;
    [self addSubview:view];
    NSLog(@"self center: x %f y %f self frame hieght %f  width %f",self.center.x,self.center.y,self.frame.size.height,self.frame.size.width);
    
    //        view.center = self.center;
    view.center = CGPointMake(self.center.x, height * 0.5);
    //        view.bounds = (CGRect){CGPointZero,self.frame.size};
    
    NSLog(@"view center: x %f y %f view frame hieght %f  width %f",view.center.x,view.center.y,view.frame.size.height,view.frame.size.width);
    view.hasUnderLine = YES;
}


-(void)setAnswer:(NSString *)answer{
    _answer = answer;
    NSArray* words = [_answer words];
    if (_answer.length > 0) {
        [view setWithNum:words.count];
        _content = [[NSString alloc]init];
        view.content = _content;
        __block WordsCheckButton*  weakSelf = self;
        view.EndEditBlcok = ^(NSString *text){
            if (weakSelf.endEditBlock) {
                weakSelf.endEditBlock(text);
            }
        };
    }
}

-(void)setContent:(NSString *)content{
    _content = content;
    if (_content != nil) {
        view.content = _content;
    }
}

-(void)setBtnType:(NSInteger)btnType{
    self.layer.borderWidth = 1.0;
    switch (btnType) {
        case 0:
            [self setTitle:@"" forState:UIControlStateNormal];
            self.answer  = @"";
            self.content = @"";
            [self setBackgroundColor:[UIColor clearColor]];
            self.layer.borderColor = kBlueColor.CGColor;
            [self setTintColor:kBlueColor];
            self.enabled = YES;
            [view setHidden:NO];
            break;
        case 1:
            [self setBackgroundColor:kGreenColor];
            self.layer.borderColor = kGreenColor.CGColor;
            [_image setImage:[UIImage imageNamed:@"ia09_right"]];
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.enabled = NO;
            [view setHidden:YES];
            break;
        case 2:
            [self setBackgroundColor:kRedColor];
            self.layer.borderColor = kRedColor.CGColor;
            [_image setImage:[UIImage imageNamed:@"ia09_wrong"]];
            [self setTintColor:[UIColor whiteColor]];
            self.enabled = NO;
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [view setHidden:YES];
            break;
        default:
            break;
    }
}
@end
