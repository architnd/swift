import UIKit

#if false
var a = 10
a=20

var score = 10/5
print(score)

print(score + a)
score = score + 3
print(score)
#endif
#if false
//compund assignment
let price = 1.7
var money = 3.1
money = money - price
print(Float(money))
money += 10
print(Float(money))
#endif
//optional
#if false
//Nil Coalescing(?? operator)
//Without ??, num1 will return Nil
var num = "Archit"
var num1 = Int(num) ?? 0 //if num cannot be converted to int, give 0
var num2 = 20
var result = num1 + num2

print(result)
print(num1)
#endif
#if false
//operator precedence example
var x = 3
var y = 5
var z = 10

print(z-y*x)
print((z-y)*x)
#endif
#if false
//Initializer, here unlike cpp, Int(y) does not convert the variable to Int, instead it creates ne instance of Int struct passing y as an argument.
var x = 5
var y = 0.214
var c = x + Int(y)
print(c)
#endif
#if false
//force unwrapping - act of forcefully extracting the underlying value from an Optional by placing an exclamation mark (!) directly after the variable or expression.
//If you force unwrap an optional that happens to be nil at runtime, your application will crash instantly.
var num = "abc"
var num2 = Int(num)
var res = num + " " + String(num2!)
print(res)
#endif


