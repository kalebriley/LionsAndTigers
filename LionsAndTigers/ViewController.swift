//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by User on 5/21/15.
//  Copyright (c) 2015 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    var myTigers:[Tiger] = []
    var myLions: [Lion] = []
    var currentAnimal = (species: "Tiger", index: 0)
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create first tiger
        var firstTiger = Tiger()
        firstTiger.name = "Tierra"
        firstTiger.Age = 1
        firstTiger.Breed = "Bengal"
        firstTiger.image = UIImage(named: "BengalTiger.jpg")
        firstTiger.chuff()
        
        var secondTiger = Tiger()
        secondTiger.name = "Alcyone"
        secondTiger.Age = Tiger.ageOfTigersInTigerYears(3)
        secondTiger.Breed = "Bengal"
        secondTiger.image = UIImage(named: "MalayanTiger.jpg")
        secondTiger.chuffNumberOfTimes(5)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Ambercita"
        thirdTiger.Age = 1
        thirdTiger.Breed = "Bengal"
        thirdTiger.image = UIImage(named: "SiberianTiger.jpg")
        thirdTiger.chuffNumberOfTimes(4, isLoud: false)
        
        var lion = Lion()
        lion.age = 3
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subSpecies = "West African"
        
        var lioness = Lion()
        lioness.age = 1
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sheba"
        lioness.subSpecies = "West African"
        
        self.myTigers += [firstTiger, secondTiger, thirdTiger]
        self.myLions += [lion, lioness]
        
        // generate random tiger
        self.pickRandomTiger()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(sender: UIBarButtonItem){
        self.pickRandomTiger()
    }
    
    func updateAnimal(){
        switch currentAnimal {
        case ("Tiger", _):
            let randomNumber = Int(arc4random_uniform(UInt32(self.myLions.count)))
            currentAnimal = ("Lion", randomNumber)
        default:
            let randomNumber = Int(arc4random_uniform(UInt32(self.myTigers.count)))
            currentAnimal = ("Tiger", randomNumber)
            break;
            
        }
    }
    
    func pickRandomTiger(){
        var randomNumber: Int
        
        
        // prevent any given tiger from showing up twice
        
        do{
            randomNumber = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while currentIndex == randomNumber
        
        currentIndex = randomNumber
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.changeTigerInformation(self.myTigers, randomTiger: randomNumber)
            }, completion: {(finished: Bool) -> () in})
    }
    
    func changeTigerInformation(arrayToUse: [Tiger], randomTiger: Int){
        self.myImage.image = arrayToUse[randomTiger].image
        self.nameLabel.text = "Name: \(arrayToUse[randomTiger].name)"
        self.ageLabel.text = "Age: \(arrayToUse[randomTiger].Age)"
        self.breedLabel.text = "Breed: \(arrayToUse[randomTiger].Breed)"
    }

}

