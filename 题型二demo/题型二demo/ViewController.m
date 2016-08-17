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

#import "WordButton.h"

@interface ViewController (){
    NSString* _answer;
    NSArray* _answers;
    NSArray* _titles;
    NSInteger _index;
    NSMutableArray* _allAddButtons;
    NSMutableArray* _chooseBtnIndex;
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
    _titleLabel.text  = _titles[_index];
    _answer           = _answers[_index];
    _checkBtn.answer  = _answer;
    [_chooseBtnIndex removeAllObjects];
    [self addWords];
    _index ++;
    if (_index == _titles.count) {
        _index = 0;
    }
}
- (IBAction)update:(id)sender {
    [self resetData];
}

-(void)addWords{
    if (_allAddButtons.count > 0) {
        for (WordButton* btn in _allAddButtons) {
            [btn removeFromSuperview];
        }
        [_allAddButtons removeAllObjects];
    }
    NSArray* words = [_answer words];
    for (int i = 0;i < words.count ; i ++) {
        WordButton* btn = [[WordButton alloc]initWithFrame:CGRectMake(i % 4 * 50, 200 + i / 4 * 50, 30, 30)];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = CGRectGetHeight(btn.frame) * 0.5;
        [btn setBackgroundColor:kBlueColor];
        [self.view addSubview:btn];
        NSString* word = words[i];
        [btn setTitle:word forState:UIControlStateNormal];
        [btn setTitle:word forState:UIControlStateHighlighted];
        [btn setTag:i];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_allAddButtons addObject:btn];
    }
     NSLog(@"_allAddButtons count : %ld",_allAddButtons.count);
}

-(void)btnAction:(WordButton* )sender{
    NSLog(@"button tag:%ld",sender.tag);
    NSArray* words    = [_answer words];
    NSString* word    = words[sender.tag];
    _checkBtn.content = [_checkBtn.content stringByAppendingString:word];
    [_chooseBtnIndex addObject:[NSNumber numberWithInteger:sender.tag]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _answers        = @[@"book",@"good",@"watermelon",@"Police",@"Congratulation"];
    _titles         = @[@"书",@"好",@"西瓜",@"警察",@"祝贺"];
    _allAddButtons  = [NSMutableArray array];
    _chooseBtnIndex = [NSMutableArray array];
    [self resetData];
    [_checkBtn addTarget:self action:@selector(checkBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _checkBtn.endEditBlock = ^(NSString *text){
        NSLog(@"end text:%@",text);
        if ([text isEqualToString:_answer]) {
            _checkBtn.btnType = btnRight;
            [_checkBtn setTitle:_answer forState:UIControlStateNormal];
        }else{
            _checkBtn.btnType =btnEorror;
            [_checkBtn setTitle:_answer forState:UIControlStateNormal];
        }
    };
}

-(void)checkBtnAction:(WordsCheckButton* )sender{
    if (sender.content.length > 0) {
        NSString* content = sender.content;
        sender.content = [content substringToIndex:content.length - 1];
        NSInteger index = [[_chooseBtnIndex lastObject] integerValue];
        [_chooseBtnIndex removeLastObject];
        WordButton* btn = _allAddButtons[index];
        [btn animationShow:btn];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
