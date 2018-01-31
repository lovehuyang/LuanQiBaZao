//: Playground - noun: a place where people can play
import UIKit
/*
 1、字典的简介
    swift中的字典类型是Dictionary，是一个泛型集合
 
 2、字典的初始化
    字典可以分为可变字典和不可变字典
        使用let修饰不可变字典
        使用var修饰可变字典
 */

// 1、定义
// 1.1 不可变字典
// 系统会自动判断后面的中括号中[]存放的是键值对还是一个一个的元素
let dict = ["name":"HLY","age":"18","height":"180"]

var dictM = [String :String]()

//2、对可变字典的基本操作
//2.1 添加元素
dictM["name0"] = "hanying0"
dictM["name1"] = "hanying1"
dictM["name2"] = "hanying2"

//2.2 删除元素
dictM.removeValue(forKey: "name0")
dictM

//2.3 修改元素
dictM["name2"] = "hanying222"
dictM

//2.4 获取一个元素
let tempStr = dictM["name2"]

//3、遍历字典
// 3.1 遍历字典中所有的key
for key in dictM.keys{
    print(key)
}

//3.2 遍历所有的值
for value in dictM.values{
    print(value)
}
// 3.3 遍历所有的键值对
for (key , value )in dictM{
    print("key为：\(key)   value为：\(value)")
}

//4、合并字典 (即使类型一致也不能进行相加操作)

var dict1 = ["00":"1","01":"12","02":"123"]
var dict2 = ["10":"321","11":"32","12":"1"]

for (key ,value) in dict2{
    dict1[key] = value
}
dict1



