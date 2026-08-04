//Computed Properties(next 3 blocks)
#if false
// Bad way to write
struct Temperature {
    let celsius: Double
    let fahrenheit: Double
    let kelvin: Double
}
let temperature = Temperature(celsius: 0, fahrenheit: 32, kelvin: 273.15)
#endif

#if false
// This code is too long
// All Properties need to be initialized
struct Temperature {
    let celsius: Double // had var in example code for all 3
    let fahrenheit: Double
    let kelvin: Double
    init (celsius: Double){
        self.celsius = celsius
        fahrenheit = celsius * 1.8 + 32
        kelvin = celsius + 273.15
    }
    init (fahrenheit: Double){
        self.fahrenheit = fahrenheit
        celsius = (fahrenheit - 32) / 1.8
        kelvin = celsius + 273.15
    }
    init (kelvin: Double){
        self.kelvin = kelvin
        celsius = kelvin - 273.15
        fahrenheit = celsius * 1.8 + 32
    }
}
//let temperature = Temperature(celsius: 0, fahrenheit: 32, kelvin: 273.15) // cannot use for let, all values are assigned at celsius:0 itself
let temperature = Temperature(celsius: 0)
print(temperature.celsius, temperature.fahrenheit, temperature.kelvin)
#endif

#if false
// Computed properties are always var
// They are not stored, They are calculated on the fly
struct Temperature {
    var celsius: Double
    var fahrenheit: Double {
        celsius * 1.8 + 32
    }
    var kelvin: Double {
        celsius + 273.15
    }
}
let currentTemperature = Temperature(celsius: 0.0)
print(currentTemperature)  // prints Temperature(celsius: 0.0) as only celsius value is stored, and fahrenheit value is calculated on the fly
print(currentTemperature.fahrenheit)
#endif

#if false
// Property Observers
//willSet - Called just before the value is stored, provides implicit constant 'newValue' containing upcoming value
//didSet - Called immediately after the value is stored, provides implicit constant 'oldValue' containing previous value
struct StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                 print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
var stepCounter = StepCounter()
stepCounter.totalSteps = 40
stepCounter.totalSteps = 100
#endif

//Type Properties and methods
#if false
//static properties and methods belong to the the struct and not instances
// They are shared across instances
// They are called without creating object
struct Temperature {
    static let boilingPoint = 100.0 // static needs let, var will give warning, not error, but let is preffered
    
    static func convertedFromFahrenheit(_ temperatureInFahrenheit: Double) -> Double {
        (temperatureInFahrenheit - 32) * 5/9
    }
    // This is class-level/type method - called directly on type itself
}
let boilngPoint = Temperature.boilingPoint
print(boilngPoint)
let currentTemperature = Temperature.convertedFromFahrenheit(99)
print(currentTemperature)
let positiveNumber = abs(-4.14)
print(positiveNumber)
//var temperature = Temperature()
//print(temperature.boilingPoint) // does not work
#endif

#if false
// Copying
// Structs are value type, therefore, only values are copied here to new instance
// Separate copy is created only when any property of original object changes
struct Size {
    var width: Double
    var height: Double
}
var someSize = Size(width: 250, height: 1000)
var anotherSize = someSize // separate copy is not created here // Deep Copy
someSize.width = 500 // Separate instance is created here
print(someSize.width)
print(anotherSize.width)
#endif

#if false
//Self
struct Car {
    var color: String
    var description: String {
        "A car of \(color) color"
    }
}
struct Temperature {
    var celsius: Double
    init(celsius: Double) {
        self.celsius = celsius
    }
}
#endif

// Classes, Inheritance

#if false
// Classes are Reference Types - Objects hold memory address to where the data is stored
// 1 member
// 2 methods
class Person{
    var name: String
    init(name: String) {
        self.name = name
    }
    func sayHello() {
        print("Hello there!")
    }
}
//Implicitly called init method below(on its own)
let person = Person(name: "Xiaomeng") // instantiating a class
print(person.name)
person.sayHello() // Explicitly called sayHello() method

// Shallow Copy/Reference Copy - Only reference address stored in person
var secondPerson = person //secondPerson is a reference variable here, not object
print(secondPerson.name)
print(person.name)
secondPerson.name = "Archit"
print(secondPerson.name)
print(person.name)

var thirdPerson = "ABC"
// Here, we have created 3 reference variables, but 2 point to same memory location
#endif

#if false
// Changing value of property inside a method
// No mutating keyword in class
// 1 property below
// 3 methods below
class Odometer {
    var count: Int = 0
    init(count: Int) {
        self.count = count
        print(self) // self contains the address of object
    }
    func increment(){
        self.count += 1
    }
    func printCount(){
        print("Distance in Odometer: \(self.count)")
    }
    /* // Does not work
    mutating func increment(){
        count += 1
    }
    mutating func increment(by amount: Int){
        count += amount
    }
    mutating func reset(){
        count = 0
    }*/
}

let odometer1 = Odometer(count: 100) //init is called here
odometer1.printCount()
odometer1.increment()
odometer1.printCount()

#endif

// Inheritance

#if false
// No default multiple inheritance in Swift(Can be achieved by Protocol concept)
// extends keyword for inheritance in java
// No public,private,protected specifier like cpp in inheritance

