//: Playground - noun: a place where people can play

//Swift 字典用来存储无序的相同类型数据的集合，Swift 字典会强制检测元素的类型，如果类型不同则会报错
// 创建字典 - 语法
// 我们可以使用以下语法来创建一个特定类型的空字典：
// var someDict =  [KeyType: ValueType]()
var dict1 = ["key1":"value1","key2":"value2","key3":"value3"]

// 访问字典的元素
var value1 = dict1["key1"]
print("字典的value：\(String(describing: value1))")

//修改字典 - 修改字典的值
//方法1、我们可以使用 updateValue(forKey:) 增加或更新字典的内容。如果 key 不存在，则添加值，如果存在则修改 key 对应的值。updateValue(_:forKey:)方法返回Optional值。实例如下：
[dict1 .updateValue("qinqin", forKey: "key1")]
print("\(dict1)")

//方法2、直接通过字典的key修改其value值
dict1["key2"] = "heheda"
print("\(dict1)")

//修改字典 - 移除 Key-Value 对
// 方法1、removeValueForKey() 方法
var removeValue = [dict1 .removeValue(forKey: "key1")] // 返回值为被移除的 value
print("dict1-  \(dict1)  removeValue - \(removeValue)")

//方法2、也可以通过指定键的值为 nil 来移除 key-value（键-值）对。
dict1["key2"] = nil
print("dict1-  \(dict1) ")


//遍历字典
//方法1、for-in 循环
var dict2 = ["key1":"value1","key2":"value2","key3":"value3","key4":"value4",]
for (key , value) in dict2 {
    print("①遍历字典key: \(key) --- value:\(value)")
}
//方法2、enumerate()方法来进行字典遍历，返回的是字典的索引及 (key, value) 对
for (key , value) in dict2.enumerated() {
    print("②遍历字典 key :\(key) - value:\(value)")
}


//字典转换为数组 - 提取字典的键值(key-value)对，并转换为独立的数组
let keyArr = [String](dict2.keys)
let valueArr = [String](dict2.values)
for key in keyArr {
    print("字典转数组：key \(key)")
}

for value in valueArr {
    print("字典转数组：value \(value)")
}

// count 属性
let count = dict2.count

// isEmpty 属性
let  isEmpty = dict2.isEmpty


