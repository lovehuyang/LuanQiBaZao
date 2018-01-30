//: Playground - noun: a place where people can play
//import UIKit


// 算术运算符
var a = 10
var b = 22
print("a + b = \(a + b)")

// 区间运算符
// 5...10 闭区间运算符
for index in 5...10 {
    print("闭区间运算符 - \(index)")
}
// 半开区间运算符
for index in 5..<10  {
    print("半开区间运算符 - \(index)")
}

// 条件语句
var index = 10
repeat{
    
    index =  index - 1
    print("index - \(index)")
    
}while (index > 0)


func online (age : Int){
    guard age > 18 else {
        print("不可以上网")
        return
    }
    print("可以上网")
    
}

online(age: 20)

// 字符串
// 字符串长度
var str1 = "hello world !"
print("\(str1)字符串长度\(str1.characters.count)")

// 可以使用 == 来比较两个字符串是否相等
var str2 = "hello China !"
if str1 == str2 {
    print("字符串相等")
}else{
    print("字符串不相等")
}

//判断字符串是否为空，返回布尔值
print("判断字符串是否为空\(str2.isEmpty)")

// 检查字符串是否拥有特定前缀
print("是否有hello前缀\(str2.hasPrefix("hello"))")

// 连接两个字符串，并返回一个新的字符串
let str = str1 + str2
print("拼接两个字符串的结果：\(str) ")

//连接操作符两边的字符串并将新字符串赋值给左边的操作符变量  +=
str2 += str1
print("\(str2)")
