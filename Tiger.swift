//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by User on 5/21/15.
//  Copyright (c) 2015 User. All rights reserved.
//

import Foundation
import UIKit


struct Tiger {
    var Age: Int = 0
    var name: NSString = ""
    var Breed: NSString = ""
    var image: UIImage = UIImage(named: "")
    
    func chuff(){
        println("Chuff")
    }
    
    func chuffNumberOfTimes(numberOfTimes: Int){
        for var i = 0; i < numberOfTimes; i++ {
            chuff()
        }
    }
    
    func chuffNumberOfTimes(numberOfTimes: Int, isLoud: Bool){
        for var i = 0; i < numberOfTimes; i++ {
            if isLoud {
                chuff()
            }
            else{
                println("Puff Puff")
            }
        }
    }
    
    static func ageOfTigersInTigerYears(ageInHumanYears: Int) -> Int{
        let tigerAge = ageInHumanYears * 3
        return tigerAge
    }
    
}
