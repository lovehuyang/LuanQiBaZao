//: Playground - noun: a place where people can play
import UIKit
/*
 函数的介绍
 
    *函数相当于oc中的方法
 
    *函数的格式如下
        func 函数名（参数列表）->返回值类型 {
            代码块
            return 返回值
        }
 
    *func是关键字，多个参数列表之间可以用逗号隔开，也可以没有参数
 
    *使用 “->” 指向返回值的类型
 
    *如果函数没有返回值，返回值为Void,并且 “->” 部分可以省略
 
 */

//1.没有参数没有返回值的函数
func about () ->Void{
    print("同智伟业")
}
about()

func about1() {
    print("同智伟业1")
}
about1()

//2.没有参数没有返回值的函数
func readMessage() -> String{
    return "同智伟业2"
}
print(readMessage())


//3.有参数没有返回值的函数
func callPhone (phoneNum :String) {
    print("电话\(phoneNum)")
}
callPhone(phoneNum: "15665889905")

//4.有参数有返回值的函数
func sum (num1:Int,num2:Int) ->Int{
    return num1 + num2
}
print(sum(num1: 2, num2: 5))
