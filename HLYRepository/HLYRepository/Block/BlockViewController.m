//
//  BlockViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/7/3.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "BlockViewController.h"

// 字符串常量
static NSString * const account = @"account";

@interface BlockViewController ()

@end

@implementation BlockViewController
/*
// https://www.cnblogs.com/libaoshen/p/5861466.html
 block：我们称代码块，他类似一个方法。而每一个方法都是在被调用的时候从硬盘到内存，然后去执行，执行完就消失，所以，方法的内存不需要我们管理，也就是说，方法是在内存的栈区。所以，block不像OC中的类对象(在堆区)，他也是在栈区的。如果我们使用block作为一个对象的属性，我们会使用关键字copy修饰他，因为他在栈区，我们没办法控制他的消亡，当我们用copy修饰的时候，系统会把该 block的实现拷贝一份到堆区，这样我们对应的属性，就拥有的该block的所有权。就可以保证block代码块不会提前消亡。
 
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Block的使用";
    
    //实现一个block,这个block实现代码是在栈区的，也就是说，当viewDidLoad这个方法执行完之后，block就消失了
    void (^block)(void) = ^(){
        NSLog(@"block的使用");
    };
        
    //赋值给属性_block 此时就完成了copy _block指针指向堆中一块内存(存放的是block的实现代码)，_block就一直拥有了代码块的使用权，直到 LBS_A_ViewCont         roller对象消亡。
    _myBlock = block;

}


- (void)blockUsage{
    
    /*
     对于对象类型，传递的是地址，同时默认对该对象进行了一次强引用。系统进行了强引用，而他又对该对象的内存管理袖手旁观，也就是说，他只做了强引用，但是没有做释放操作。这个时候就会造成内存泄漏。所以，我们在使用对象的时候，在MRC下，都会使用__block修饰，在ARC下，使用__weak修饰，这样一来，系统在传递的时候就不会对该对象进行强引用，避免了内存泄漏。
     
     */
    UIView *view = [[UIView alloc] init];
    __weak typeof(view)_view = view;//_view和view指向同一块内存，而_view是弱引用,view的retainCount还是1.
    _myBlock = ^{
        //view.frame = CGRectMake(0, 0, 100, 100);//在block内部使用view对象，系统会对view强引用，此时会造成内存泄漏。
        _view.frame = CGRectMake(0, 0, 100, 100);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
