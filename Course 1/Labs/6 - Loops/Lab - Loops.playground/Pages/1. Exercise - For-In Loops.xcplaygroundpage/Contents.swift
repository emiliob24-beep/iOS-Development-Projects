/*:
## Exercise - For-In Loops
 
 Create a for-in loop that loops through values 1 to 100, and prints each of the values.
 */
for values in 1...100 {
    print("This number is \(values)")
}

//:  Create a for-in loop that loops through each of the characters in the `alphabet` string below, and prints each of the values alongside the index.
let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 

for index in alphabet {
    print(index)
}
//:  Create a `[String: String]` dictionary, where the keys are names of states and the values are their capitals. Include at least three key/value pairs in your collection, then use a for-in loop to iterate over the pairs and print out the keys and values in a sentence.
var country = [String: String]()
country = ["Utah": "SLC", "Arizona": "Phoenix", "Colorado": "Denver"]
for state in country {
//    print("These \(country) are all states and their capitals in the U.S.")
    print("The capital of \(state.key) is \(state.value)")
}

/*:
page 1 of 6  |  [Next: App Exercise - Movements](@next)
 */
