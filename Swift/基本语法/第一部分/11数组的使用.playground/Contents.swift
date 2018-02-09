//: Playground - noun: a place where people can play
import UIKit
/*
 1、数组的简介
    数组（Array）是一串有序的由相同类型元素构成的集合
    数组中的集合元素是有序的，可以重复出现
    swift中的数组类型是Array，是一个泛型集合
 
 2、数组的初始化
    数组可以分为可变数组和不可变数组
        使用let修饰不可变数组
        使用var修饰可变数组
 */

// 1、定义不可变数组 - let
let array = ["who","why","where"]

//2、定义可变数组
var arrayM1 = Array<String>() // 不常用
var arrayM2 = [String]() // 一般写法

// 2.1添加元素
arrayM2.append("what")
arrayM2.append("which")

// 2.2 删除元素
arrayM2.remove(at: 0)

//2.3 修改元素
arrayM2[0] = "who2"
arrayM2

//2.4 取出一个元素
let tempStr = arrayM2[0]

//3、数组的遍历
// 3.1根据下标值遍历
for i in 0..<array.count{
    print(array[i])
}

// 3.2直接遍历数组中的元素
for item in array{
    print(item)
}

// 3.3遍历数组中的前两个元素
for name in array[0..<2]{
    print(name)
}

//4、数组的合并 (只有相同类型的数组才可以进行合并，不同类型的不能相加合并)
let resultArr = arrayM2 + array

