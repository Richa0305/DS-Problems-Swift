import UIKit

/**
1st Problem Statement - find first and last occurance of number 4 in the below sorted array

 Bruteforce approch -
   Traverse throgh the whole array from front and back to get first and last occurance respectivaly, which will be O(n)

 Better Approach -
   User Binery Search to search for the element, and keep doing BS in in left(with high as mid-1) direction to get first occurance and keep doing BS in right(with low as mid + 1) to get last occurance. This would be O(log(n))

 
 =====================
 
 
 2nd Problem Statement - Count occurances of a number in a sorted array
 
 Bruteforce approch -
        Traverse through the whole arrayand count the occurances, which will be O(n)
 
 Better Approach - Use Binary search to get first and last occurances of an array, then (last occurance - first occurance) will be count of number of occurances
                    
 
*/

var arr = [1,2,3,4,4,4,6,7,8,9,9]

// Get First Occurance
func bsFindFirstOccurance(arr: [Int], searchVal: Int) -> Int {
  
    
    var low = 0
    
    var high = arr.count - 1
      var mid = (low + high) / 2
    var result = -1
    while low <= high {
        mid = (low + high) / 2
        if (searchVal == arr[mid]) {
            result = mid
            high = mid - 1
        } else if (searchVal < arr[mid]) {
            high = mid - 1
        } else if (searchVal > arr[mid]) {
            low = mid + 1
        }
    }
    return result
}

bsFindFirstOccurance(arr: arr, searchVal: 4)


// Get First Occurance
func bsFindLastOccurance(arr: [Int], searchVal: Int) -> Int {
  
    var low = 0
    var high = arr.count - 1
    var mid = (low + high) / 2
    var result = -1
    while low <= high {
        mid = (low + high) / 2
        if (searchVal == arr[mid]) {
            result = mid
            low = mid + 1
        } else if (searchVal < arr[mid]) {
            high = mid - 1
        } else if (searchVal > arr[mid]) {
            low = mid + 1
        }
    }
    return result
}

bsFindLastOccurance(arr: arr, searchVal: 4)



func findCountOfOccurances(arr: [Int], val: Int) -> Int {
    let firstIndex = bsFindFirstOccurance(arr: arr, searchVal: val)
    let lastIndex = bsFindLastOccurance(arr: arr, searchVal: val)
    if firstIndex < 0 {
        return 0
    }
    return (lastIndex - firstIndex) + 1
}

findCountOfOccurances(arr: arr, val: 4)
