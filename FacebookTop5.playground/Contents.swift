
import Foundation
/**
 https://leetcode.com/problems/merge-intervals/
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
 
 Example 1:
 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 
 Example 2:
 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 
 Pseudo Code -
 
        Function mergeOverlappingIntervals Input : intervals: [[Int]]   OutPut : [[Int]]
 
            Initialise sortedIntervals = Sort the intervals array by first element of each item
 
            Initialise overlappingArray  = to hold resulting output
 
            foreach currentItem in sortedIntervals
 
                if currentItem.lastElement > overlappingArray.lastItem.firstElement
                    Update overlappingArray lastItem lastElement with currentItem lastElemnt
                else
                    Add the currentItem in overlappingArray
                endIf
 
            Endforeach
 
            return overlappingArray
 
        EndFunction
 */

func mergeOverlappingIntervals(_ intervals: [[Int]]) -> [[Int]] {
    let sortedIntervals = intervals.sorted(by : { $0[0] < $1[0] })
    var overlappingArray = [[Int]]()
    for item in sortedIntervals {
        if let arr = overlappingArray.last, (arr.last! >= item.first!) {
            var newItem = [overlappingArray.last!.first!, item.last!]
            if (arr.last! > item.last!) {
                newItem = [overlappingArray.last!.first!, arr.last!]
            }
            overlappingArray.popLast()
            overlappingArray.append(newItem)
        } else {
            overlappingArray.append(item)
        }
    }
    
    return overlappingArray
}

mergeOverlappingIntervals([
    [1, 2],
    [3, 5],
    [4, 7],
    [6, 8],
    [9, 10]
])



/**
 https://leetcode.com/problems/find-all-anagrams-in-a-string/
 Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.
 
 Example 1:
 Input: s = "cbaebabacd", p = "abc"
 Output: [0,6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 
 Example 2:
 Input: s = "abab", p = "ab"
 Output: [0,1,2]
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 
 Pseudo Code -
        
 
        Function findAnagrams Input :  String s, String p    OutPut : [Int]

            Initialise two hashtables pHash &Hash : Dictionary of Charactor & Frequency count

            Initialise resultArray: Array of integer  = to hold resulting output
 
            Initialize pCount to hold count of p string
 
            Intialiaze sArray to hold Array of s string, convert s to array of string
 
            foreach char in p string
                add the char to pHash with frequency count
            Endforeach
 
            foreach index in 0..<sArray.count
                if index >= pCount
                    Get the first charactor from  sArray
                    if first char frequency count is > 1
                        decrement the frequency count in sHash table
                    else
                        remove first char from the sHash table
                    endIf
                endIf
 
                Add char at index in sArray to sHash with frequency count
 
                if sHash & pHash are equal
                    Appand the statrting index of the window, (index - pCount + 0)
                endIf
            Endforeach
 
            return resultArray

        EndFunction

 
 */

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    
    var pHash = [Character: Int]()
    var sHash = [Character: Int]()
    var result: [Int] = []
    let pCount = p.count
    let sArray = Array(s)
    
    for char in p {
        pHash[char, default: 0] += 1
    }
    
    for index in 0..<sArray.count {
        
        //Remove first char in the dictionary
        if index >= pCount {
            let char = sArray[index - pCount]
            sHash[char] = sHash[char]! > 1 ? sHash[char]! - 1 : nil
        }
        
        //Find a window of pCount letters to compare
        sHash[sArray[index], default: 0] += 1
        
        if sHash == pHash {
            result.append(index - pCount + 1)
        }
    }
    
    return result
}
let result1 = findAnagrams("bpaa","aa")
print("Result : \(result1)")


/**
 https://leetcode.com/problems/add-strings/
 Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

 You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

 Example 1:
 Input: num1 = "11", num2 = "123"
 Output: "134"
 
 Example 2:
 Input: num1 = "456", num2 = "77"
 Output: "533"
 
 Solution -
 Function addStrings Input :  String num1, String num2    OutPut : String

            Initialise result string to hold the end result

            Initialise carry with 0 to hold the carry forward while adding
 
            Initialise i & j with num1 and num2 count - 1
 
            while i >= 0 || j >= 0
 
                    Initialise sum to hold the sum of each ints converted from chars
 
                    if i >= 0
                        Get the ascii of Character at index i and subtract it from Character 0 ascii to convert the char to int
                        Add the converted int from char to sum
                    endif
 
                    if j >= 0
                        Get the ascii of Character at index j and subtract it from Character 0 ascii to convert the char to int
                        Add the converted int from char to sum
                    endif
                            
                    Add carry to sum as well
            
                    Update carry by dividing sum by 10
 
                    update result by adding mod of result and previous result value
                    result =  "\(sum % 10)" + result
                                    
                    Handle Edge case If i & j both has reached end and carry was not included in result
                    if i <= 0 && j <= 0 && carry > 0
                          Update result by adding carry ->  result = "\(carry)" + result
                    endif
            EndWhile
 
            return result

EndFunction
        
 */

func addStrings(_ num1: String, _ num2: String) -> String {

    var result = ""
    var carry = 0
    var i = num1.count - 1
    var j = num2.count - 1
    let num1Arr = Array(num1)
    let num2Arr = Array(num2)
    while i >= 0 || j >= 0 {
        var sum = 0
        if i >= 0 {
            sum = sum + Int(Character(String(num1Arr[i])).asciiValue! - Character("0").asciiValue!)
        }
        if j >= 0 {
            sum = sum + Int(Character(String(num2Arr[j])).asciiValue! - Character("0").asciiValue!)
        }
        sum = sum + carry
        carry = sum / 10
        result =  "\(sum % 10)" + result
        
        // handle edge case when i & j has reach end and carry is still not added
        if i <= 0 && j <= 0 && carry > 0 {
            result = "\(carry)" + result
        }
        i -= 1
        j -= 1
        
    }
    return result
}

