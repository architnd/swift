var greeting = "Hello, playground"
print(greeting)
print("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n")
// Constants and Variables
//Type annotation required
let x1: String
//print(x1) // Cannot print before initialization
let x2 = 10 //Implicitly Casted
print(x2)
let x3: String = String(10) //Explicitly casted
print(x3)
let a: String = "abc"
//a = "def" //Cannot Assign value to constant
var b: String = "abc"
b = "def"
print(b)
let defaultScore = 100
var playerOneScore = defaultScore
var playerTwoScore = defaultScore
print(playerOneScore)
print(playerTwoScore)
playerOneScore = 200
print(playerOneScore)
print("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n")
// Class and Struct basic
class Student{
    let name: String = "Archit"
    var score: Int = 100
}
let student = Student()
print(student.name)
//Classes are reference types so we can change var values
student.score = 200
print(student.score)
struct Student1{
    var name: String = "Archit"
}
/*let student_ = Student1()
student_.name = "abc" //Does not work, structs are value types*/
var student_ = Student1()
student_.name = "abc"
print(student.name)
print("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n")
// Struct
struct Person{
    let firstName: String
    let lastName: String
    func sayHello(){
        print("Hello there! My name is \(firstName) \(lastName).")
    }
}
let person1 = Person(firstName: "Archit", lastName: "Deshpande")
/*Can use let/var here for object but can't change firstName/lastName as they are constants*/
person1.sayHello()
/*//Does not work
var person2 = Person()
person2.firstName = "Abc"
person2.lastName = "XYZ"
*/
print("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n")
// Class with Constant requires Initial value
class Person1{
    let firstName: String = "Archit"
    //let lastName: String // Does not work
    func sayHello(){
        print("Hello there! My name is \(firstName).")
    }
}
let person2 = Person(firstName: "Archit", lastName: "Deshpande")
person2.sayHello()
print("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n")
// Type Inference
let playerName = "Archit"
var playerScore = 1000
var gameOver = false
//playerScore = playerName // Does not work, Different Types, Type Safety

//Type Annotation common cases
//1.
let playerScore1: Int
//2.
let playerName1: String = "Archit"
//3.value can be more than one type
let middleInitial: Character = "A"
var remainingSistance: Float = 100
//large number - underscore instead of comma
var largeNumber = 1_000_000_000
print(largeNumber)
print("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n")
