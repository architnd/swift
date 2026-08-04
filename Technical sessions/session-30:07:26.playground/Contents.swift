
// Functions
func displayPi() {
    print("3.1415926")
}
displayPi()

// Function Parameters
func triple(value: Int) {
    let result = value * 3
    print(result)
}
triple(value: 5)

// Multiple Function Parameters
func multiply(firstNumber: Int, secondNumber: Int) {
    let result = firstNumber * secondNumber
    print(result)
}
multiply(firstNumber: 10, secondNumber: 3)

// Return values with ->
func multiply1(firstNumber: Int, secondNumber: Int)->Int
{
    let result = firstNumber * secondNumber
    return result
}
print(multiply1(firstNumber: 10, secondNumber: 3))

// omit lables with '_'
//custom external labels before parameter('to' in this case)
func add(_ firstNumber: Int, to secondNumber: Int)->Int {
    firstNumber + secondNumber
}
print(add(14, to: 6))

// default parameter value in function
func add(num1: Int, num2: Int = 0) {
    print(num1 + num2)
}
add(num1: 10) //if 2nd paramater not added, here, it takes default value
