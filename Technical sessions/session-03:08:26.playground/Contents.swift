// Structures
//structs don't need initializer block
#if false
// Classes reqire initializer and parameter while making object
class Person {
    var personName: String = "Archit" //type annotation neccessary
    init(personName: String) {
        self.personName = personName
    }
}

let person1 = Person(personName: "")
print(person1.personName)
person1.personName = "Jane"
#endif

#if false

struct Person{
    var personName: String = "ABC" //default value not necessary but type annotation neccessary
    func sayHello() {
        print("Hello \(personName)")
    }
}
// Default Initializer
var person1 = Person()
print(person1.personName)
person1.sayHello()

struct Shirt{
    var size: String
    var color: String
}
let myShirt = Shirt(size: "M", color: "Blue")
let yourShirt = Shirt(size: "S", color: "White")

enum Direction {
    case left
    case right
    case straight
}
struct Car{
    var make: String
    var year: Int
    var color: String
    func startEngine() {}
    func drive() {}
    func park() {}
    func steer(direction: Direction) {}
}
let firstCar = Car(make: "Toyota", year: 2010, color: "White")
let secondCar = Car(make: "Honda", year: 2015, color: "Black")
firstCar.startEngine()
firstCar.drive()
#endif

#if false

let string1 = String() // empty string - default initializer
print(string1)
let string2 = "" // empty string way 2
let string3 = String("Hello") // memberwise initializer
//Preferred way - directly assigns value, instead of an extra call in above example
//RPC - Remote Procedure Call - not related
let string4 = "Hello"

let integer1 = Int() // default value is 0, same as - let integer1 = 0
print(integer1)

let boolean = Bool()
print(boolean)

struct Odometer {
    var count: Int
}
//var odometer = Odometer() // Does not assume default value 0 here
// memberwise initializer
var odometer = Odometer(count: 100)
print(odometer.count)

struct BankAccount {
    var accountNumber: Int
    var balance: Double = 0
}
let newAccount = BankAccount(accountNumber: 123, balance: 0)
let transferredAccount = BankAccount(accountNumber: 123)

#endif


#if true
// Custom Initializer
struct Temperature {
    var celsius: Double
}
let temperature = Temperature(celsius: 30.0)
let fahrenhiteValue = 98.6
let celsiusValue = (fahrenhiteValue - 32) / 1.8
let newTemperatue = Temperature(celsius: celsiusValue)

struct Temperature1 {
    var celsius: Double = 0
    init(){
        print("Hello")
    }
    init(celsius: Double){
        self.celsius = celsius
    }
    init(fahrenheit: Double){ // Custom Initializer
        celsius = (fahrenheit - 32) / 1.8
    }
}
let temp = Temperature1()
print(temp.celsius)
//let currentTemperature = Temperature1(celsius: 100)
//let boiling = Temperature1(fahrenheit: 212.0)
//print(currentTemperature.celsius)
//print(boiling.celsius)
#endif

#if true

//Instance methods
struct Size {
    var width: Double
    var height: Double
    func area() -> Double{
        width * height
    }
}
var somesize = Size(width: 10.0, height: 5.5)
let Area = somesize.area()
print(Area)

//Mutating methods
struct Odometer {
    var count: Int = 0
    /* // left side of mutating operator isn't mutable, functions are const by default
    func increment(){
        count += 1
    }*/
    mutating func increment(){
        count += 1
    }
    mutating func increment(by amount: Int){
        count += amount
    }
    mutating func reset(){
        count = 0
    }
}

var odometer1 = Odometer(count: 100)
print(odometer1.count)
odometer1.increment()
print(odometer1.count)
odometer1.increment(by: 4)
print(odometer1.count)
odometer1.reset()
print(odometer1.count)

let odometer2 = Odometer(count: 100)
//odometer2.increment() // Does not work for constants

#endif