addStrings("9", "99")

/**
 https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
 
 Given a string s of '(' , ')' and lowercase English characters.

 Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

 Formally, a parentheses string is valid if and only if:

 It is the empty string, contains only lowercase characters, or
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
 
 Example 1:
 Input: s = "lee(t(c)o)de)"
 Output: "lee(t(c)o)de"
 Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
 
 Example 2:
 Input: s = "a)b(c)d"
 Output: "ab(c)d"
 
 Example 3:
 Input: s = "))(("
 Output: ""
 Explanation: An empty string is also valid.
 
 Example 4:
 Input: s = "(a(b(c)d)"
 Output: "a(b(c)d)"
 
 Solution -
 
        Function minRemoveToMakeValid Input :  String s   OutPut : String

            Initialise sArray after converting s to array

            Initialise resultStr String with empty string
 
            Initialise open count int with 0
 
            // remove extra closing paranthese
            Foreach item in aArray
 
                if item is equal to "("
                    open += 1
                else if item is equal to ")"
                    if open is equal to 0
                        continue to come out of current loop
                    endif
                    open -= 1
                endif
 
                resultStr += String(item)
            
            Endforeach
 
            if open == 0
                retun resultStr
            endIf
 
            // remove extra opening paranthese
 
            initialize finalResult with empty string to hold final string after removing extra opening brackets
 
            Foreach item in resultStr.reversed()
 
                if item is equal to "(" and open count is greater then 0
                    open -= 1
                    continue to come out of cuurent loop
                endIf
 
                finalResult += String(item)
 
            EndForeach
 
            return finalResult

        EndFunction
 */


func minRemoveToMakeValid(_ s: String) -> String {
    let sArray = Array(s)
    var resultStr = ""
    var open = 0
    
    // remove all extra closing paratheses
    for item in sArray {
        if item == "(" {
            open += 1
        } else if item == ")" {
            if open == 0 {
                continue
            }
            open -= 1
        }
        resultStr += String(item)
    }

    if open == 0 {
        return resultStr
    }
    
    // remove extra opening parantheses
    var result = ""
    for item in resultStr.reversed() {
        if open > 0 && item == "("{
            open -= 1
            continue
        }
        result.append(item)
    }
    
    return String(result.reversed())
}
minRemoveToMakeValid("))((")


/*
 https://leetcode.com/problems/valid-parentheses/
 
 Valid Parentheses
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
  

 Example 1:
 Input: s = "()"
 Output: true
 
 Example 2:
 Input: s = "()[]{}"
 Output: true
 
 Example 3:
 Input: s = "(]"
 Output: false
 
 Solution -
 
                    Function isValidParantheses Input :  String s   OutPut : Bool
 
                        Initialize a stack array of String
 
                        Initialize a validDict hashtable with key and as opening brackets and values as closing brackets
 
                        if s.count is less then oe equal to 1
                            return false
                        endIf
 
                        foreach char in s
 
                            if char is equal to any of the opening brackets like "(" "{" "["
 
                                    Append that opening bracket in srack
 
                            else if char is equal to any of the closing bracket like ")" "}" "]"
 
                                    //Check if stack is empty, if empty then closing bracket doesn't have any opening bracket
                                    if stack is empty
                                        return false
                                    endIf
 
                                    //if stack is not empty, then check if last opening bracket in stack is valid for the char or not
 
                                    Inilialize validClosing for stacks last opening bracket from hashtable validDict, validClosing = validDict[stack.last]
 
                                    if validClosing  is equal to current char
                                        remove last opening parantheses char from stack
                                    else
                                        return false
                                    endIf
 
                        EndForeach
 
                        if stack is empty
                            return true
                        endIf
 
                        return false
 
                    EndFunction
 */

func isValidParantheses(_ s: String) -> Bool {
    var stack = [String]()
    let validDict = ["{":"}", "(":")", "[":"]"]
    
    if s.count <= 1 {
        return false
    }
    
    for char in s {
        if (char == "{") || (char == "(") || (char == "[") {
            stack.append(String(char))
        } else if (char == "}") || (char == ")") || (char == "]")  {
            if stack.isEmpty {
                return false
            }
            if let last = stack.last {
                if let validClosing = validDict[last] {
                    if validClosing == String(char) {
                        stack.removeLast()
                    } else {
                        return false
                    }
                }
            }
        }
    }
    if stack.isEmpty {
        return true
    }
    return false
}

isValidParantheses("{[]}}}")

/**
 
 Move zeros :
 
 */
class TreeNode {
    var value: Int
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    init(val: Int) {
        self.value = val
    }
}

func isValidBST(_ root: TreeNode?) -> Bool {
    return isBSTHelper(root, min: nil, max: nil)
}

func isBSTHelper(_ root: TreeNode?, min: Int?, max: Int?) -> Bool {
    guard let root = root else {
        return true
    }
    if let min = min, root.value <= min {
        return false
    }
    if let max = max, root.value >= max {
        return false
    }
    if isBSTHelper(root.leftNode, min: min, max: root.value) &&
        isBSTHelper(root.rightNode, min: root.value, max: max) {
        return true
    }
    return false
}
let tree = TreeNode(val: 2)
tree.leftNode = TreeNode(val: 1)
tree.rightNode = TreeNode(val: 3)
tree.value
tree.leftNode?.value
tree.rightNode?.value
var flag = isValidBST(tree)
print(flag)




-6 * -6
