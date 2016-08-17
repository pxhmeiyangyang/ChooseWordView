//
//  ViewController.m
//  题型二demo
//
//  Created by pxh on 16/8/16.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import "ViewController.h"

#import "WordsCheckButton.h"

#import "NSString+StringToWords.h"

@interface ViewController (){
    NSString* answer;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet WordsCheckButton *checkBtn;

@end

@implementation ViewController


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    _titleLabel.textColor = kBlueColor;
    _titleLabel.backgroundColor = [UIColor clearColor];
    
    _checkBtn.layer.masksToBounds = YES;
    _checkBtn.layer.cornerRadius = CGRectGetHeight(_checkBtn.bounds) * 0.5;
}

-(void)resetData{
    _checkBtn.btnType = btnNomal;
}

-(void)addWords{
    NSArray* words = [answer words];
    for (int i = 0;i < words.count ; i ++) {
        UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(i % 4 * 50, 200 + i / 4 * 50, 30, 30)];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = CGRectGetHeight(btn.frame) * 0.5;
        [btn setBackgroundColor:kBlueColor];
        [self.view addSubview:btn];
        NSString* word = words[i];
        [btn setTitle:word forState:UIControlStateNormal];
        [btn setTitle:word forState:UIControlStateHighlighted];
        [btn setTag:i];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)btnAction:(UIButton* )sender{
    NSLog(@"button tag:%ld",sender.tag);
    NSArray* words = [answer words];
     NSString* word = words[sender.tag];
    _checkBtn.content = [_checkBtn.content stringByAppendingString:word];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleLabel.text = @"西瓜";
    answer = @"watermelon";
    _checkBtn.answer = answer;
    [_checkBtn addTarget:self action:@selector(checkBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
    [self resetData];
    [self addWords];
    _checkBtn.endEditBlock = ^(NSString *text){
        NSLog(@"end text:%@",text);
        if ([text isEqualToString:answer]) {
            _checkBtn.btnType = btnRight;
            [_checkBtn setTitle:answer forState:UIControlStateNormal];
        }else{
            _checkBtn.btnType =btnEorror;
            [_checkBtn setTitle:answer forState:UIControlStateNormal];
        }
    };
}

-(void)checkBtnAction:(WordsCheckButton* )sender{
    if (sender.content.length > 0) {
        NSString* content = sender.content;
        sender.content = [content substringToIndex:content.length - 1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
