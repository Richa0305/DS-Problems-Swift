import UIKit
/**
    Find the second largest from an array
        Ex - var arr = [9,8,7,9,2,8,3,6,11]
            Answer -  9
 */
var arr = [9,8,7,9,2,8,3,6,11]  // 9


/**
 Simple Approach : First Sort the array and then pick the second largest from back of the array
 
 */

func simpleApproachGetSecondLargest() {
    let sortedArr = arr.sorted()
    sortedArr[sortedArr.count - 1]
    for item in stride(from: sortedArr.count, to: 0, by: -1) {
        if item != sortedArr[sortedArr.count - 1] {
            print(item)
            return
        }
    }
}
simpleApproachGetSecondLargest()


/**
 
 Better Approach - Find Second Largest in single traversal
 1. Initialize two variable first & second to 0
 2. Traverse through the list, and compate items with first
 3. if item is greater then first then set second with first and first with item
 4.If item is between first and second then set second with item
 */

func betterApproachGetSecondLargest() {
    var first: Int = 0
    var second : Int = 0
    for item in arr {
        if item > first {
            second = first
            first = item
        } else if (item > second) && (item != first) {
            second = item
        }
    }
    print(second)
}

betterApproachGetSecondLargest()
