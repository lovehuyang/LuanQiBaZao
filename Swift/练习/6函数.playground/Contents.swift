//: Playground - noun: a place where people can play
import UIKit
//Swift 函数用来完成特定任务的独立的代码块
//  语法
//  func funcname(形参) -> returntype
//  {
//     Statement1
//      Statement2
//          ……
//      Statement N
//      return parameters
//  }

func funcName(param : String) ->String{
    return param
}
print(funcName(param: "这是参数"))

func appendStr (str1 : String , str2 : String) -> String{
    return str1 + str2
}
print("拼接字符串结果：\(appendStr(str1: "字符串1", str2: "字符串2"))")


func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("最小值为 \(bounds.min) ，最大值为 \(bounds.max)")


func returnNameAndAge (arr :[String]) ->(name : String, age :String ){
    
    return(String(arr[0])  ,String(arr[1]) )
    
}

print(returnNameAndAge(arr: ["Kitty", "18"]))

// 局部参数
func TestFuction (number : Int){
    print("局部参数number的值：\(number)") // number 是局部参数，只能在函数内部使用
}
TestFuction(number: 88)

// 外部参数 - 你可以在局部参数名前指定外部参数名，中间以空格分隔，外部参数名用于在函数调用时传递给函数的参数。
func TestFunction2 ( firstNum a :Int , secondNum b : Int){
    print("a + b 的和为：\(a + b)")
    
}

TestFunction2(firstNum: 1, secondNum: 5)


// 函数嵌套 - 函数嵌套指的是函数内定义一个新的函数，外部的函数可以调用函数内定义的函数。
func calcDecrement(forDecrement total: Int) -> () -> Int {
    var overallDecrement = 0
    func decrementer() -> Int {
        overallDecrement -= total
        return overallDecrement
    }
    return decrementer
}
let decrem = calcDecrement(forDecrement: 30)
print(decrem())
