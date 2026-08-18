// Optionals
#if false
struct Book {
    let name: String
    let publicationYear: Int? // optional value
}

let firstDickens = Book(name: "A Christmas Carol", publicationYear: 1843)
let secondDickens = Book(name: "David Coperfield", publicationYear: 1849)

let books = [firstDickens, secondDickens]

// nil
let unannouncedBook = Book(name: "Rebels and Lions", publicationYear: nil) // nil won't work without ? above

// specifying type of an optional

var serverResponseCode1 = 404
//var serverResponseCode2 = nil // nil requires contextual type
var serverResponseCode3: Int? = 404
var serverResponseCode4: Int? = nil

// Working with optional values
// Force-unwrap - if optional valu is not nil, it needs to be unwrapped
// ? and ! work hand in hand
if firstDickens.publicationYear != nil {
    let actualYear = firstDickens.publicationYear!
    print(actualYear)
}
print(type(of: firstDickens.publicationYear))

// Force Unwrappping does not work if optional is nil
//let unwrappedPublicationYear = unannouncedBook.publicationYear!

// Optional Binding - if let force unwraps optional if it is not nil
if let unwrappedPublicationYear = firstDickens.publicationYear {
    print("The book was published in \(unwrappedPublicationYear)")
} else {
    print("The book does not have an official publication date.")
}
// example on your own
struct employee{
    let name: String?
    let empID: Int?
}
let emp1 = employee(name: nil, empID: nil)
let emp2 = employee(name: "Archit", empID: nil)
let emp3 = employee(name: nil, empID: 123)
//print(emp1.empID!)
print(emp2.name!)
#endif

// Functionals and Optionals
#if false
// Defining Examples
func printFullName(firstName: String, middleName: String?, lastName: String?){}
import Foundation
func textFromURL(url: URL) -> String? {
    return url.absoluteString
}
//f1? (x1, x2) //search about call function with optional chaining, f1 is func

// Failable initializers
struct Toddler {
    var birthName: String
    var monthsOld: Int

    init?(birthname: String, monthsOld: Int){
        if monthsOld < 12 || monthsOld > 36 {
            return nil
        } else{
            self.birthName = birthname
            self.monthsOld = monthsOld
        }
    }
}
let possibleToddler = Toddler(birthname: "Evania", monthsOld: 14)
if let toddler = possibleToddler { // toddler is not another instance here(check)
    print("\(toddler.birthName) is \(toddler.monthsOld) months old.")
} else {
    print("The age you specified for the toddler is not between 1 and 3 yrs of age.")
}

// Optional Chaining
struct Person {
    var age: Int
    var residence: Residence?
}
struct Residence {
    var address: Address?
}
struct Address {
    var buildingNumber: String?
    var streetName: String?
    var apartmentNumber: String?
}
let person = Person(age: 10,residence: Residence(address: Address(buildingNumber: "A", streetName: "Baner", apartmentNumber: "306" )))
// Option 1
if let theResidence = person.residence {
    if let theAddress = theResidence.address {
        if let theApartmentNumber = theAddress.apartmentNumber{
            print("They live in apartment number \(theApartmentNumber)")
        }
    }
}
// Option 2
if let theApartmentNumber = person.residence?.address?.apartmentNumber {
    print("They live in apartment number \(theApartmentNumber)")
}
#endif
