import Foundation
import PlaygroundSupport

/*
 1 Use and understand Swift's basic types like Bool, Int, String, and Double
Створіть константи із вказаними значеннями двома способами (явно вказуючи тип і неявно)
Перевірте себе функцією type(of: тут вкажіть назву константи)
а) ціле число 1
b) дійсне число 1.0
с) рядок, що містить фразу Hello world!
d) рядок, що містить фразу The number is та константу з числом 42
e) хибне значення
f) істинне значення
*/

// a)
let xInt = 1
let yInt: Int = 1
type(of: xInt)
type(of: yInt)

// b)
let xDouble = 1.0
let yDouble: Double = 1.0
type(of: xDouble)
type(of: yDouble)

// c)
let xString = "Hello world!"
let yString: String = "Hello world!"
type(of: xString)
type(of: yString)

// d)
let str = "The number is "
let num = 42
let strNum = "The number is \(num)"
type(of: strNum)

// e)
let xBoolF = false
let yBoolF: Bool = false
type(of: xBoolF)
type(of: yBoolF)

// f)
let xBoolT = true
let yBoolT: Bool = true
type(of: xBoolT)
type(of: yBoolT)
/*
 2 Declare and use variables and constants (var let)
a) Зробіть константу цілого типу зі значенням 3
b) Зробіть змінну типу рядок зі значенням "The three is "
c) Змініть значення змінної на таке, що містить раніше створену константу
*/

// a)
let num3 = 3

// b)
var str3 = "The three is "

// c)
str3 = "The three is \(num3)"

/*
 3 Handle flow control and looping constructs (if for while switch)
a) Створіть розгалуження яке до змінної b додасть число 1 якщо b додатнє і відніме - якщо від'ємне
b) Пройдіть циклом по числам від 1 до 10 і виведіть їх (використайте спочатку for потім while)
c) Використайте switch із цілочисельною змінною який виведе фразу "Low" для значень від 1 до 18, "High" для 19-36, "Zero" для 0 та "Unknown" для решти значень
*/
// a)
var b = -5
if b > 0 {
    b += 1
} else {
    b -= 1
}

// b)
for x in 1...10 {
    print(x)
}
var w = 1
while w <= 10 {
    print(w)
    w += 1
}
// c)
var threeC = 0
switch threeC {
case 1...18:
    print("Low")
case 19...36:
    print("High")
case 0:
    print("Zero")
default:
    print("Unknown")
}

/*
4 Create and use collections (Array Set Dictionary)
a) Створіть масив (Array) цілих чисел та посортуйте його
b) Створіть дві множини (Set) цілих чисел та знайдіть їх перетин
с) Створіть Dictionary в якому ключем виступає рядок а значенням будь-який тип і заповніть його
*/
// a)
var arr4a = [10, 40, 100, 20, 80, 30, 50, 70, 60, 90]
arr4a.sort()

// b)
var set4b1 = Set(arrayLiteral: 1, 2, 2, 4, 5, 6, 7, 8, 9, 10)
var set4b2 = Set(arrayLiteral: 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
set4b1.intersection(set4b2)

// c)
var dic4c: [String: Any] = ["Andrei": 1.74, "Ivan": true, "Alex": 3]

/*
 5 Develop and use simple functions ( inout ->  )
а) Створіть функцію яка приймає на вхід масив і віддає найчастіше повторюване значення в ньому
b) Створіть функцію яка приймає на вхід масив і змінює його ж, додаючи до кожного значення 1
*/

// a)
func oft(array: [Int]) -> Int {
    var max: Int = 0
    var count: Int = 0
    var volume: Int = 0
    var ret = 0
    
    array.sorted()
    for val in array {
        if volume != val {
            volume = val
            count = 1
        } else {
            count += 1
            if max < count {
                max = count
                ret = volume
            }
        }
    }
    return ret
 }
oft(array: [1, 3, 3, 5, 3, 2, 3])

// b)
func plus1(in array: inout [Int]) {
    var result: [Int] = []
    for index in 0..<array.count {
        array[index] += 1
        result.append(array[index])
    }
    array = result
}
var arrPlus1 = [10, 20, 30]
plus1(in: &arrPlus1)

/*
 6-7 Cast objects safely from one type to another ( as! as? as init). Handle optionals and unwrap them safely (if let ; guard let ; != nil)
Створіть функцію яка приймає на вхід змінну типу Any? і вертає рядок в якому міститься тип значення переданої змінної.
(!) Для виконання цього завдання НЕ використовуйте метод type(of: ).
(!!) Для виконання цього завдання МОЖНА використовувати наступні конструкції (спробуйте кожну з них в окремії функції)
a) `if let`
b) `guard let`
c) switch.
*/

// a)
func typeOfa(ValueA: Any?) -> String {
    if let ValueA = ValueA as? String {
        ValueA
        return "String"
    } else if let ValueA = ValueA as? Int {
        ValueA
        return "Int"
    } else if let ValueA = ValueA as? Double {
        ValueA
        return "Double"
    } else if let ValueA = ValueA as? Bool {
        ValueA
        return "Bool"
    } else {
        ValueA
        return "Maybe an array"
    }
}

typeOfa(ValueA: "true")
typeOfa(ValueA: 123)
typeOfa(ValueA: false)
typeOfa(ValueA: 777.00)
typeOfa(ValueA: [2, 3, 4, 5])

// b)
func typeOfb(ValueB: Any?) -> String {
    guard let valB = ValueB else {
        return "Unknown"
    }
    if valB is Int {
        return "Int"
    } else if valB is Bool {
        return "Bool"
    } else if valB is Double {
        return "Double"
    } else if valB is String {
        return "String"
    } else {
        return "String"
    }
}
typeOfb(ValueB: "true")
typeOfb(ValueB: 123)
typeOfb(ValueB: false)
typeOfb(ValueB: 777.00)
typeOfb(ValueB: [2, 3, 4, 5])

// c)
func typeOfc(ValueC: Any?) -> String {
    switch ValueC {
    case is String:
        return "String"
    case is Int:
        return "Int"
    case is Double:
        return "Double"
    case is Bool:
        return "Bool"
    default:
        return "Maybe an array"
    }

}
typeOfc(ValueC: "The End")
typeOfc(ValueC: 123)
typeOfc(ValueC: false)
typeOfc(ValueC: 777.00)
typeOfc(ValueC: [2, 3, 4, 5])
