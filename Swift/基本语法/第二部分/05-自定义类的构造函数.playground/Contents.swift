//: Playground - noun: a place where people can play
import UIKit
/*
类的构造函数
 构造函数的介绍
    *构造函数类似于oc中的初始化方法：init方法
    *默认情况下创建一个类时，必然会调用一个构造函数
    *即便是没有编写任何的构造函数，编译器也会提供一个默认的构造函数
    *如果是继承自NSObject，可以对父类的构造函数进行重写
 
 构造函数的基本使用
    *类的属性必须有值
    *如果不是定义时初始化值，可以在构造函数中赋值
 
 */

class Person :NSObject{
    var name :String?
    var age :Int = 0
    
    override init() {
        // 在构造函数中，如果没有明确的super.init(),那么系统会自动调用super.init()
//        super.init()
        print("------")
    }
    
    // 自定义构造函数
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
//    // 自定义构造函数
//    init(dict:[String:AnyObject]) {
//        // as?转成一个可选类型
//        name = dict["name"] as? String
//        // as! 转成一个确定的类型
//        age = dict["age"] as! Int
//
//    }
    
    init(dict:[String:AnyObject]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}

let p  = Person()
let p1 = Person(name:"huluyang",age:19)
let p3 = Person(dict:["name":"123" as AnyObject,"age":10 as AnyObject])

