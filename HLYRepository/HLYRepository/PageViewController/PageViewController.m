//
//  PageViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/6/9.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "PageViewController.h"
#import "ChildViewController.h"
#import "FYLSegmentView.h"

@interface PageViewController ()<FYLSegmentViewDelegate,UIPageViewControllerDelegate,UIPageViewControllerDataSource,UIScrollViewDelegate>
{
    BOOL _done; //是否翻页完成
    NSInteger _currentPage;//当前控制器对应下标
}
@property (nonatomic ,strong) UIPageViewController * pageVC;
@property (nonatomic ,strong) FYLSegmentView * viewSegment;
@property (nonatomic ,strong) NSMutableArray * viewControllers;
@property(nonatomic,strong) NSArray *titles;
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PageViewController的使用";
    
    //!!!!不能省略
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.viewSegment];
    
    // UIPageViewController 的添加方式
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
}

#pragma mark - 懒加载

- (NSMutableArray *)viewControllers {
    if (!_viewControllers) {
        _viewControllers = [NSMutableArray array];
        
        for (int i = 1; i <= 6; i++) {
            ChildViewController *vc = [[ChildViewController alloc] init];
            vc.index = i;
            [_viewControllers addObject:vc];
        }
    }
    return _viewControllers;
}

- (NSArray *)titles{
    if (!_titles) {
        _titles = [NSArray arrayWithObjects:@"第一页",@"第二页",@"第三页",@"第四页",@"第五页",@"第六页", nil];
    }
    return _titles;
}

// 头部分页栏.
- (FYLSegmentView *)viewSegment{
    if (!_viewSegment) {
        _viewSegment = [[FYLSegmentView alloc]initWithTitles:self.titles];
        _viewSegment.delegate = self;
    }
    return _viewSegment;
}

- (UIPageViewController *)pageVC{
    if (!_pageVC) {
        _pageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageVC.dataSource = self;
        _pageVC.delegate = self;
        _pageVC.view.frame = CGRectMake(0, 44 + STATUSBAR_HEIGHT + 44, SCREEN_WIDTH, SCREEN_HEIGHT - 44 - STATUSBAR_HEIGHT - 44);
        
        for (UIView *subView in _pageVC.view.subviews) {
            [(UIScrollView *)subView setDelegate:self];
        }
        
        [_pageVC setViewControllers:@[self.viewControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    return _pageVC;
}
#pragma mark - FYLSegmentViewDelegate

- (void)FYLSegmentView:(FYLSegmentView *)segmentView didClickTagAtIndex:(NSInteger)index{
    if (index == _currentPage) {
        return;
    }
    __weak typeof(self)weakSelf = self;
    // 'forward'.0 is right-to-left,
    [self.pageVC setViewControllers:@[self.viewControllers[index]] direction:index<_currentPage animated:YES completion:^(BOOL finished) {
        _currentPage = index;
        
        [weakSelf.viewSegment setOffsetOfIndexView:0 withCurrentIndex:index];
        
    }];
}

#pragma mark - UIPageViewControllerDelegate

// 开始翻页调用
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers NS_AVAILABLE_IOS(6_0) {
    NSLog(@"开始翻页");
}

// 翻页完成调用
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    _done = YES;
    
    NSInteger index = [self.viewControllers indexOfObject:pageViewController.viewControllers[0]];
    _currentPage = index;
    [_viewSegment setOffsetOfIndexView:0 withCurrentIndex:index];
    
    NSLog(@"翻页完成");
}

- (UIInterfaceOrientation)pageViewControllerPreferredInterfaceOrientationForPresentation:(UIPageViewController *)pageViewController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED {
    return UIInterfaceOrientationPortrait;
}

#pragma mark - UIPageViewControllerDataSource

// 返回下一个对象
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    
    if (index == self.viewControllers.count - 1 || (index == NSNotFound)) {
        
        return nil;
    }
    
    index++;
    
    return [self.viewControllers objectAtIndex:index];
}

// 返回上一个对象
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    
    if (index == 0 || (index == NSNotFound)) {
        
        return nil;
    }
    
    index--;
    
    return [self.viewControllers objectAtIndex:index];
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    LOG(@"滚动 = %f", scrollView.contentOffset.x-SCREEN_WIDTH);
    CGFloat offsetX = scrollView.contentOffset.x-SCREEN_WIDTH;
    
    if (!_done) {
        
        [_viewSegment setOffsetOfIndexView:offsetX withCurrentIndex:_currentPage];
        
    }else
    {
        _done = NO;
    }
}
@end