class Vehicle {
    var currentSpeed = 0.0 // stored property // no innit error, as value is initialized
    var description: String { // computed property
        "traveling at \(currentSpeed) miles per hour"
    }
    init(currentSpeed: Double = 0.0) {
        self.currentSpeed = currentSpeed
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}
let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")
let someVehicle2 = Vehicle(currentSpeed: 100)
print("Vehicle: \(someVehicle2.description)")

class Bicycle: Vehicle {
    var hasBasket = false
//    override init(currentSpeed: Double = 0.0) {
//        super.init()
//        self.currentSpeed = currentSpeed
//    }
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

// override
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo!")
    }
}
let train = Train()
train.makeNoise()

//super keyword is used by a subclass to access methods, properties, or initializers from its parent class (superclass)
class Car: Vehicle {
    var gear = 1
    override var description: String {
        super.description + " in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

// override initializer
class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Student: Person {
    var favoriteSubject: String
    init(name: String, favoriteSubject: String) {
        self.favoriteSubject = favoriteSubject //resolve the current class property first then move to super
        super.init(name: name)
    }
}

#endif

//Assignment
class Event {
    var eventName: String
    var location: String
    var date: String
    var organizer: String
    init(eventName: String, location: String, date: String, organizer: String) {
        self.eventName = eventName
        self.location = location
        self.date = date
        self.organizer = organizer
    }
    func scheduleEvent() {
        print("\(eventName) is scheduled on \(date)")
    }
    func rescheduleEvent(date: String) {
        self.date = date
        print("\(eventName) is rescheduled on \(date)")
    }
    func displayInfo() {
        print("Event Name: \(eventName)")
        print("Location: \(location)")
        print("Date: \(date)")
        print("Organizer: \(organizer)")
    }
}
class Satsang: Event {
    var speakerName: String
    var bhajanList: [String]
    var duration: Int
    init(eventName: String, location: String, date: String, organizer: String, speakerName: String, bhajanList: [String], duration: Int){
        self.speakerName = speakerName
        self.bhajanList = bhajanList
        self.duration = duration
        super.init(eventName: eventName, location: location, date: date, organizer: organizer)
    }
    func addBhajan(bhajanName: String) {
        bhajanList.append(bhajanName)
    }
    func displayBhajans(date: String) {
        print("Bhajans for \(date): \(bhajanList.joined(separator: ", "))")
    }
    override func displayInfo() {
        super.displayInfo()
        print("Speaker Name: \(speakerName)")
        print("Bhajan List: \(bhajanList.joined(separator: ", "))")
        print("Duration: \(duration)")
    }
}

class Concert: Event {
    var performer: String
    var genre: String
    var ticketPrice: Double
    var seatsAvailable: Int
    init(eventName: String, location: String, date: String, organizer: String, performer: String, genre: String, ticketPrice: Double, seatsAvailable: Int) {
        self.performer = performer
        self.genre = genre
        self.ticketPrice = ticketPrice
        self.seatsAvailable = seatsAvailable
        super.init(eventName: eventName, location: location, date: date, organizer: organizer)
    }
    func bookTicket(count: Int) {
        if seatsAvailable >= count {
            seatsAvailable -= count
            print("Successfully booked \(count) ticket(s).")
        } else {
            print("Booking failed! Not enough seats available.")
        }
    }
    func isSoldout() {
        if seatsAvailable == 0 {
            print("Concert is sold out!")
        } else {
            print("Seats are available!")
        }
    }
    override func displayInfo() {
        super.displayInfo()
        print("Performer: \(performer)")
        print("Genre: \(genre)")
        print("Ticket Price: \(ticketPrice)")
        print("Seats Available: \(seatsAvailable)")
    }
}
class MeditationSession: Satsang {
    override init(eventName: String, location: String, date: String, organizer: String, speakerName: String, bhajanList: [String], duration: Int) {
            super.init(eventName: eventName, location: location, date: date, organizer: organizer, speakerName: speakerName, bhajanList: bhajanList, duration: duration)
        }
}
class RockConcert: Concert {
    override init(eventName: String, location: String, date: String, organizer: String, performer: String, genre: String, ticketPrice: Double, seatsAvailable: Int) {
            super.init(eventName: eventName, location: location, date: date, organizer: organizer, performer: performer, genre: genre, ticketPrice: ticketPrice, seatsAvailable: seatsAvailable)
        }
}

let morningMeditation = MeditationSession(eventName: "Sunrise Inner Peace Retreat", location: "Pune Osho Ashram", date: "15-Aug-2026", organizer: "Pune Wellness Society", speakerName: "Swami Anand", bhajanList: ["Om Chanting", "Shanti Mantra"], duration: 90)
print()
morningMeditation.scheduleEvent()
print()
morningMeditation.rescheduleEvent(date: "17-Aug-2026")
print()
morningMeditation.addBhajan(bhajanName: "Gayatri Mantra")
morningMeditation.displayBhajans(date: "17-Aug-2026")
print()
morningMeditation.displayInfo()
print()

print("----------------")
let summerRockFest = RockConcert(eventName: "Monsoon Rock Arena", location: "NH7 Weekender Grounds", date: "20-Aug-2026", organizer: "Live Nation", performer: "The Local Train", genre: "Indie Rock", ticketPrice: 1500.00, seatsAvailable: 5000)
print()
summerRockFest.scheduleEvent()
print()
summerRockFest.rescheduleEvent(date: "22-Aug-2026" )
print()
summerRockFest.bookTicket(count: 5000)
print()
summerRockFest.isSoldout()
print()
summerRockFest.displayInfo()
print()

