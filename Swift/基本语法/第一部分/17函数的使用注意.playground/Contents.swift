//: Playground - noun: a place where people can play
import UIKit
/*
 函数的使用注意
 
 注意一：内部参数和外部参数
 内部参数：在函数内部可以看到的参数，默认情况下所有的参数都是内部参数
 外部参数：在函数外部可以看到的参数就是外部参数，默认情况从第二个参数开始既是内部参数也是外部参数
 */
func sum (num1 :Int , num2 :Int) ->Int{
    return num1 + num2
}

let a = sum(num1: 10, num2: 21)

/*
 注意二：swift中的默认参数
 */

func who (name :String = "不知道") -> String{
    return "我是\(name)"
}

let name1 = who()
let name2 = who(name: "小明")

/*
 注意三：可变参数（参数的个数不确定）
 
 */
func sumMut(num :Int ...) ->Int{
    var s = 0
    for n in num{
        s = s + n
    }
    return s
}
sumMut(num: 123 ,453 ,1,1,1)


// 注意四、指针类型
var m = 20
var n = 30
func swap( num1 :inout Int, num2 :inout Int){
    let temp = num1
    num1 = num2
    num2 = temp
    
}

swap(&m, &n)
print (m,n)
