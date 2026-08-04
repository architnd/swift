// Programming Exercise: User Registration Validator

let firstName = "KaMaKshi"
let lastName = "Goyal"
let username = "KamaKshi_Goyal"
let password = "Swift@123"
let email = "kamakshi.goyal@mitwpu.edu.in"

// 1.
print("Welcome \(firstName.prefix(1).uppercased() + firstName.suffix(firstName.count - 1).lowercased()) \(lastName.prefix(1).uppercased() + lastName.suffix(lastName.count - 1).lowercased())!")

// 2.
if (username.lowercased().hasPrefix(firstName.lowercased().prefix(3))) && username.contains("_") {
    print("The username is valid!")
} else {
    print("The username is valid!")
}

// 3.
if (password.count >= 8) && password.contains("@"){
    print("The password is valid!")
} else if (password.count < 8){
    print("The password is invalid! Password should have 8 or more characters.")
} else {
    print("The password is invalid! Password should contain \"@\" symbol")
}

// 4.
if (email.contains("@")) && (email.hasSuffix(".edu.in")){
    print("Educational email verified.")
} else{
    print("Invalid email address.")
}

// 5.
let c: Character = password.lowercased().first ?? " "
switch c{
case "a","e","i","o","u":
    print("Password starts with a vowel.")
default:
    print("Password starts with a consonant, number, or symbol.")
}

// 6.
if firstName.lowercased() == lastName.lowercased(){
    print("First name and Last name of user are same.")
} else{
    print("First name and Last name of user are different.")
}

var summary: String = ""
if summary.isEmpty {
    summary = "Registration Successful "
}
summary += "- Welcome to the iOS Development Centre!"
print(summary)
