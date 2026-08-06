#if false
//Strings
let greeting = "Hello!"
var otherGreeting = "Salutations!"
print(greeting)
print(otherGreeting)
otherGreeting = "Bonjour!" //Mutable
print(otherGreeting)

// Multiline Strings
let joke = """
Q: Why did the chicken cross the road?
A: To get to the other side!
"""
print(joke)

// Strings are Struct type
var s1: String = "Archit"
var s2 = s1

let string1 = "Archit"
var string2 = "Archit"
print(string1 == string2) // returns true as structs are value type

let a = "a" //String
let b: Character = "b" //Character

#endif

// Escaping
#if false

// Print Backslash, newline, Double Quotes
// \" - Double quote
// \\ - Backslash
// \t - Tab
// \r - Carriage return
// \n - Newline
let greeting1 = "\tIt is \\traditional\\ \n in programming to print \r \"Hello, world!\""
print(greeting1)
var str1 = "abc\n"
var str2 = "def"
// \n vs \r
print(str1)
print(str2)
str1 = "abc\r"
print(str1)
print(str2)
#endif

//Basic String Operations
#if false

// Check Empty String - Property not a Method(Function)
var mystring = ""
if mystring.isEmpty{ // Computed property, here isEmpty is not a normal function, no parentheses
    print("The string is empty")
}

//Concatenation
let string1 = "Hello"
let string2 = ", world!"
var myString = string1 + string2
print(myString)
myString += " Hello!" //Compound operator
print(myString)

// Interpolation
let name = "Sophie"
let age = 30
print("\(name) is \(age) years old")
// Without Interpolation
let myString1 = name + " is " + String(age) + " years old"
print(myString1)
// Here in Below example,
// \(age1 + address1) does not work - tries to concatenate, but age1 is not a string
// \(age1 + 1) does work - adds 1 to age1
// \(age1, address1) does not work
// \(name1 + address1) does work - concatenates the strings
var name1 = "Archit"
var age1 = 20
var address1 = "Pune"
print("My name is \(name1) and age is \(age1 + 1) and addresss is \(address1)")
let a = 4
let b = 5
print("If a is \(a) and b is \(b), then a + b equals \(a+b)")

//lowercased() and uppercased() - method unlike isEmpty, which was a property
if name.lowercased() == "aRcHIt".lowercased(){
    print("The two names are equal")
}
#endif

// String Equality and Comparison
#if false
let month1 = "January"
let month2 = "February"
let month3 = "January"
print(month1 == month2)
print(month1 == month3)
print(month1 != month2)

//Prefix and Suffix
let greeting = "Hello! world!"
print(greeting.hasPrefix("Hello"))
print(greeting.hasSuffix("world!"))
print(greeting.hasSuffix("World!")) // case sensitive
print(greeting.hasPrefix("Hello! world!"))
print(greeting.hasSuffix("Hello! world!"))
let var1 = "Hello"
print(greeting.hasPrefix(var1))

// Finding Substrings
let greeting1 = "Hi Sophie, my name is Amy"
if greeting1.contains("my name is"){
    print("Making an Introduction")
}

//Checking Length
let name = "archit"
print(name.count)
let newPassword = "1234"
if newPassword.count < 8{
    print("This password is too short. Passwords should have atleast 8 characters")
}

//Using switch
let someCharacter: Character = "e"
switch someCharacter {
case "a","e","i","o","u":
    print("\(someCharacter) is a vowel")
default:
    print("\(someCharacter) is not a vowel")
}

#endif

#if false
//Unicode Supported
let fish = "🐟"
let credentials = "résumé"
let myName = "アーキット."
print(fish)
print(credentials)
print(myName)
print("∞".count)
#endif