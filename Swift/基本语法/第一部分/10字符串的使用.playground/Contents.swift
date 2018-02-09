//: Playground - noun: a place where people can play
import UIKit
/*
 字符串的简介
 *oc和swift中字符串的区别
    1、在oc中字符串类型是NSString类型，在swift中字符串是String类型
    2、OC中字符串@“”，swift中“”
 
 *使用String的原因
    1、String是结构体类型，性能更高
    2、OC中的字符串是NSObject对象类型，性能略差
    3、String支持直接遍历
    4、swift提供了String和NSString之间的无缝转换
 */

//1、字符串定义
let  string = "hello world"

// 2、遍历字符串
for c in string{
    print(c)
}

//3、拼接
//3.1 两个字符串之间的拼接
let str1 = "字符串1"
let str2 = "zifuchuan"
let str3 = str1 + str2

// 3.2 字符串和其他标识符之间的拼接 \(value)
let name = "why"
let age = 18
let height = 1.88
let info = "我的名字\(name) ,我的年龄\(age),我的身高\(height)"

//3.3 拼接字符串时，字符串的格式化
let min = 2
let second = 6
let timStr = String(format:"%02d:%02d",arguments:[min, second])

// 4、截取
let urlStr = "www.520t.com"
// 先把string类型转换成NSString类型，然后再使用nsstring的方法截取
let headerStr = (urlStr as NSString).substring(to: 3)
let midStr = (urlStr as NSString).substring(with: NSMakeRange(4, 4))
let footStr = (urlStr as NSString).substring(from: 9)
