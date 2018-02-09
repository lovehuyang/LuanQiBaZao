//: Playground - noun: a place where people can play
import UIKit
// guard 语句和if 语句很类似，只能在函数中使用！
// guard 语句必须要带else，其语法如下
// 1>当条件表达式为true时直接跳过else中的语句，执行语句组的内容
// 2>当条件表达式为false时执行else中的语句，跳转语句一般是break、reture、continue、throw
//guard 条件表达式 else {
//    break
//}
// 语句组
let age1 = 2

//func online (age: Int ){
//    if age >= 18 {
//        print("可以上网")
//    } else {
//        print("回家找妈妈")
//    }
//}
//
//online(age: age1)

func online (age : Int){
    guard age >= 18 else {
        print("回家去吧！")
        return;
    }
    print("可以上网！")
    
}

online(age: age1)















