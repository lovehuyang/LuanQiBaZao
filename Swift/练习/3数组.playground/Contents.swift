//: Playground - noun: a place where people can play

//Swift 数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。
//Swift 数组会强制检测元素的类型，如果类型不同则会报错，Swift 数组应该遵循像Array<Element>这样的形式，其中Element是这个数组中唯一允许存在的数据类型。

//创建数组
// 创建语法
//var someArray = [SomeType](repeating: InitialValue, count: NumbeOfElements)
var testArr = [String](repeating: "hahahhahahha", count: 3)

var someVar = testArr[0]
print("\(someVar)")

//你可以使用 append() 方法数组末尾添加元素
testArr.append("hehe")
testArr.append("memeda")

//我们也可以通过索引修改数组元素的值
testArr[0] = "woshidiyi"

//遍历数组
for items in testArr {
    print("①遍历数组：\(items)")
}
for i in 0..<testArr.count {
    print("②遍历数组:\(testArr[i])")
}

//如果我们同时需要每个数据项的值和索引值，可以使用 String 的 enumerate() 方法来进行数组遍历
for (index , item) in testArr.enumerated() {
    print("③在位置\(index)处的元素为\(item)")
}

//合并数组,我们可以使用加法操作符（+）来合并两种已存在的相同类型数组
var arr1 = ["arr0","arr1","arr2"]
var arr2 = ["arr3","arr4","arr5"]
var arr = arr1 + arr2
for (index , item) in arr.enumerated() {
    print("④在位置\(index)的元素为\(item)")
}


//以下实例创建了含有2个元素的数组
var someArr = ["obg1","obg2"];

//我们可以使用 count 属性来计算数组元素个数
//我们可以通过只读属性 isEmpty 来判断数组是否为空，返回布尔值







// 练习
var testArr2 = [String](repeating: "wenwenwen" ,count :10)
var testArr3  = ["元素1","元素2"]

var testArr4 = testArr2 + testArr3

// 根据下标修改元素
testArr4[2] = "memeda"

var testArry = [String](repeating :"aini", count : 10)

for (index , item) in testArry.enumerated() {
    print("位置：\(index)  元素：\(item)")
}





