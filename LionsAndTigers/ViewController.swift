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
    var shownTigers:[Tiger] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create first tiger
        var firstTiger = Tiger()
        firstTiger.name = "Tierra"
        firstTiger.Age = 1
        firstTiger.Breed = "Bengal"
        firstTiger.image = UIImage(named: "BengalTiger.jpg")
        
        var secondTiger = Tiger()
        secondTiger.name = "Alcyone"
        secondTiger.Age = 1
        secondTiger.Breed = "Bengal"
        secondTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Ambercita"
        thirdTiger.Age = 1
        thirdTiger.Breed = "Bengal"
        thirdTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        myTigers += [firstTiger, secondTiger, thirdTiger]
        
        // generate random number
        self.pickRandomTiger()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(sender: UIBarButtonItem){
        self.pickRandomTiger()
    }
    
    func pickRandomTiger(){
        let randomNumber = Int(arc4random_uniform(UInt32(myTigers.count)))
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
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

