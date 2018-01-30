//: Playground - noun: a place where people can play
import UIKit

//swift 中的for循环。可以省略（）
// c语言的循环在swift3.0中已经废弃
// 1、swift中的循环使用for in 形式
// 1>递增
for  i in (0...10){// 步长为1，递增
    print(i)
    
}
// 2>递减
for  i in (0...10).reversed(){// 步长为1，递减
    print(i)
    
}
// 3> 任意步长的设定
for i in stride(from: 0, to: 10, by: 2){// 步长为2
    print(i)
}

// 4> 任意步长的设定
for i in stride(from: 10, to: 0, by: -2){// 步长为2
    print(i)
}
//2、特殊用法
// 在swift中如果一个标识符不适用，可以用_来代替
for _ in 0...10{
    
    print("你好啊")
}













