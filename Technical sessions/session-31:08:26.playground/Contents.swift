// guard - to avoid pyramid of doom and better readability
// sometimes, the corresponding if and else blocks are too far away
func divide(_ number: Double, by divisor: Double){
    if divisor != 0.0 {
        let result = number / divisor
        print(result)
    }
}
func divide2(_ number: Double, by divisor: Double){
    guard divisor != 0.0 else {
        return
    }
    let result = number / divisor
    print(result)
}
divide(4, by: 2)
divide(3, by: 0)
divide2(10, by: 2)
divide2(10, by: 0)
divide2(0, by: 2)

// guard let
func processBook(title: String?, price: Double?, Pages: Int?){
    if let theTitle = title, let thePrice = price, let thePages = Pages {
        print("\(theTitle) costs \(thePrice) and has \(thePages) pages.")
    }
}
func processBook2(title: String?, price: Double?, Pages: Int?){
    guard let theTitle = title, let thePrice = price, let thePages = Pages else {
        return
    }
    print("\(theTitle) costs \(thePrice) and has \(thePages) pages.")
}
processBook(title: "title1", price: 299, Pages: 150)
processBook2(title: "title2", price: 499, Pages: 320)
