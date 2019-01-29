//: [Previous](@previous)
/*:
 ## Generics
 Generics allow us to write flexible and reusable code that can take in any variable type. You have been using collections that use generic types. Both arrays and dictionaries use a generic type. You can define any variable type for those collections to store.
 */
/*:
 If we want to write a function that prints two numbers for us, we would have to write a function for each type of number variable.
 */

func printMyTwoNumbersInt(num1: Int, num2: Int){
  
  print("My numbers are \(num1) and \(num2)")
}

func printMyTwoNumbersDouble(num1: Double, num2: Double){
  
  print("My numbers are \(num1) and \(num2)")
}

/*:
 Instead, we can write a function that takes a generic type so we can print any two values
 */
func printMyTwoNumbers<Element>(num1: Element, num2: Element){
  
  print("My numbers are \(num1) and \(num2)")
}

printMyTwoNumbers(num1: 1, num2: 1)
printMyTwoNumbers(num1: 2.0, num2: 2.1)
printMyTwoNumbers(num1: "three", num2: "four")

/*:
 - Experiment:
 Now you try! Write a generic function that takes in two parameters and multiply their value together and print the result. (Hint: You might run into an error after finishing. Continue to the next experiment to find out why!)
 */


//func multiplyNumbers<K> (num1:K , num2: K) -> K{
//  return num1 * num2
//}

/*:
 - Experiment:
 You might have run into error in the console regarding the multiplication operator can only be applied to numbered parameters. This makes sense as multiplying two Strings together doesn't make sense. So, we want to only take in variable types that *can* use the multiplication operator. In this case, we can limit the element type to types that conform to the `Numeric` protocol like below.
 */

func multiply<Element: Numeric>(num1: Element, num2: Element) {
  
}


/*:
 - Experiment:
 Update your multiplication function and test it! Try using different variable types to see what works and what doesn't.
 */
func multiplyNumbers<K: Numeric> (num1:K , num2: K) ->K{
  return num1 * num2
}


/*:
 - Experiment:
 Write a generic function that takes in two parameters. One parameter is an array of elements, and the other is one element you are trying to find in the array. Return the index where the element exists in the array. ie: Given `[1,5,2,4]` and `'5'`, the returned index is `1`
 */
/*:
 - Note:
 For this experiment, refrain from using the array method `indexOf`. Also the protocol `Equatable` might be useful here. Search it up to see what it's about.
 */
func findInArray <Element: Equatable>(array: [Element], item: Element) -> Int{
  //return -1 for not found
  for i in 0..<array.count{
    if(item == array[i]){
      return i
    }
  }
  
  //if item not found
  return -1
  
}
let theIntArray = [4,6,22,93,1]
findInArray(array: theIntArray, item: 93)

findInArray(array: theIntArray, item: 0)

let myFruitArray = ["pineapple","apple","banana"]
findInArray(array: myFruitArray, item: "apple")
findInArray(array: myFruitArray, item: "frogs")
/*:
 - Callout(Challenge):
 During class you saw a simple implementation of a stack where data is inserted (pushed) to the top of the stack when data is added. When data is removed (pop) from the stack, it removes the first item at the top of the stack. We will now implement a similar data structure called a "queue" as a generic.
 */
/*:
 - Note:
 You can think of a queue like a line up at a grocery store. The first person in line finishes their transaction, and then leaves the line up. Any new customers have to start at the back of the line up.
 
 Create a "Queue" data structure with the following functions:
 - enqueue: add an item to the queue
 - dequeue: remove an item from the queue, and return the removed element
 */
struct Person{
  let name :String
}
var person1 = Person(name: "Joey")
var person2 = Person(name: "Franatron")
var person3 = Person(name: "The Big L")
var person4 = Person(name: "Freshtastic")
var person5 = Person(name: "M")

struct Queue<Thing>  {
  var lineup = [Thing]()
  mutating func getInLine(thing: Thing) {
    lineup.append(thing)
    print("\(lineup)")
  }
  mutating func leaveLine(){
    if lineup.count > 0{
      lineup.remove(at: 0)
      print("\(lineup)")
    }else{
      print("no one in line")
    }
  }
}

var theLineUp = Queue<Person>()
theLineUp.getInLine(thing: person1)
theLineUp.getInLine(thing: person2)
theLineUp.getInLine(thing: person3)
theLineUp.leaveLine()
theLineUp.getInLine(thing: person4)
theLineUp.getInLine(thing: person5)
theLineUp.leaveLine()
theLineUp.leaveLine()
theLineUp.leaveLine()
theLineUp.leaveLine()
theLineUp.leaveLine()
//: [Next](@next)

