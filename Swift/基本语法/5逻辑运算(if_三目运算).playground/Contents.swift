//: Playground - noun: a place where people can play
import UIKit
// oc中 if的使用
//if (判断句) {
//    code
//}

//1、 swift 中if的使用
//1>if后的（）可以省略
//2>没有非零/nil即真的概念 ,判断句必须有明确的真假
let m = 20
if m > 0 {
    print("a>0")
}else{
    
    print("a<0")
}

// 2、else if和if的用法完全一样
let score = 99
if score < 0 || score > 100{
    print("出错")
    
} else if score == 90{
    
    print("考了90分")
}

// 3、 三目运算
let a = 10
let b = 20

let c = a > b ? a : b ;

print(c)

















