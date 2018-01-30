//: Playground - noun: a place where people can play
import UIKit

// 1、switch 的基本用法
// 和oc的区别
// 1> 可以省略switch 后面的（）
// 2> 可以省略case 后面的 break
let sex = 0
switch sex {
case 0:
    print("男性")
    
default:
    print("女性")
}

// 2、补充
// 2.1>如果case中需要产生穿透，则在在case中添加 fallthrough (这种情况非常少见)
// 2.2> case后可以跟多个判断条件，条件直接用，隔开 （oc中一个case只能跟一个条件）

// 3、swift中switch的特殊用法
// 3.1> switch可以判断浮点型（oc中只能判断整型 ）
let a = 3.14
switch a {
    case 3.14:
        print("是π")
    default:
        print("飞π")
}

// 3.2>switch可以判断字符串
let m = 20
let n = 11

let operation = "+"
switch operation {
case "+":
        print(m + n)
    default:
        print(m - n)
}

// 3.3>switch 支持区间判断
// 区间 ：开区间  0..<10 0 ~9   闭区间 0...10 0~10
let score = 99

switch score {
case 0..<60:
    print("不及格")
case 60..<80:
    print("及格")
case 80..<90:
    print("良")
case 90...100:
    print("优秀")
default:
    print("神马玩意")
}














