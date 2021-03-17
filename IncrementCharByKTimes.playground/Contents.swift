import UIKit

var str = "ABC"
var k = 2
var newS = ""

for x in str {
    let chr = Character(String(x))
    if let val = chr.asciiValue {
        let dup = k
        
        if (Int(val) + k) > 122 {
            k -= 122 - Int(val)
            k = k % 26
            if let uniScal = Unicode.Scalar(96 + k) {
                newS += String(Character(uniScal))
            }
        } else {
            if let uniScal = Unicode.Scalar(Int(val) + k) {
                newS += String(Character(uniScal))
            }
        }
    }
    
    
}
print(newS)
