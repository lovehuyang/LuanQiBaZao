//
//  MasonryController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/5/3.
//  Copyright © 2018年 HLY. All rights reserved.
//

// 添加这个宏，就不用带mas_前缀
#define MAS_SHORTHAND
// 添加这个宏，equalTo就等价于mas_equalTo
#define MAS_SHORTHAND_GLOBALS

#import "MasonryController.h"
#import <Masonry.h>

@interface MasonryController ()

@end

@implementation MasonryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self createUI];
//    [self exp1];
//    [self exp2];
//    [self exp3];
//    [self exp4];
    [self exp5];
}

#pragma mark - exp1: 中心点与self.view相同，宽度为400*400

- (void)exp1{
    UIView *view = [UIView new];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

#pragma mark - exp2: 上下左右边距都为10

- (void)exp2{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.view).with.offset(74);
//        make.bottom.mas_equalTo(self.view).with.offset(-10);
//        make.left.mas_equalTo(self.view).with.offset(10);
//        make.right.mas_equalTo(self.view).with.offset(-10);
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(74, 10, 10, 10));
    }];
    
}

#pragma mark - exp3 让两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10

- (void)exp3{
    UIView *redView = [UIView new];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    UIView *blueView = [UIView new];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.mas_equalTo(self.view.mas_centerY);

        make.height.mas_equalTo(150);
        
        make.width.mas_equalTo(blueView.mas_width);

        make.left.mas_equalTo(self.view.mas_left).with.offset(10);

        make.right.mas_equalTo(blueView.mas_left).with.offset(-10);

    }];
    
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(redView.mas_centerY);
        
        make.left.mas_equalTo(redView.mas_right).with.offset(10);
        
        make.right.mas_equalTo(self.view.mas_right).with.offset(-10);
        
        make.height.mas_equalTo(redView.mas_height);
        
    }];
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


-(void)exp4{
    
    //申明区域，displayView是显示区域，keyboardView是键盘区域
    
    UIView *displayView = [UIView new];
    
    [displayView setBackgroundColor:[UIColor blackColor]];
    
    [self.view addSubview:displayView];
    
    UIView *keyboardView = [UIView new];
    
    [self.view addSubview:keyboardView];
    
    //先按1：3分割 displView（显示结果区域）和 keyboardView（键盘区域）
    
    [displayView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top);
        
        make.left.and.right.equalTo(self.view);
        
        make.height.equalTo(keyboardView).multipliedBy(0.3f);
        
    }];
    
    [keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(displayView.mas_bottom);
        
        make.bottom.equalTo(self.view.mas_bottom);
        
        make.left.and.right.equalTo(self.view);
        
    }];
    
    //设置显示位置的数字为0
    
    UILabel *displayNum = [[UILabel alloc]init];
    
    [displayView addSubview:displayNum];
    
    displayNum.text = @"0";
    
    displayNum.font = [UIFont fontWithName:@"HeiTi SC" size:70];
    
    displayNum.textColor = [UIColor whiteColor];
    
    displayNum.textAlignment = NSTextAlignmentRight;
    
    [displayNum mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.and.right.equalTo(displayView).with.offset(-10);
        
        make.bottom.equalTo(displayView).with.offset(-10);
        
    }];
    
    //定义键盘键名称，？号代表合并的单元格
    
    NSArray *keys = @[@"AC",@"+/-",@"%",@"÷"
                      
                      ,@"7",@"8",@"9",@"x"
                      
                      ,@"4",@"5",@"6",@"-"
                      
                      ,@"1",@"2",@"3",@"+"
                      
                      ,@"0",@"?",@".",@"="];
    
    int indexOfKeys = 0;
    
    for (NSString *key in keys){
        
        //循环所有键
        
        indexOfKeys++;
        
        int rowNum = indexOfKeys %4 ==0? indexOfKeys/4:indexOfKeys/4 +1;
        
        int colNum = indexOfKeys %4 ==0? 4 :indexOfKeys %4;
        
        NSLog(@"index is:%d and row:%d,col:%d",indexOfKeys,rowNum,colNum);
        
        //键样式
        
        UIButton *keyView = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [keyboardView addSubview:keyView];
        
        [keyView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [keyView setTitle:key forState:UIControlStateNormal];
        
        [keyView.layer setBorderWidth:1];
        
        [keyView.layer setBorderColor:[[UIColor blackColor]CGColor]];
        
        [keyView.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:30]];
        
        //键约束
        
        [keyView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            //处理 0 合并单元格
            
            if([key isEqualToString:@"0"] || [key isEqualToString:@"?"] ){
                
                if([key isEqualToString:@"0"]){
                    
                    [keyView mas_makeConstraints:^(MASConstraintMaker *make) {
                        
                        make.height.equalTo(keyboardView.mas_height).with.multipliedBy(.2f);
                        
                        make.width.equalTo(keyboardView.mas_width).multipliedBy(.5);
                        
                        make.left.equalTo(keyboardView.mas_left);
                        
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.9f);
                        
                    }];
                    
                }if([key isEqualToString:@"?"]){
                    
                    [keyView removeFromSuperview];
                    
                }
                
            }
            
            //正常的单元格
            
            else{
                
                make.width.equalTo(keyboardView.mas_width).with.multipliedBy(.25f);
                
                make.height.equalTo(keyboardView.mas_height).with.multipliedBy(.2f);
                
                //按照行和列添加约束，这里添加行约束
                
                switch (rowNum) {
                        
                    case 1:
                        
                    {
                        
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.1f);
                        
                        keyView.backgroundColor = [UIColor colorWithRed:205 green:205 blue:205 alpha:1];
                        
                    }
                        
                        break;
                        
                    case 2:
                        
                    {
                        
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.3f);
                        
                    }
                        
                        break;
                        
                    case 3:
                        
                    {
                        
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.5f);
                        
                    }
                        
                        break;
                        
                    case 4:
                        
                    {
                        
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.7f);
                        
                    }
                        
                        break;
                        
                    case 5:
                        
                    {
                        
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.9f);
                        
                    }
                        
                        break;
                        
                    default:
                        
                        break;
                        
                }
                
                //按照行和列添加约束，这里添加列约束
                
                switch (colNum) {
                        
                    case 1:
                        
                    {
                        
                        make.left.equalTo(keyboardView.mas_left);
                        
                    }
                        
                        break;
                        
                    case 2:
                        
                    {
                        
                        make.right.equalTo(keyboardView.mas_centerX);
                        
                    }
                        
                        break;
                        
                    case 3:
                        
                    {
                        
                        make.left.equalTo(keyboardView.mas_centerX);
                        
                    }
                        
                        break;
                        
                    case 4:
                        
                    {
                        
                        make.right.equalTo(keyboardView.mas_right);
                        
                        [keyView setBackgroundColor:[UIColor colorWithRed:243 green:127 blue:38 alpha:1]];
                        
                    }
                        
                        break;
                        
                    default:
                        
                        break;
                        
                }
                
            }
            
        }];
        
    }
    
}

