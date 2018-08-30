//
//  TransformViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/6/5.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "TransformViewController.h"

typedef NS_ENUM(NSInteger ,btnTag) {
    ktopbtntag=1,
    kdownbtntag,
    krightbtntag,
    kleftbtntag
};

@interface TransformViewController ()
@property(nonatomic,strong) UIButton *headImageView;
@end
/*
 （1） 创建“基于控件初始位置”的形变
 
 CGAffineTransformMakeTranslation（平移）
 
 CGAffineTransformMakeScale（缩放）
 
 CGAffineTransformMakeRotation（旋转）
 
 
 
 （2） 创建“基于transform参数”的形变
 
 CGAffineTransformTranslate
 
 CGAffineTransformScale
 
 CGAffineTransformRotate
 
 */
@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //手写控件代码
    //一、写一个按钮控件，上面有一张图片
    
    //1.使用类创建一个按钮对象
    // UIButton *headbtn=[[UIButton alloc] initWithFrame:CGRectMake(100 ,100, 100, 100)];
    //设置按钮对象为自定义型
    UIButton *headbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    //2.设置对象的各项属性
    
    //(1)位置等通用属性设置
    headbtn.frame=CGRectMake(100, 100, 100, 100);
    
    //(2)设置普通状态下按钮的属性
    [headbtn setImage:[UIImage imageNamed:@"男"] forState:UIControlStateNormal];
    [headbtn setTitle:@"点我！" forState:UIControlStateNormal];
    [headbtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    //(3)设置高亮状态下按钮的属性
    [headbtn setImage:[UIImage imageNamed:@"企业"] forState:UIControlStateHighlighted];
    [headbtn setTitle:@"还行吧~" forState:UIControlStateHighlighted];
    [headbtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    //3.把对象添加到视图中展现出来
    [self.view addSubview:headbtn];
    //注意点！
    self.headImageView=headbtn;
    
    // 创建四个方向键
    [self createDirectionBtn];
    [self createScalingBtn];
}

#pragma mark - 创建方向键

- (void)createDirectionBtn{
    
    //二、写四个控制图片左右上下移动方向的按钮控件
    /**================向上的按钮=====================*/
    //1.创建按钮对象
    UIButton *topbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    //2.设置对象的属性
    topbtn.frame=CGRectMake(100, 250, 40, 40);
    [topbtn setImage:[UIImage imageNamed:@"top_normal"] forState:UIControlStateNormal];
    [topbtn setTag:1];
    //3.把控件添加到视图中
    [self.view addSubview:topbtn];
    
    //4.按钮的单击控制事件
    [topbtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    
    /**================向下的按钮=====================*/
    //1.创建按钮对象
    UIButton *downbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //2.设置对象的属性
    downbtn.frame=CGRectMake(100, 350, 40, 40);
    [downbtn setImage:[UIImage imageNamed:@"bottom_normal"] forState:UIControlStateNormal];
    [downbtn setTag:2];
    //3.把控件添加到视图中
    [self.view addSubview:downbtn];
    
    //4.按钮的单击控制事件
    [downbtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    
    /**================向左的按钮=====================*/
    //1.创建按钮对象
    UIButton *leftbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //2.设置对象的属性
    leftbtn.frame=CGRectMake(50, 300, 40, 40);
    [leftbtn setImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [leftbtn setTag:4];
    //3.把控件添加到视图中
    [self.view addSubview:leftbtn];
    
    //4.按钮的单击控制事件
    [leftbtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    
    /**================向右的按钮=====================*/
    //1.创建按钮对象
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //2.设置对象的属性
    rightbtn.frame=CGRectMake(150, 300, 40, 40);
    [rightbtn setImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [rightbtn setTag:3];
    //3.把控件添加到视图中
    [self.view addSubview:rightbtn];
    
    //4.按钮的单击控制事件
    [rightbtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 创建缩放旋转按钮

- (void)createScalingBtn{
    //三、写两个缩放按钮
    /**================放大的按钮=====================*/
    //1.创建对象
    UIButton *plusbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //2.设置属性
    plusbtn.frame=CGRectMake(75, 400, 40, 40);
    [plusbtn setImage:[UIImage imageNamed:@"plus_normal"] forState:UIControlStateNormal];
    [plusbtn setTag:1];
    //3.添加到视图
    [self.view addSubview:plusbtn];
    //4.单击事件
    [plusbtn addTarget:self action:@selector(Zoom:) forControlEvents:UIControlEventTouchUpInside];
   
    /**================缩小的按钮=====================*/
    UIButton *minusbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    minusbtn.frame=CGRectMake(125, 400, 40, 40);
    [minusbtn setImage:[UIImage imageNamed:@"minus_normal"] forState:UIControlStateNormal];
    [minusbtn setTag:0];
    [self.view addSubview:minusbtn];
    [minusbtn addTarget:self action:@selector(Zoom:) forControlEvents:UIControlEventTouchUpInside];
   
    /**================向左旋转按钮=====================*/
    UIButton *leftrotatebtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftrotatebtn setFrame:CGRectMake(175, 400, 40, 40)];
    [leftrotatebtn setImage:[UIImage imageNamed:@"left_rotate_normal"] forState:UIControlStateNormal];
    [leftrotatebtn setTag:1];
    [self.view addSubview:leftrotatebtn];
    [leftrotatebtn addTarget:self action:@selector(Rotate:) forControlEvents:UIControlEventTouchUpInside];
   
    /**================向右旋转按钮=====================*/
    UIButton *rightrotatebtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [rightrotatebtn setFrame:CGRectMake(225, 400, 40, 40)];
    [rightrotatebtn setImage:[UIImage imageNamed:@"right_rotate_normal"] forState:UIControlStateNormal];
    [rightrotatebtn setTag:0];
    [self.view addSubview:rightrotatebtn];
    [rightrotatebtn addTarget:self action:@selector(Rotate:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 点击事件

- (void)Click:(UIButton *)button{
    CGPoint center=self.headImageView.center;
    switch (button.tag) {
            case ktopbtntag:
                center.y-=30;
            break;
            case kdownbtntag:
                center.y+=30;
            break;
            case kleftbtntag:
                    //发现一个bug,之前的问题是因为少写了break,造成了它们的顺序执行，sorry
                    //center.x=center.x-30;
                center.x-=50;
            break;
            case krightbtntag:
                center.x+=50;
            break;
    }
    
     //  self.headImageView.frame=frame;
    
    //首尾式设置动画效果
    [UIView beginAnimations:nil context:nil];
    self.headImageView.center=center;
    //设置时间
    [UIView setAnimationDuration:2.0];
    [UIView commitAnimations];
    NSLog(@"移动!");
}

- (void)Zoom:(UIButton *)button{
    //使用bounds，以中心点位原点进行缩放
    CGRect bounds = self.headImageView.bounds;
    if (button.tag) {
        bounds.size.height+=30;
        bounds.size.width+=30;
    }else{
        bounds.size.height-=50;
        bounds.size.width-=50;
    }
    
    //设置首尾动画
    [UIView beginAnimations:nil context:nil];
    self.headImageView.bounds=bounds;
    [UIView setAnimationDuration:2.0];
    [UIView commitAnimations];
}

- (void)Rotate:(UIButton *)rotate{
    //位移（不累加）
//    self.headImageView.transform=CGAffineTransformMakeTranslation(50, 200);
    //缩放
    //self.headImageView.transform=CGAffineTransformMakeScale(1.2, 10);
    //在原有的基础上位移（是累加的）
//    self.headImageView.transform=CGAffineTransformTranslate(self.headImageView.transform, 50, 50);
    //在原有的基础上进行缩放
    self.headImageView.transform=CGAffineTransformScale(self.headImageView.transform, 1.5, 1);
    
//    //在原有的基础上进行旋转
//    if (rotate.tag) {
//        //旋转角度为1/pi，逆时针
//        self.headImageView.transform=CGAffineTransformRotate(self.headImageView.transform, -M_1_PI);
//    }else{//旋转的角度为pi/2，顺时针
//        self.headImageView.transform=CGAffineTransformRotate(self.headImageView.transform, M_PI_2);
//    }
}



@end
