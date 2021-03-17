import UIKit

var str = "Hello, playground"
func reverseString() {
    var newStr = ""
    for s in str {
        newStr = String(s) + newStr
    }

    print(newStr)
}
reverseString()

