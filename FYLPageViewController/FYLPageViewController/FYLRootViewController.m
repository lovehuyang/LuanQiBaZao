//
//  FYLRootViewController.m
//  FYLPageViewController
//
//  Created by FuYunLei on 2017/4/17.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import "FYLRootViewController.h"
#import "FYLPageViewController.h"

@interface FYLRootViewController ()

@property(nonatomic,strong)NSMutableArray *viewControllers;

@end

@implementation FYLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)pushToPageViewController:(UIButton *)sender {
    /*
     titles.count必须等于viewControllers.count
     */
    FYLPageViewController *vc = [[FYLPageViewController alloc] initWithTitles:@[@"第一个",@"第二个",@"第三个",@"第四个",@"第五个"] viewControllers:self.viewControllers];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSMutableArray *)viewControllers {
    if (!_viewControllers) {
        _viewControllers = [NSMutableArray array];
        for (int i = 0; i < 5; i++) {
            Class class = NSClassFromString([NSString stringWithFormat:@"Child%dViewController",i]);
            UIViewController *vc = [class new];
            [_viewControllers addObject:vc];
        }
    }
    return _viewControllers;
}

@end
