import UIKit

class Solution {
    func moveZeroes(_ nums: inout [Int], move: Int) -> [Int] {
        
        if nums.count <= 1 {
            return nums
        }
        var first: Int = 0
        var second: Int = 0
        var temp = 0
        while second < nums.count {
            if nums[second] == move {
                second += 1
            } else {
                
                temp = nums[first]
                nums[first] = nums[second]
                nums[second] = temp
               // nums.swapAt(first, second)
               // (nums[first], nums[second]) = (nums[second],nums[first])
                first += 1
                second += 1
            }
        }
        return nums
    }
}

var arr = [2,1,2,3,12]
print(Solution().moveZeroes(&arr,move: 2))


class Program {
  func mergeOverlappingIntervals(_ intervals: [[Int]]) -> [[Int]] {
    var overlappingArray = [[Int]]()
        var first = 0
        var second = 1
        var temp = 0
        var overlapping = false
        while (second < intervals.count) {
            if (intervals[second].first! > intervals[first].last!) {
                if (overlapping) {
                    overlappingArray.append([temp, intervals[first].last!])
                    overlappingArray.append(intervals[second])
                } else {
                    overlappingArray.append(intervals[first])
                    if intervals.last ==  intervals[second] {
                        overlappingArray.append(intervals.last!)
                    }
                }
                    overlapping = false
            } else {
                if (!overlapping) {
                    temp = intervals[first].first!
                }
                overlapping = true
                
            }
                first += 1
                second += 1
        }
    if overlappingArray.isEmpty && temp > 0 {
        overlappingArray.append([temp, intervals.last?.last ?? 0])
    }
    return overlappingArray
  }
}
var arrAr = [
    [1, 10],
      [11, 20],
      [21, 30],
      [31, 40],
      [41, 50],
      [51, 60],
      [61, 70],
      [71, 80],
      [81, 90],
      [91, 100]
  ]

Program().mergeOverlappingIntervals(arrAr)

10 >= 10
