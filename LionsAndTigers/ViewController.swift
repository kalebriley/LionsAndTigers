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
    var lionCubs: [String] = []
    var currentAnimal = (species: "Tiger", index: 0)
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create first tiger
        var firstTiger = Tiger()
        firstTiger.name = "Tierra"
        firstTiger.age = 1
        firstTiger.breed = "Bengal"
        firstTiger.image = UIImage(named: "BengalTiger.jpg")
        firstTiger.chuff()
        
        var secondTiger = Tiger()
        secondTiger.name = "Alcyone"
        secondTiger.breed = "Bengal"
        secondTiger.image = UIImage(named: "MalayanTiger.jpg")
        secondTiger.chuffNumberOfTimes(5)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Ambercita"
        thirdTiger.age = 1
        thirdTiger.breed = "Bengal"
        thirdTiger.image = UIImage(named: "SiberianTiger.jpg")
        thirdTiger.chuffNumberOfTimes(4, isLoud: false)
        
        var lion = Lion()
        lion.age = 3
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 1
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sheba"
        lioness.subspecies = "West African"
        
        self.myTigers += [firstTiger, secondTiger, thirdTiger]
        self.myLions += [lion, lioness]
        
        // generate random tiger
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(sender: UIBarButtonItem){
        
    }
    
    // function to update current animal
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
    
    func updateView () {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImage.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.myLions[self.currentAnimal.index]
                self.myImage.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                
            }
//            else if self.currentAnimal.species == "LionCub" {
//                let lionCub = self.lionCubs[self.currentAnimal.index]
//                self.myImageView.image = lionCub.image
//                self.breedLabel.text = lionCub.subspecies
//                self.ageLabel.text = "\(lionCub.age)"
//                self.nameLabel.text = lionCub.name
//                
//            }
            
            
            
            }, completion: {
                (finished: Bool) -> () in
        })
        
    }
    


}

