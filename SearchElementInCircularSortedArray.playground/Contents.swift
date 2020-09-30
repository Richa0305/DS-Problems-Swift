import UIKit

/**
 
 Problem Statement -
    Search for an element in circlular sorted array
 
    Circular Sorted array -
 
      arr =   [4, 6, 7, 9, 11, 2, 3]
 
    Serach element 6 in this array searchVal = 6
 
 Bruteforce Approach - Linear Search 0(n)
 
 Better Approach - Binery Search
 
    Case 1: If middle element is equals to searchVal
                arr[mid] == searchVal
                   return true
    
    Case 2 : if middle element is less the  element at high index, & searchVal is less the middle element and greater the high index element then we discard the first half of the array by changing the low to mid + 1 lese we discard the second half by changing high to mid - 1
 
                arr[mid] <= arr[high]
                    searchVal >= arr[mid] && searchVal <= arr[high]
                            low = mid + 1
                    else
                            high = mid - 1
 
    Case 3 : if middle element is greater then the element at index low, And searchVal is less then middle element and greater then the element at low index. then we discard second half by changing high to mid - 1 else discard the first half by changing low to mid + 1
 
            arr[mid] >= arr[low]
                    searchVal <= arr[mid] && searchVal >= arr[low]
                        high = mid - 1
                    else
                        low = mid + 1
 
 */


func searchElementInCircularSortedArray(arr: [Int], searchVal: Int) -> Bool {
    
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        if (arr[mid] == searchVal) {
            return true
        }
        
        if arr[mid] <= arr[high] {
            if (searchVal > arr[mid] && searchVal <= arr[high])
            {
                low = mid + 1
            } else {
                high = mid - 1
            }
            
        }
        else {
            if arr[mid] >= arr[low] {
                if (searchVal >= arr[low] && (searchVal < arr[mid])) {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
        }
        
    }
    return false
}

var arr = [4, 6, 7, 9, 11, 2, 3]

searchElementInCircularSortedArray(arr: arr, searchVal: 2)
