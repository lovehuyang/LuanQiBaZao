//: Playground - noun: a place where people can play
import UIKit
/*
 一 类的介绍和定义
    *swift也是一门面相对象的开发语言
    *面向对象的基础是类，类产生了对象
    *在swift中定义类的方法（定义类的关键字 class ）
        class 类名：SuperClass {
            // 定义属性和方法
        }
 
    ！注意：1、定义的类可以没有父类，那么该类是rootClass
           2、通常情况下定义类时继承自NSObject （非OC的NSObject）
 
    给类的属性赋值
        方法一：直接赋值 p.age = 10
        方法二：通过KVC赋值（前提是该类要继承自NSObject）
            可以重写setValue方法
 */

class Person :NSObject{
    var age = 0
    //override :重写，如果写的某一个方法是对父类的方法进行的重写，那么必须在该方法前加上 override
    override func setValue(_ value: Any?, forKey key: String) {

    }
}
let p = Person();// 创建对象
p.age = 20
p.setValuesForKeys(["age":188,"name":"huluyang"])

