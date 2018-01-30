//: Playground - noun: a place where people can play
import UIKit

//一、元组是一个包含了若干个相关联变量的对象。
var newTuple = ("Kitty",19) //由于Swift的类型推导，newTuple被推导为（String,Int）类型的变量

//二、元组的解绑
// 几个变量一旦联合在一起，组成了一个元组，他们就被“绑定”了，要想从一个元组中单独取出某一个数据时，需要解绑元组。
//1、直接解绑 - 直接解绑是最简单的一种解绑方式，只要定义若干个变量与元组中的变量一一对应即可
var (name , age) =  newTuple
print("姓名：\(name) - 年龄：\(age)")

//2、过滤元素解绑 - 直接解绑使用简单，但是可能会增加一些代码量。如果元组中有100个数据，而我们只对一个数据感兴趣，可以用_ 来代替我们不感兴趣的变量名，也就是过滤掉他们。
var (name2 , _) = newTuple
print("姓名：\(name2)")

//3、下标解绑 - 如果还是觉得需要写出变量名麻烦，还可以使用更简单的下标解绑。这时候可以把元组当做数组，直接写出变量的在元组中的下标即可（下标从0开始）
print("年龄：\(newTuple.1)")
// ***注***：下标不可以用变量、常量来表示，也就是说这样的写法是错误的
//let index = 0
//print("\(newTuple.index)")

// 4、变量名解绑 - 如果在定义元组的时候，指定了变量的变量名，还可以根据变量的变量名来解绑。
var tuple = (name : "Lity", age : 18)
print("姓名：\(tuple.name)")

var testTuple = (name : "Huly", age : 18)
print("元组姓名： \(testTuple.name)")

