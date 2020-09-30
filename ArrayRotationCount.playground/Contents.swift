import UIKit


/**

Problem Statement:
 How many times is a sorted array rotated? With No duplicates.
 
Example -
 
    2, 3, 5, 7, 10 , 12
 
 After first rotation -
    12, 2, 3, 5, 7, 10 (Rotated Once)
 
  After second rotation -
    10, 12, 2, 3, 5, 7 (Rotated Twice)
 
 Number of Rotation = Index of the minimum element
 
Bruteforce Approach - Linear search in the array for minimun element O(n)
 
Better Approach -  Using Binery search -
 Case 1: ( Arr[Low] <= Arr[high]) => retrun low  // means array is already sorted. so element at low would be minimum element.
 
 Case 2: if minimun element is the middle element of the array. if middle element is the minimum then element next to mid element will be greater then mid element, and prev element from mid element will be greater then mid element.
        
    Arr[mid] <= Arr[midNext] && Arr[mid] <= Arr[midPrev] => return mid
        midNext = (mid + 1) % arr.count
        midPrev = (mid + arr.count -1) % arr.count
 
 Case 3: Arr[mid] <= Arr[high] => high = mid -1
 
 Case 4: Arr[mid] >= Arr[low] => low = mid + 1
    
*/



func findRotationCountInSortedArray(arr: [Int]) -> Int {
    
    var low = 0
    var high = arr.count - 1
    while (low <= high) {
        let mid = (low + high) / 2
        let midNext = (mid + 1) % arr.count
        let midPrev = (mid + arr.count - 1) % arr.count
        if (arr[low] <= arr[high]) {
            return low
        }
        
        if ((arr[mid] <= arr[midNext]) && (arr[mid] <= arr[midPrev])) {
            return mid
        }
        
        if arr[mid] <= arr[high] {
            high = mid - 1
        }
        
        if arr[mid] >= arr[low] {
            low = mid + 1
        }
    }
    
    return -1
    
}
var arr = [10, 12, 2, 3, 5, 7]
findRotationCountInSortedArray(arr: arr)