- (void)exp5{
    // 红色背景
    UIView *redView = [UIView new];
    [self.view addSubview:redView];
    [redView setBackgroundColor:[UIColor redColor]];
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.left.equalTo(self.view.mas_left);
    }];
    
    // 绿色按钮
    UIButton *greenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [redView addSubview:greenBtn];
    [greenBtn setBackgroundColor:[UIColor greenColor]];
    [greenBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(redView.mas_top).with.offset(88);
        make.left.equalTo(redView.mas_left).with.offset(20);
        make.width.equalTo(100);
        make.height.equalTo(50);
    }];
    
    // 黑色按钮
    UIButton *blackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [redView addSubview:blackBtn];
    [blackBtn setBackgroundColor:[UIColor blackColor]];
    [blackBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(greenBtn.mas_centerY);
        make.right.equalTo(redView.mas_right).with.offset(-20);
        make.width.equalTo(greenBtn.mas_width);
        make.height.equalTo(greenBtn.mas_height);
    }];
    
    // 灰色按钮
    UIButton *grayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [redView addSubview:grayBtn];
    [grayBtn setBackgroundColor:[UIColor grayColor]];
    [grayBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(greenBtn.mas_centerX);
        make.width.equalTo(greenBtn.mas_width);
        make.height.equalTo(greenBtn.mas_height);
        make.bottom.equalTo(-20);
    }];
    
    
    // 紫色按钮
    UIButton *purpleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [redView addSubview:purpleBtn];
    [purpleBtn setBackgroundColor:[UIColor purpleColor]];
    [purpleBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(blackBtn.mas_centerX);
        make.size.equalTo(greenBtn);
        make.centerY.equalTo(grayBtn.mas_centerY);
    }];
    
    // 黄色按钮
    UIButton *yellowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [redView addSubview:yellowBtn];
    [yellowBtn setBackgroundColor:[UIColor yellowColor]];
    [yellowBtn makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(redView);
        make.size.equalTo(greenBtn);
    }];
    
    // 白色按钮
    UIButton *whiteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [redView addSubview:whiteBtn];
    [whiteBtn setBackgroundColor:[UIColor whiteColor]];
    [whiteBtn makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(yellowBtn.mas_top).with.offset(-30);
        make.centerX.equalTo(yellowBtn);
        make.size.equalTo(greenBtn);
    }];
    
    // 橘黄色按钮
    UIButton *orangeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [redView addSubview:orangeBtn];
    [orangeBtn setBackgroundColor:[UIColor orangeColor]];
    [orangeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(yellowBtn.mas_bottom).with.offset(30);
        make.centerX.equalTo(yellowBtn);
        make.height.equalTo(yellowBtn.mas_height).dividedBy(2);
        make.width.equalTo(yellowBtn.mas_width).multipliedBy(2);
    }];
    
    
    // 更新布局
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [redView updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).with.offset(100);
        }];
    });
}
@end
