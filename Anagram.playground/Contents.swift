import UIKit

/**
        
    1st Problem - Check if two numbers are anagram or not Ex- abc, bca are anagram of each other as they have same charactors where as abc and dcaa is not anagram of each other
 
    2nd Problem - Group All the number who are anagram ofm each other
        Ex - [abc, bca, tea, ate, bat, cba]
                Answer - [abc, bca, cba]
                      [tea, ate]
                      [bat]
 
 */


/**
    1st Problem Solution
 
        Simple Approach - Sort both the string and compare
 
 */

func isAnagram(str1: String, str2: String) -> Bool {
    if str1.count != str2.count {
        return false
    }
    if str1.sorted() == str2.sorted() {
        return true
    }
    return false
}

isAnagram(str1: "abc", str2: "bac")
isAnagram(str1: "bat", str2: "cat")

// Time complaxity - O(n log n)

/**
    1st Problem Solution
 
        Better Approach - Run first loop to create dictionary on first string with each character as key and number of times it appears as value,
        Run another loop on second string, and check if character of 
 
 */

func isAnagramWithDictionary(str1:String, str2:String) -> Bool {
    // Dictionary to store charectors as key and the number of time they appear in the string as value
    var hashDict = [Character: Int]();
    
    // Bool flag to identify is two strings are anagram or not
    var isAnagram = false
    
    // First we loop through the str1 and add each character of str1 in hashDict with value as the number of time they appear in the string
    for char in str1 {
        hashDict[char] = (hashDict[char] ?? 0) + 1
    }
    
    // Second we loop through the str1 and for each charactor we deduct the value by 1. If its anagram then value of each charactor should be 0 by end of the loop
    for char in str2 {
        hashDict[char] = (hashDict[char] ?? 0) - 1
    }
    hashDict
    
    // Third loop to check if all the values of hashDict has 0, If its all 0 then both the strings are anagram of each other
    for (_,value) in hashDict {
        if value == 0 {
            isAnagram = true
        } else {
            isAnagram = false
            return false
        }
    }
    
    return isAnagram
}


isAnagramWithDictionary(str1: "abcd", str2: "bcad")
isAnagramWithDictionary(str1: "abcd", str2: "bcbd")

// time complexcity - O(n)



/**
    2nd Problem Solution
 
        Simple Approach - Sort both the string and then make a dictionary with sorted string as key and array of unsorted string with maches the sorted key
 
 */

func printArrayOfAnagrams(arr: [String]) {
    var anagramDict = [String : Set<String>]()
    for item in arr {
        let sortedKey = item.sorted()
        anagramDict[String(sortedKey)] = [item]
        for value in arr {
            if var valueArr = anagramDict[String(sortedKey)], value.sorted() == sortedKey {
                valueArr.insert(value)
                anagramDict[String(sortedKey)] = valueArr
            }
        }
    }
    print(anagramDict)
}
printArrayOfAnagrams(arr: ["abc", "bca", "tea", "ate", "bat", "cba"])

// Time Complexity - 0(n2) O(n log n)


func printArrayOfAnagramsBetterApproach(arr: [String]) {
    var anagramDict = [String : [String]]()
    var sortedArray = [String]()
    
    for item in arr {
        sortedArray.append(String(item.sorted()))
    }
    
    for (index,item) in sortedArray.enumerated() {
        if (anagramDict.keys.contains(item)) {
            if item == String(arr[index].sorted()) {
                anagramDict[item]?.append(arr[index])
            }
        } else {
            anagramDict[item] = [arr[index]];
        }
    }
    
    print(anagramDict.values)
}
printArrayOfAnagramsBetterApproach(arr: ["abc", "bca", "tea", "ate", "bat", "cba"])
