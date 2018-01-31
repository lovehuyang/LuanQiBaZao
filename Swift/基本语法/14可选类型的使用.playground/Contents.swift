//: Playground - noun: a place where people can play
import UIKit
/*
 可选类型的简介（是swift中特有的，oc中没有）
    *注意：它是swift中较难理解的一个知识点
    *概念：
        1.在oc开发中，如果一个变量暂停不使用，可以赋值为0（基本数据类型）或者赋值为空（对象类型）
 2.在swift开发中，nil也是一个特殊的类型，因为和真事的类型不匹配是不能赋值的（swift是强类型语言:只要类型一致才能赋值）
        3.但是在开发中赋值nil在所难免因此推出了可选类型
    *可选类型的取值
        空值
        有值
 定义可选类型
    *定义一个可选类型有两种方式
        1.最基本的写法:var name :Optional <String> = nil
        2.语法糖（常用）: var name:String ? = nil
 */

// 1.定义一个可选类型
var name :String? = nil

// 2.给可选类型赋值
name = "HLY"

// 3.取出可选类型
// 可选类型取值时用感叹号！进行强制解包
print(name!)

//4.注意：强制解包是一个非常危险的操作，如果可选类型为nil，强制解包会使程序崩溃
// 建议：强制解包之前先对可选类型进行判断，判读是否为nil
//if name !=nil{
//    print(name!)
//}

// 5.可选绑定
// 5.1 判断name是否有值，若没有值就不执行大括号的内容
// 5.2 如果name有值，系统会自动将name解包并且将解包后的值赋值给 常量

// 写法一 ：定义一个临时常量tempName（不常用）
if let tempName = name {
    print(tempName)
}

// 写法二：（常用）
if let name = name{
    print(name)
}


// var name :String  = nil （错误写法）
// swift 中规定：在创建对象的任意属性时，属性都必须有明确的初始化值
class Student :NSObject{
    var name :Optional <String> = nil
   
    
}

