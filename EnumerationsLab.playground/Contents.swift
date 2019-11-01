import UIKit

// Question One

// a. Define an enumeration called iOSDeviceType with member values iPhone, iPad, iWatch. Create a variable called myiPad and assign it to .iPad.

enum iOSDeviceType {
    case iPhone (String)
    case iPad (String)
    case iWatch
    
}

var myiPad = iOSDeviceType.iPad


// Uncomment the lines below to test your solution

//let myiPad = iOSDeviceType.iPad
//assert(myiPad == .iPad)

// b. Adjust your code above so that iPhone and iPad have associated values of type String which represents the model number.  Create an instance of a .iPhone("8+") and assign it to a variable called myPhone

var myPhone = iOSDeviceType.iPhone("8+")


// Uncomment the lines below to test your solution

//switch myPhone {
//case let .iPhone(model): assert(model == "8+", "Was expecting a model type of 8+, but got \(model)")
//default: fatalError("Was expecting an iPhone but got \(myPhone)")
//}

// Question Two

// Write a function named getPosition(startingAt:afterSteps:) that takes an array of Steps, and a starting location of (Int, Int) and returns an (Int, Int) tuple representing the final position.

//A step .up will increase the y coordinate by 1.
//A step .down will decrease the y coordinate by 1.
//A step .right will increase the x coordinate by 1.
//A step .left will decrease the x coordinate by 1.

enum Step {
    case up (Int)
    case down (Int)
    case left (Int)
    case right (Int)
}

    func getPosition(startingAt: (x:Int,y:Int), afterSteps: [Step]) -> (Int,Int) {
        var start = startingAt
        for each in afterSteps {
            switch each {
            case .up:
                start.y += 1
            case .down:
                start.y -= 1
            case .left:
                start.x -= 1
            case .right:
                start.x += 1
            }
        }
        return start
    }
    
    
// Uncomment the lines below to test your solution

//let startingLocation = (x: 0, y: 0)
//let steps: [Step] = [.up, .up, .left, .down, .left]
//let expectedEndPosition = (x: -2, y: 1)
//let endPosition = getPosition(startingAt: startingLocation, afterSteps: steps)
//
//assert(endPosition == expectedEndPosition, "Was expecting \(expectedEndPosition) but got \(endPosition)")

// Question Three

// You are given a Coin enumeration which describes different coin values. Write a function called getTotalValue(from:) that takes in an array of tuples of type (number: Int, coin: Coin), and returns the total value of all coins in cents.

enum Coin: Int {
    case penny = 1
    case nickle = 5
    case dime = 10
    case quarter = 25
}

// Your function here
func getTotalValue(from: [(number: Int, coin: Coin)]) -> Int {
    var sum = 0
    for (num,each) in from {
        sum += num * Int(each.rawValue)
    }
    return sum
}
// Uncomment the lines below to test your solution

let coinArr: [(Int, Coin)] = [
    (10, .penny),  // 10
    (15, .nickle), // 75
    (3, .quarter), // 75
    (20, .penny), // 20
    (3, .dime), // 30
    (7, .quarter) // 25
]

let expectedTotal = 385
let total = getTotalValue(from: coinArr)
    assert(total == expectedTotal, "Was expecting \(expectedTotal), but got \(total)")

// Question Four

// Write an enum called Day to represent the days of the week with a raw value of type String.
// Write a method inside Day that returns whether or not it is a weekday (Monday - Friday)

// Your code here

enum Day: String {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    func isWeekday() -> Bool {
        switch self {
        case .monday:
            print("Monday is a weekday")
            return true
        case .tuesday:
            print("Tuesday is a weekday")
            return true
        case .wednesday:
             print("Wednesday is a weekday")
            return true
        case .thursday:
            print("Thursday is a weekday")
            return true
        case .friday:
            print("Friday is a weekday")
            return true
        case .saturday:
            print("Saturday is not a weekday")
            return false
        case .sunday:
            print("Sunday is not a weekday")
            return false
        }
    }
}


// Question Five

//Define an enumeration named HandShape with three members: .rock, .paper, .scissors.
//Define an enumeration named MatchResult with three members: .win, .draw, .lose.
//Write a function called matchResult(fromPlayerOneShape:andPlayerTwoShape:) that takes two HandShapes and returns a MatchResult. It should return the outcome for the first player (the one with the first hand shape).
//
//Rock beats scissors, paper beats rock, scissor beats paper

// Your code here
enum HandShape {
    case rock
    case paper
    case scissors
}
enum MatchResult {
    case win
    case draw
    case lose
}
func matchResult(fromPlayerOneShape: HandShape, andPlayerTwoShape: HandShape) -> MatchResult {
    if fromPlayerOneShape == andPlayerTwoShape {
        return .draw
    } else if (fromPlayerOneShape == .paper && andPlayerTwoShape == .rock) || (fromPlayerOneShape == .scissors && andPlayerTwoShape == .paper) || (fromPlayerOneShape == .rock && andPlayerTwoShape == .scissors) {
        return .win
    } else {
    return .lose
    }

}
