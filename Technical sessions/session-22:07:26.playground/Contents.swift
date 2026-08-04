#if false
// == / === operators
var a = 10
var b = 10
print(a == b)
//=== is used to comaper objects of class
class Person{
    var name: String
    init(name: String) {
        self.name = name
    }
}

var p1 = Person(name: "Archit")
var p2 = Person(name: "Archit")
print(p1 === p2) // returns false as it is located at different memory location(different objects)

var p3 = p1
print(p1 === p3) //returns true as it is located at same memory location(same object)
#endif
#if false
// if-else condition
let temperature = 100
if temperature >= 100 {
    print("The water is boiling.")
} else {
    print("The water is not boiling.")
}
#endif
#if false
//operators =,>,<,!,&&,||
let number = 1000
let isSmallNumber = number < 10
print(isSmallNumber)
let speedLimit = 65
let currentSpeed = 72
let isSpeeding = currentSpeed > speedLimit
print(isSpeeding)
var isSnowing = false
if !isSnowing{
    print("It is not snowing")
}
#endif
#if false
// Switch Cases
//Ex-1
var value = 1
switch value {
case 1:
    print("one") // no break statement for switch case in swift
    fallthrough // next case after execution of a case is also considered
case 3:
    print("three")
    //fallthrough
case 2:
    print("two")// Cases dont have to be in sequence
    fallthrough
default:
    print("other")
}
//Ex-2
let numberOfWheels = 2
switch numberOfWheels{
case 0:
    print("Missing Something?")
case 1:
    print("Unicycle")
case 2:
    print("Bicycle")
case 3:
    print("Tricycle")
case 4:
    print("Quadcycle")
default:
    print("That's a lot of wheels!")
}
//Ex-3, combine multiple cases
let character = "z"
switch character {
case "a","e","i","o","u":
    print("This character is a vowel.")
default:
    print("This character is not a vowel.")
}
//Ex-4 Using enum, we can avoid default, if we cover all cases
enum Direction: String {
    case north
    case south
    case east
    case west
}
var direction: Direction = .north
switch direction {
case .north:
    print("Go north")
case .south:
    print("Go south")
case .east:
    print("Go east")
case .west:
    print("Go west")
}
//Ex-5 Using range
var distance = 9
switch distance {
case 0...9:
    print("Your destination is close.")
case 10...99:
    print("Your destination is a medium distance from here.")
case 100...999:
    print("Your destination is far from here.")
default:
    print("Are you sure you want to travel this far?")
}
//Ex-6
let temperature = 150
if temperature >= 65 && temperature <= 75 {
    print("The temperature is just right.")
} else if temperature < 65 {
    print("Its too cold.")
} else {
    print("Its too hot.")
}
//Now write this with switch statement
switch temperature{
case Int.min...64:
    print("Its too cold.")
case 65...75:
    print("The temperature is just right.")
case 76...Int.max:
    print("Its too hot.")
default:
    print("Invalid temperatue!")
}
#endif
#if false
//Ternary operator (instead of if else)
var largest:Int
let a = 10
let b = 20
//variable = condition ? true_value : false_value
largest = (a > b) ? a : b
print(largest)
#endif
