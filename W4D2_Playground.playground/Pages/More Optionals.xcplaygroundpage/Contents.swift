/*:
 ## More Optionals
 Let's start off with some review of optionals.
 When we have an optional variable, the variable might contain a value or it can contain nil. Optionals are represented with a '?' after the variable type.
 */
/*:
 - Experiment:
 Declare a optional Double value and set it to nil.
 */

var beesCount :Double? = nil

/*:
 - Experiment:
 Assign a value your optional Double.
 */
beesCount = 55.5

/*:
 - Experiment:
 Force unwrap the optional value. Why do you have to be careful about force unwrapping?
 */
var numberBugs = beesCount!
//if it is nil, there will be a runtime error

/*:
 - Experiment:
 Use conditional unwrapping to verify if the optional has a value. Print the value if there is something, otherwise, print out to indicate there is no value present. Why is conditional unwrapping better than force unwrapping?
 */
if let bees = beesCount {
  print("the number of bees is \(bees)")
}else{
  print("not a valid input")
}

/*:
 - Callout(Challenge):
 Create a function that removes the `nil` values from the array and returns a new array with only the valid Strings.
 */
var testData: [String?] = ["Heather", nil, "Mike", "John", nil, nil, "Bob"]

func removeNil(array: [String?]) -> [String]{
  var output = [String]()
  for i in 0..<array.count{
    if let element = array[i]{
      output.append(element)
    }
  }
  return output
}
let newData = removeNil(array: testData)
print(newData)

//pass it to a new array to make it not optional

/*:
 - Callout(Challenge):
 We want to write a function that validates form data filled in by a user. Once we encounter the first field that is blank, we want to indicate to the user that the field is blank.
 If the user has filled in everything correctly, we want to print all information out.
 Below is some test data you can use to test your function.
 */
// Should pass all checks and print all information
let username: String? = "user1"
let password: String? = "password123"
let email: String? = "user1@lighthouselabs.ca"

// Should stop at password check and indicate password field is empty
//let username: String? = "user1"
//let password: String? = nil
//let email: String? = "user1@lighthouselabs.ca"

// Should stop at username check and indicate username field is empty
//let username: String? = nil
//let password: String? = nil
//let email: String? = "user1@lighthouselabs.ca"

func validateUserData(username:String? , password:String? , email:String?){
  
  guard let username = username , username != "" else {
    print("not a valid user name")
    return
  }
  guard let password = password , password != "" else {
    print("not a valid password")
    return
  }
  guard let email = email , email != "" else {
    print("not a valid email")
    return
  }
  print("hello \(username), your password is:\(password) and your email is:\(email) ")
  
}
validateUserData(username: username, password: password, email: email)

/*:
 ## Guard Let
 Depending on how you finished the first challenge, the code you've written might not be as readable or optimal as it could be. So let's take a look at how we can improve this.
 A 'guard' statement is similar to an 'if', but a 'guard' statement will only run its block of code if the conditions are NOT met.
 Let's look at a simple guard example below.
 */
let myNumber = 10

// This function checks if the number given to it is a positive or negative value
func isMyNumberANegativeValue(myNumber: Int){
  
  // This guard condition checks if 'myNumber' is less than zero.
  // Remember, if this condition IS FALSE, the block of code within the else block will run
  // Otherwise, the function will continue
  guard myNumber < 0 else {
    print("I am positive")
    return
  }
  
  print("I am negative!")
}

isMyNumberANegativeValue(myNumber: myNumber)

/*:
 - Experiment:
 Try creating your own guard statement with different conditional statements. Notice which boolean condition causes the code the enter the 'else' block or bypass it entirely.
 */


/*:
 - Experiment:
 Create a function that takes in two number parameters and divide them. We don't like dividing by zero, so ensure this doesn't happen. Otherwise, return the calculated value.
 */
func divideNumbers(firstNumber:Double? , secondNumber:Double?) -> Double{
  guard let firstNumber = firstNumber , firstNumber != 0 else{
    print("cannot divide by nil or zero")
    return 0.0
  }
  guard let secondNumber = secondNumber , secondNumber != 0 else{
    print("cannot divide by nil or zero")
    return 0.0
  }
  return firstNumber/secondNumber
}


/*:
 Let's take a look at another example and see how we can use guard for optionals
 */

let myOptionalNumber: Int? = 10

// This function just checks if the given parameter is nil or not
func isMyNumberAnOptional(myOptionalNumber: Int?){
  
  // This guard checks if 'myOptionalNumber' has a value or not. Similar concept to conditional unwrapping
  // If 'myOptionalNumber' is indeed nil, the else block will run
  // Otherwise, our guard let statement is looking for a valid value, and the code will continue to run
  guard let myUnwrapped = myOptionalNumber else {
    
    print("This value is nil")
    return
  }
  
  // Lastly, you can see we can use the variable 'myUnwrapped' variable declared above within our entire scope of this function now
  // Very convenient!!
  // A regular 'if let' would not allow this
  print("This unwrapped value is \(myUnwrapped)")
}

isMyNumberAnOptional(myOptionalNumber: myOptionalNumber)

/*:
 - Experiment:
 Create a function that takes in an array of numbers. Have the function add all the numbers together and return the result. Make sure to `guard` against an empty array. Use `array.first` to check if there is at least one value in the array.
 */

func addArrayValues(array: [Double]) -> Double{
  guard let _ = array.first else{
    print("array has no elements")
    return 0
  }
  var total = 0.0
  for num in array{
    total += num
  }
  return total
}

let sconeWeight = [33.2,55.0,29.1,3.0,601.9]
addArrayValues(array: sconeWeight)

let muffinVolume = [Double]()
addArrayValues(array: muffinVolume)



/*:
 - Callout(Challenge):
 Now that we've learnt this new guard statement, let's rewrite the form validation challenge using the guard statements. How does it improve our current implementation?
 */
//I initally wrote it with guard statments

//: [Next](@next)
