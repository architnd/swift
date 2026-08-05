// Collections

#if false
// Arrays
var array1: [String] = ["a", "b", "c"]

// With Any, array can hold items of any data type
var array2: [Any] = ["a", "b", "c", 10, true]

//can skip type if arrray has all items of same type
var array3 = [1, 2, 3, 4, 5]

// .contains() method
if array1.contains("a") {
    print("Exists")
}

// for heterogeneous data

// check if type exists
// $0: Represents the current element being inspected as Swift loops through array2
// $1: Will be used for 2D Array
if array2.contains(where: { $0 is Int }) {
    print("Exists")
}

// check if specific element exists
if array2.contains(where: { ($0 as! String) == "b"}) {
    print("Exists")
}

// repeating keyword, .count method, isEmpty method
var myArray = [Int](repeating: 0, count: 100) // 0 will be repeated 100 times
let count = myArray.count
if myArray.isEmpty {
    print("Array is Empty")
} else {
    print("Array is not Empty")
}

#endif

#if false
// Access a specific element
var names = ["Andre", "Aileen", "Anthony"]
let firstName = names[0]
print(firstName)
names[1] = "Paul"
print(names)

// Appending
var arr = ["a"]
arr.append("b")
arr += ["c", "d"]
print(arr)

// Insert at specific position
var names1 = ["Amy", "Lou", "Chelsea", "Dan"]
names.insert("Bob", at: 0) // Here, 5 will give out of range Error
print(names)

// Removing
var names2 = ["Amy", "Lou", "Chelsea", "Dan"]
let chelsea = names2.remove(at: 2) // remove at position
print(chelsea)
print(names2)
let dan = names2.removeLast() // remove last element
print(dan)
print(names2)
names2.removeAll() // remove all elements
print(names2)

//Arrays within arrays (nesting of arrays)
let array1 = [1,2,3]
let array2 = [4,5,6]
let containerArray = [array1, array2]
let firstArray = containerArray[0]
let firstElement = containerArray[0][0]
print(containerArray)
print(firstArray)
print(firstElement)

#endif

// search indexed array vs associative array

#if false
// Dictionaries - [] for both array and dictionaries
// [String: Int] not necessary below, as Type is inferred automatically for correct values
var scores: [String: Int] = ["Richard": 500, "Luke": 400, "Cheryl": 800]
// Creating Empty Dictionaries - following 3 ways
var myDictionary = [String: Int]()
var myDictionary1 = Dictionary<String, Int>()
var myDictionary2: [String: Int] = [:]

var dict1 = ["a": 100, "b": 200]
print(dict1["c"]) // warning:Expression implicitly coerced from 'Int?' to 'Any'
// At compile time compiler doesn't know if "c" is in dictionary, so it treats it as optional, and instead of error it return nil.

// Adding or Modifying
dict1["c"] = 300
print(dict1["c"]) // warning:Expression implicitly coerced from 'Int?' to 'Any'
//In forkey, if key already exists, it updates the value, else the key gets added
let oldValue = dict1.updateValue(1000, forKey: "a")
print(oldValue) // warning:Expression implicitly coerced from 'Int?' to 'Any'
print(dict1)
let oldValue1 = dict1.updateValue(300, forKey: "d")
print(oldValue1) // warning:Expression implicitly coerced from 'Int?' to 'Any'
print(dict1)

// if let - used for Optional Binding to safely unwrap optional values.
// it verifies whether an optional contains a value or is nil
// No if var, as if we change condition inside if, it will become invalid
if let oldValue2 = dict1.updateValue(400, forKey: "e"){
    print("Updated")
}
print(dict1)

//removing
dict1["d"] = nil
print(dict1)
if let removedValue = dict1.removeValue(forKey: "c"){
    print("Removed")
}
print(dict1)
dict1.removeAll()
print(dict1)

//Accessing a dictionary
var scores1 = ["Richard": 500, "Luke": 400, "Cheryl": 800]
let players = Array(scores.keys)
let points = Array(scores.values)
print(players)
print(points)
// Accessing Using if let
if let cherylScore = scores1["Cheryl"] {
    print("Cheryl's score is \(cherylScore)")
} else {
    print("Player not found")
}
// Accessing using Default value
let lukeScore = scores1["Luke", default: 0] // Returns 400
let unknownScore = scores1["Alex", default: 0] // Key doesn't exist, returns 0

#endif

// Loops

#if false
// for loops
// for-in loops
for i in 1...5 { // closed range operator
    print(i)
}
for i in 1..<5 { // half-open range operators
    print(i)
}
for _ in 1...5 { // loops exactly 5 times while ignoring the current loop index
    //Why _ :It tells the Swift compiler it does not need to allocate memory or bind a variable name to the current number.
    // can use variable like i also
    print("Hello")
}

// iterate over Arrays
let names = ["Alice", "Bob", "Charlie"]
for name in names {
    print("Hello \(name)")
}

// iterate over Strings
for letter in "ABCDEFG" {
    print("The letter is \(letter)")
}
//for loops with tuples
//enumerated is function of the string, it returns a tuple
//.enumerated(): This method returns a sequence of pairs containing a counter (starting at 0) and the element.
for (index, letter) in "ABCDEFG".enumerated(){
    print("\(index): \(letter)")
}

// iterate over dictionary
// unordered for dictionary
let vehicles = ["unicyle": 1, "bicycle": 2, "tricycle": 3, "quad bike": 4]
for (vehicleName, wheelCount) in vehicles {
    print("A \(vehicleName) has \(wheelCount) wheels")
}

// Alternative to .enumerated() method, loop through arrays, strings(not sure)
let animals = ["Lion", "Tiger", "Bear"]
for i in 0..<animals.count {
    print("\(i): \(animals[i])")
}
#endif

// While Loop, Control Statements
#if false
// While loops
var numberOfLives = 3
/*//infinite loop
while numberOfLives > 0 {
    print("I still Have \(numberOfLives) lives")
}*/
var stillAlive = true
while stillAlive{
    print("I still Have \(numberOfLives) lives")
    numberOfLives -= 1
    if numberOfLives == 0 {
        stillAlive = false
    }
}
//control transfer statements
// break statement
for counter in -10...10{
    print(counter)
    if counter == 0 {
        break
    }
}

// Repeat-While Loops
var steps = 0
let wall = 2
repeat {
    print("step")
    steps += 1
    if steps == wall {
        print("You've hit a wall")
        break
    }
} while steps < 10//

// continue statement
struct Person {
    let name: String
    let age: Int
}
func sendEmail(to person: Person) {
    print("Email sent to \(person.name) (Age: \(person.age))")
}
let people = [
    Person(name: "Alice", age: 16),
    Person(name: "Bob", age: 22),
    Person(name: "Charlie", age: 17),
    Person(name: "Diana", age: 25)
]
for person in people {
    if person.age < 18 {
        continue
    }
    sendEmail(to: person)
}
#endif
