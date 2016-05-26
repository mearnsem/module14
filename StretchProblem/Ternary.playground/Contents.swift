//: Playground - noun: a place where people can play

import UIKit

func highLow(numbers: [Int]) {
    var previousInt = 0
    
    for n in numbers {
        var printStatement = ""
        printStatement = (n < 50 ? printStatement + "low," : printStatement + "high,")
        printStatement = (n % 13 == 0 ? printStatement + " didn't learn this one in school," : printStatement + " that's easy,")
        printStatement = (n > previousInt ? printStatement + " it's getting bigger" : printStatement + " it stopped growing")
        previousInt = n
        
        print(printStatement)
    }
}

let intArray = [3, 89, 26, 21, 7, 99, 73, 24, 1, 65]

highLow(intArray)
