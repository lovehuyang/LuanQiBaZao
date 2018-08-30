//
//  RedView.m
//  HLYRepository
//
//  Created by tzsoft on 2018/8/30.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "RedView.h"

@implementation RedView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupAllSubViews];
        [self setBackgroundColor:[UIColor redColor]];
        self.userInteractionEnabled = YES;
    }
    return self;
}

#pragma mark - 初始化子控件
- (void)setupAllSubViews{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 30);
    btn.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [btn setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:btn];
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

//- (void)btnClick{
////    if (self.delegate && [self.delegate respondsToSelector:@selector(redViewClick)]) {
////        // 代理方法执行点击事件
////        [self.delegate redViewClick];
////    }
//}
@end
