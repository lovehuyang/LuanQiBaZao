//: Playground - noun: a place where people can play
import UIKit
//闭包(Closures)是自包含的功能代码块，可以在代码中使用或者用来作为参数传值。
//Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的 匿名函数比较相似。
//全局函数和嵌套函数其实就是特殊的闭包。

// 1、语法
//{(parameters) -> return type in
//    statements
//}

// 2、 实例
let name = {print("swift闭包实例")}
name()

let studentNameBlock = {(name1 : String , name2 : String) -> String in
    return name2 + name1
}
let studentName = studentNameBlock("XiaoMing" , "HuXiaoYang")
print(studentName)

// 3、闭包表达式 - 闭包表达式是一种利用简洁语法构建内联闭包的方式。 闭包表达式提供了一些语法优化，使得撰写闭包变得简单明了。
// sorted 方法
//Swift 标准库提供了名为 sorted(by:) 的方法，会根据您提供的用于排序的闭包函数将已知类型数组中的值进行排序。
//排序完成后，sorted(by:) 方法会返回一个与原数组大小相同，包含同类型元素且元素已正确排序的新数组。原数组不会被 sorted(by:) 方法修改。
//sorted(by:)方法需要传入两个参数：
//已知类型的数组
//闭包函数，该闭包函数需要传入与数组元素类型相同的两个值，并返回一个布尔类型值来表明当排序结束后传入的第一个参数排在第二个参数前面还是后面。如果第一个参数值出现在第二个参数值前面，排序闭包函数需要返回 true，反之返回 false。

let names = ["AT", "AE", "D", "S", "BE"]

// 使用普通函数(或内嵌函数)提供排序功能,闭包函数类型需为(String, String) -> Bool。
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sorted(by: backwards)

print(reversed)

