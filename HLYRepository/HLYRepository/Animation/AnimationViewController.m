//
//  AnimationViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/7/10.
//  Copyright © 2018年 HLY. All rights reserved.
//  http://www.cocoachina.com/ios/20160517/16290.html
//  https://www.jianshu.com/p/e55f059dd748

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property (nonatomic ,strong) UIImageView *imgView;//

@property (nonatomic ,strong) UIImageView *firstImgView;//

@property (nonatomic ,strong) UIImageView *secondImgView;//

@property (nonatomic ,strong) UIImageView *thirdImgView;//

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"核心动画";
    // 核心动画的框架结构如图
    _imgView = [UIImageView new];
    _imgView.frame = CGRectMake(30, 80, SW - 60, 300);
    [self.view addSubview:_imgView];
    _imgView.image = [UIImage imageNamed:@"CoreAnimation"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.firstImgView];
    [self.view addSubview:self.secondImgView];
    [self.view addSubview:self.thirdImgView];
    
    CGFloat btnW = 60;
    NSArray *names = @[@"position"];
    for (int  i =0; i < 1; i ++) {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(btnW *i + 1, CGRectGetMaxY(_thirdImgView.frame), btnW, 30);
        [self.view addSubview:btn];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitle:names[i] forState:UIControlStateNormal];
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor blackColor].CGColor;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        SEL aSelector = NSSelectorFromString(names[i]);
        [btn addTarget:self action:aSelector forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - position
- (void)position{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position"];
    // fromValue:开始的值;toValue:结束时的值;byValue:动画过程中的值
    ani.toValue = [NSValue valueWithCGPoint:self.firstImgView.center];
    // fillMode决定当前对象在非active时间段的行为（要想fillMode有效，最好设置removedOnCompletion=NO）
    ani.fillMode = kCAFillModeForwards;
    ani.removedOnCompletion = NO;
    // 动画的执行次数
    ani.repeatCount = 1;
    // 动画执行时间
    ani.duration = 5;
    // timingFunction 动画速度
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.secondImgView.layer addAnimation:ani forKey:@"Position"];
}

#pragma mark - 懒加载

- (UIImageView *)firstImgView{
    if (!_firstImgView) {
        _firstImgView = [UIImageView new];
        _firstImgView.frame = CGRectMake(125, CGRectGetMaxY(_imgView.frame), 50, 50);
        _firstImgView.image = [UIImage imageNamed:@"国际货运"];
    }
    return _firstImgView;
}

- (UIImageView *)secondImgView{
    if (!_secondImgView) {
        _secondImgView = [UIImageView new];
        _secondImgView.frame = CGRectMake(100, CGRectGetMaxY(_firstImgView.frame) + 100, 50, 50);
        _secondImgView.image = [UIImage imageNamed:@"货车"];
    }
    return _secondImgView;
}

- (UIImageView *)thirdImgView{
    if (!_thirdImgView) {
        _thirdImgView = [UIImageView new];
        _thirdImgView.frame = CGRectMake(CGRectGetMaxX(_secondImgView.frame), _secondImgView.frame.origin.y, 50, 50);
        _thirdImgView.image = [UIImage imageNamed:@"奖牌"];
    }
    return _thirdImgView;
}
@end
