//: Playground - noun: a place where people can play

//Swift 的字符是一个单一的字符字符串字面量，数据类型为 Character
let char : Character = "a"
print("char 的值为 \(char)")

//Swift 中不能创建空的 Character（字符） 类型变量或常量,一下会报错
//let char1 : Character = ""
//let char2 Character = ""

var str = "hello world !"
//遍历字符串中的字符
for ch in str.characters {
    print("\(ch)")
}


//字符串连接字符
var varA:String = "Hello "
let varB:Character = "G"

varA.append( varB )

print("varC  =  \(varA)")
