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
let url1 :NSURL? = NSURL(string: "www.cctv.com")

// 可选绑定
if let url1 = url1{
    print(url1)
    
}
