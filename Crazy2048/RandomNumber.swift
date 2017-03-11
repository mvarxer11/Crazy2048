//
//  RandomNumber.swift
//  Crazy2048
//
//  Created by mvarxer on 17/3/11.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import Foundation



//根据给定的2的n次方的最大数，按概率随机返回一个小于等于2的n-2次方的数。数字越大，出现的概率越低。
//比如最大数16，那么最大随机数就是8，总数是2+4+8=14，各个数出现的概率就是2是8/14,4是4/14，8是2/14

class RandomNumber {
    
    static func creatRandomNumber(maxNumber:Int) -> Int {
        //maxNumber的最小值是8
        let n = Int(log2(Double(maxNumber))) - 2 //求得最大数的次方数n
        print("n =",n )
        var totalRange = 0
        var tt = 0
        for number in 1...n {  //求所有值的和
            tt = Int(pow(2, Double(number)))
            totalRange += tt
        }
        var randomNumber = Int(arc4random_uniform(UInt32(totalRange))) //拿到随机数
        for i in 1...n {
            if randomNumber < Int(pow(2, Double(n + 1 - i))) {
                return Int(pow(2, Double(i)))
            }else {
                randomNumber -= Int(pow(2, Double(n + 1 - i)))
            }
            
        }
        return 100
    }
}
