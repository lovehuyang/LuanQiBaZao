//: Playground - noun: a place where people can play
import UIKit

// swift中没有set方法，所以用属性监听器监听属性变化
class Person :NSObject{
    // 属性监听器
    var name :String?{
        // 属性即将改变时时进行监听
        willSet{
            print("1、属性即将发生改变")
            print (newValue)
        }
        // 属性已经改变时进行监听
        didSet{
            print (name)
            print (oldValue)
        }
    }
}

let p = Person()
p.name = "胡鲁阳"
