/*:
## Exercise - Return Values

 Write a function called `greeting` that takes a `String` argument called name, and returns a `String` that greets the name that was passed into the function. I.e. if you pass in "Sophie" the return value might be "Hi, Sophie! How are you?" Use the function and print the result.
 */
func greeting(name: String) -> String {
    return "Hi \(name)! How are you?"

}
print (greeting(name: "Sophie"))
print (greeting(name: "Emilio"))
//:  Write a function that takes two `Int` arguments, and returns an `Int`. The function should multiply the two arguments, add 2, then return the result. Use the function and print the result.
func multiply(number1: Int, number2: Int) -> Int {
    let result = number1 * number2 + 2
    return result
}
let result = multiply(number1: 5, number2: 5)
result
