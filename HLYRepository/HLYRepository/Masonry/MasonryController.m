//
//  MasonryController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/5/3.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "MasonryController.h"
#import <Masonry.h>

@interface MasonryController ()

@end

@implementation MasonryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
}

- (void)createUI{
    
    // 1创建视图
    UIView *view_1 = [[UIView alloc] init];
    view_1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view_1];
    UIView *view_2 = [[UIView alloc] init];
    view_2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view_2];
    UIView *view_3 = [[UIView alloc] init];
    view_3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view_3];
    
    // 2关闭自动布局
    view_1.translatesAutoresizingMaskIntoConstraints = YES;
    view_2.translatesAutoresizingMaskIntoConstraints = YES;
    view_3.translatesAutoresizingMaskIntoConstraints = YES;
    
    // 3添加约束
    __weak __typeof (self)weakSelf = self;
    //先确定view_1的约束
    [view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).with.offset(30); //view_1的上，距离self.view是30px
        make.left.equalTo(weakSelf.view.mas_left).with.offset(30); //view_1de左，距离self.view是30px
    }];
    
    //然后确定view_2的约束
    [view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view_1.mas_centerY).with.offset(0); //view2 Y方向上的中心线和view_1相等
        make.left.equalTo(view_1.mas_right).with.offset(30); //view2 的左距离view_1的右距离为30px
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30); //view_2的右距离self.view30px
        make.width.equalTo(view_1); //view_2的宽度和view_1相等
        make.height.equalTo(view_1); //view_2的高度和view_1相等
    }];
    
    //最后确定view_3的约束
    [view_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view_1.mas_bottom).with.offset(30); //view_3的上距离view_1的底部 30px
        make.left.equalTo(weakSelf.view.mas_left).with.offset(30); //view_3的左距离self.view 30px
        make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-30);//view_3的底部距离self.view 30px
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30); //view_3的右距离self.view 30px
        make.height.equalTo(view_1);//view_3的高度和view_1相等
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
