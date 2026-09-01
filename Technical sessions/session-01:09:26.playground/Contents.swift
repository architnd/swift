// Closures
#if false

func add(a: Int, b: Int) {
    print(a + b)
}
add(a: 10, b: 20)

// add1 is a closure
let add1 = { (a: Int, b: Int) in
    return a + b
}
print(add1(10, 20))

// We can pass closure as parameter to another function
func add2(a: Int, b: Int, operation: (Int, Int) -> Int){
    print(add1(a,b))
}
add2(a: 10, b: 20, operation: add1)

// closure as parameter in closure
let add3 = { (a: Int, b: Int, operation: (Int, Int) -> Int) in
        return operation(a,b)
}
print(add3(10, 20, add1))

// A closure with no parameters and no return value
let printClosure = { () -> Void in
    print("This closure does not take any parameters and does not return any value")
}

//
struct Track {
    let trackNumber: Int
}
let tracks = [
    Track(trackNumber: 3),
    Track(trackNumber: 1),
    Track(trackNumber: 4),
    Track(trackNumber: 2)
]
let sortedTracks = tracks.sorted { (firstTrack: Track, secondTrack: Track) -> Bool in // we can remove -> Bool
    return firstTrack.trackNumber < secondTrack.trackNumber
}
// Syntactic sugar
let sortedTracks2 = tracks.sorted { return $0.trackNumber < $1.trackNumber} // can remove return as well
//let sortedTracks4 = tracks.sorted (by: >) //check
print(sortedTracks)
print(sortedTracks2)
printClosure()

//Collection functions using closures
let firstNames = ["Aga", "Antonio", "Sophie", "Trev"]
// Without Closures
var fullNames: [String] = []
for name in firstNames {
    let fullName = name + " Smith"
    fullNames.append(fullName)
}
print(fullNames)
// with closure and .map
let fullNames2 = firstNames.map { (name) -> String in
    return name + " Smith"
}
let fullNames3 = firstNames.map{ $0 + " Smith" }
print(fullNames2)
print(fullNames3)

// .filter
let numbers = [4, 8, 15, 16, 23, 42]
// Without Closure
var numLessThan20_0: [Int] = []
for num in numbers {
    if num < 20 {
        numLessThan20_0.append(num)
    }
}
print(numLessThan20_0)
// With Closure and .filter
let numbersLessThan20_1 = numbers.filter { (number) -> Bool in
    return number < 20
}
print(numbersLessThan20_1)
// Syntactic sugar
let numbersLessThan20_2 = numbers.filter { $0 < 20 }
print(numbersLessThan20_2)

// .reduce
// Without Closure
var total = 0
for number in numbers {
    total = total + number
}
print(total)
// With Closure and .reduce
let total2 = numbers.reduce(0) { (currentTotal, newValue) -> Int in //here, 0 is initial value for currentTotal
    return currentTotal + newValue
}
print(total2)
let total3 = numbers.reduce(0, {$0+$1})
let total4 = numbers.reduce(0, +)
print(total3)
print(total4)

#endif

// Protocols - there are no pointers in swift, they are like interfaces in java
#if true

/* // Bad code
struct Student {
    var name: String
    func login() {
        print("\(name) logged in")
    }
}

struct Teacher {
    var name: String
    func login() {
        print("\(name) logged in")
    }
}
func performLogin(student: Student){
    student.login()
}
func performLogin(teacher: Teacher){
    teacher.login()
}
*/
protocol Loginable { // User Defined Protocol
    func login()
}
//struct S: Loginable {} //whenever any stucture/class adopts a protocol, we need to conform that
// To conform the protocol we need to implement the methods declared inside the protocol

struct Student: Loginable { // Student stucture is adopting/implementing the Loginable Protocol.
    var name: String
    
    func login() {
        print("\(name) logged in")
    }
}
struct Teacher: Loginable {
    var name: String
    
    func login() {
        print("\(name) logged in")
    }
}

func performLogin(user: Loginable){
    user.login()
}
let student = Student(name: "Archit")
let teacher = Teacher(name: "Abhishek")

performLogin(user: student)
performLogin(user: teacher)

//Predefined Protocols:
//CustomStringConvertible
//Equatable
//Comparable
//Codable

//printing with CustomStringConvertible
//used in print statement to print any type of data
let string = "Hello, world"
print(string)
let number = 42
print(number)
let boolean = false
print(boolean)

class Shoe: CustomStringConvertible { // requires description property
    var description: String {
        return "Shoe(color: \(color), size: \(size), hasLaces: \(true))"
    }
    let color: String
    let size: Int
    let hasLaces: Bool
    
    init(color: String, size: Int, hasLaces: Bool) {
        self.color = color
        self.size = size
        self.hasLaces = hasLaces
    }
}
let myShoe = Shoe(color: "Black", size: 12, hasLaces: true)
print(myShoe)

struct Shoe1 { // struct is already value type
    let color: String
    let size: Int
    let hasLaces: Bool
    
    init(color: String, size: Int, hasLaces: Bool) {
        self.color = color
        self.size = size
        self.hasLaces = hasLaces
    }
}
let myShoe1 = Shoe1(color: "Black", size: 12, hasLaces: true)
print(myShoe1)

// Comparing information with Equatable
struct Employee: Equatable, Comparable {
    let firstName: String
    let lastName: String
    let jobTitle: String
    let phoneNumber: String
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
        && lhs.jobTitle == rhs.jobTitle && lhs.phoneNumber == rhs.phoneNumber
    }
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.lastName < rhs.lastName
    }
}
let firstObject = Employee(firstName: "archit", lastName: "deshpande", jobTitle: "student", phoneNumber: "9999999999")
let secondObject = Employee(firstName: "archit", lastName: "deshpande", jobTitle: "student", phoneNumber: "9999988888")
if firstObject == secondObject { // Requires Equatable protocol, as the are objects not values
    print("They are equal")
} else {
    print("They are not equal")
}
//func == (lhs: Employee, rhs: Employee) -> Bool { // Custom == function
//    if lhs.firstName == rhs.firstName {
//        return true
//    } else {
//        return false
//    }
//}
// Comparable added above
let employee1 = Employee(firstName: "Rich", lastName: "Dinh", jobTitle: "Senior Manager", phoneNumber: "415-555-7770")
let employee2 = Employee(firstName: "Jenny", lastName: "Court", jobTitle: "CEO", phoneNumber: "415-555-7768")
let employee3 = Employee(firstName: "Jenica", lastName: "Chong", jobTitle: "Front Desk", phoneNumber: "415-555-7767")
let employee4 = Employee(firstName: "Trev", lastName: "Smith", jobTitle: "Sales Lead", phoneNumber: "415-555-7772")
let employee5 = Employee(firstName: "Rigo", lastName: "Rangel", jobTitle: "Accountant", phoneNumber: "415-555-7771")

let employees = [employee1, employee2, employee3, employee4, employee5]
let sortedEmployees = employees.sorted(by:<)
for employee in sortedEmployees {
    print(employee)
}
#endif


