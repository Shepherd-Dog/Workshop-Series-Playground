/*:
 ## TechMill Workshop Series – Swift & iOS 9
 ### Session Five – Swift Fundamentals & Foundation
 
 */
import UIKit
//: #### Optionals are Enums

//: Without Syntactic Sugar:
let x = Optional<String>.None
let y = Optional<String>.Some("Hello")
//: With Syntactic Sugar:
var z: String?
var intOptional: Int?
z = "Howdy"
var a: String? = "Hello"

print("\(a!)")

if let unwrappedZ = z
{
    print("\(unwrappedZ)")
}
//: #### Arrays and Dictionaries are implemented using Structs:
let animals = ["Giraffe", "Cow", "Doggie", "Bird"]
//: Because we `let` this `array`, we can't do this:
// animals.append("Camel")

for animal in animals
{
    print("Animal: \(animal)")
}

var dentonUniversityNumberOfStudents = [String: Int]()

dentonUniversityNumberOfStudents["UNT"] = 32000 // These are not real numbers of students
dentonUniversityNumberOfStudents["TWU"] = 15000 // Still not real numbers of students

let universityNotInDenton = dentonUniversityNumberOfStudents["UT"]

for (key, value) in dentonUniversityNumberOfStudents
{
    print("Key: \(key), Value: \(value)")
}
//: #### Range<T>
//: Ranges are ways to represent a start and end of values of a type. In many cases this will be a type of `Int`, but doesn't always have to be. Later we'll talk about how `String` uses indexes. You can create indexes in two ways:
//: \
//: \
//: **Inclusive**
let inclusiveRange = 0 ... 5
//: **Exclusive**
let exclusiveRange = 0 ..< 6
//: In Swift, we don't use C-style for statements like these:
for var index = 0; index < 5; index++
{
    
}
//: Depending on when you are looking at this and which version of Swift you are using, the above will either have a deprecation warning or will no longer compile.
//: Instead of that, we use a for in statement which enumerates a range:
for index in 0 ..< 5
{
    print("Index: \(index)")
}

//: #### NS-namespaced Classes
//: The NS prefix on these classes refer to NextStep and the days before Steve Jobs went back to Apple. These classes are provided to handle very common data types that aren't quite as fundamental as `array` or `dictionary`.

//: NSObject – the root object that is the superclass of all other Apple framework objects. If you are creating a model object you may want to subclass `NSObject` to get some "free" functionality built into it.
class SubclassOfNSObject: NSObject
{
    var name = ""
}

let firstSubclass = SubclassOfNSObject()
firstSubclass.name = "Subclass of NSObject"
let secondSubclass = SubclassOfNSObject()
secondSubclass.name = firstSubclass.name
//: As an example of some free functionality, we get the equality operator! Try removing the subclassing from `NSObject` above and see that you get an error.
if firstSubclass == secondSubclass
{
    print("We are equal!")
}
else
{
//: - note: As we can see here, we get some free functionality but it doesn't do everything for us – I'd expect these two things to be the same, but we would need to do more work to enable that because by default the equality operator is testing to see if each is referring to the same place in memory
    print("We are not equal!")
}
//: NSNumber – a generic number container. `NSNumber` has different instance methods that can convert your generic `NSNumber` into something else, like an `Int`, `Double`, `Float`, or even a `String`
let thisNumber = NSNumber(double: 35.5)

thisNumber.stringValue

//: NSDate - a place to store date and time representations. Initializing a new `NSDate` will give you the date right now.
let today = NSDate()

//: NSData – a raw container for bits. An example of where you'd use this is to download an image from a website or to send data to an API. For example, on the second line you see you can create a data representation of a `String`
let thisData = NSData()
let stringData = "Data".dataUsingEncoding(NSUTF8StringEncoding)

//: #### Named Parameters
//: In Swift, we use named parameters for function calls. These give the language a more conversational feel and serve as inline documentation. As shown below, you can specify a different external name from the internal name to both have the nice conversational feel in external usage without having a strangely named variable for your internal usage.

//: The Swift Way of naming functions
func getFoo(foo: String, fromData data: NSData)
{
    let myData = data
}

let thisFoo = ""
getFoo(thisFoo, fromData: thisData)

//: The non-Swift Way of naming functions
func getFooFromData(foo: String, _ data: NSData)
{
    
}

getFooFromData(thisFoo, thisData)

//: #### Initializers
class David
{
    var name = ""
    let thisConstant: String
    
    init()
    {
        thisConstant = "Constant"
    }
    
    convenience init?(fromJSONString JSONString: String)
    {
        print("")
        
        self.init()
    }
}
var davidString = "{ \"name\": \"David\" }"
var david = David(fromJSONString: davidString)

let button = UIButton(type: .Custom)
let myArray = ["1", "2", "3"]
let commaSeparatedArrayElements: String = myArray.joinWithSeparator(",")
//: #### Casting Objects
var destinationViewController = UIViewController()

class CalculatorViewController: UIViewController
{
    
}
//: - note: If you uncomment this next line, it will throw an error because we are forcing a cast of a `UIViewController` into a `CalculatorViewController` using `as!`
//let calcVC = destinationViewController as! CalculatorViewController
//: To avoid the crash, we should safely cast using `as?` and an `if let` statement
if let vc = destinationViewController as? CalculatorViewController
{
    vc
}
//: We can also test to see if something is a certain type, although this is used much less than the safe unwrapping. Usually, you want access to something on the object you are casting so you want to have a new variable of that class.
if destinationViewController is CalculatorViewController
{
    
}
//: - note: We don't cast value types, such as `struct`s. In this example, we are changing the `Int` apple into a `Double` doubleApple, but we are not casting. Instead, we are creating a new variable by instantiating a `Double` with the value of apple.
var apple = 34
//: We can't cast, because this code won't run:
// (Double)34
var doubleApple = Double(apple)
//:STOPPED ON PAGE 30 OF SLIDES
