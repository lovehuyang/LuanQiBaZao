//: Playground - noun: a place where people can play
import UIKit
/*
 元组的简介（是swift中特有的，oc中没有）
    1、它是一种数据结构，在数学中广泛应用
    2、类似于数组或者字典
    3、可以用于定义一组数据
    4、组成元组类型的数据可以称之为“元素”
 */

// 1、定义
// 1.1 基本写法
let info = ("why",18,180)//保存一组信息
info.0
info.1

// 1.2 可以给元组的每一个元素起一个别名(常见)
let info1 = (name : "why",age : 18, height : 188)
info1.name
info1.1

// 1.3 元组中元素的别名，就是元组的名称
let (name , age , height) = ("why",18, 188)
name
age
height





