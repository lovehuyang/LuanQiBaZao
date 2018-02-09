//: Playground - noun: a place where people can play
import UIKit
/*
二 如何定义类的属性
    类的属性的介绍，swift中类的属性有多种
        *存储属性：存储实例的常量和变量
        *计算属性：通过某种方式计算出来的属性
        *类属性：与整个类自身相关的属性
 
    存储属性
        *存储属性是简单的属性，它作为类的实例的一部分用于存储常量和变量
        *可以给存储属性提供一个默认值，也可以在初始化方法中对其进行初始化
        *下面是存储属性的方法
            age和name都是存储属性，用来记录该学生的年龄和姓名
            chineseScroce和mathScroce也是存储属性，用来记录该学生的语文分数和数学分数
 
 */

class Student:NSObject{
    // 定义属性
    // 定义存储属性
    var age:Int = 0
    var name:String? = nil // 可选类型
    
    var chineseScroce:Double = 0.0
    var mathScroce:Double = 0.0
    
    // 定义计算属性：通过别的属性计算得到结果的属性称之为计算属性
    var averageScore:Double{
        return (mathScroce + chineseScroce) *  0.5
    }
    
    /*
     // 定义类中的方法 （这是最low的写法，常见写法见上面的计算属性 ）
     func getAverage() -> Double {
     // 在swift中，如果使用当前对象的某一个属性，或者调用当前对象的某一个方法时，可以直接使用不需要像OC那样加self
     return (chineseScroce + mathScroce) * 0.5
     }
     */
    
    // 类属性：类属性是和整个类相关的属性，而且是通过类名进行访问
    static var courseCount :Int = 0
}

// 类属性赋值 （通过类名调用）
Student.courseCount = 2

// 实例化一个对象
let stu = Student()
stu.age = 18
stu.name = "huluyang"
stu.mathScroce = 55
stu.chineseScroce = 9

// 可选类型解包
if let name = stu.name {
    print(name)
}

stu.averageScore
