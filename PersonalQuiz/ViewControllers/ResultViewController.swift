//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Альбина Лега on 07/10/2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var animalYouAreLabel: UILabel!
    @IBOutlet var discriptionLabel: UILabel!
    
    // MARK: properties
    var chosenAnswers: [Answer] = []
    private var dogsCount = 0
    private var catsCount = 0
    private var rabbitCount = 0
    private var turtleCount = 0
    
    // MARK: override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        countEachAnimalAmount()
        findTheMostPopularAnimal()
    }
    
    // MARK: IBActions
    @IBAction func doneButtonPressed(_ sender: Any) {
        navigationController?.dismiss(animated: true)
    }
    
    // MARK: Private methods
    private func countEachAnimalAmount() {
        for answer in chosenAnswers {
            
            if answer.animal == .dog {
                dogsCount += 1
            } else if answer.animal == .cat {
                catsCount += 1
            } else if answer.animal == .rabbit {
                rabbitCount += 1
            } else {
                turtleCount += 1
            }
        }
    }
    
    private func findTheMostPopularAnimal() {
        if dogsCount >= 2 {
            let youAreDog = Animal(rawValue: "🐶")

            animalYouAreLabel.text = "Вы - \(youAreDog?.rawValue ?? "a")!"
            discriptionLabel.text = youAreDog?.definition
            
        } else if catsCount >= 2 {
            let youAreCat = Animal(rawValue: "🐱")
            
            animalYouAreLabel.text = "Вы - \(youAreCat?.rawValue ?? "a")!"
            discriptionLabel.text = youAreCat?.definition
            
        } else if rabbitCount >= 2 {
            let youAreRabbit = Animal(rawValue: "🐰")
            
            animalYouAreLabel.text = "Вы - \(youAreRabbit?.rawValue ?? "a")!"
            discriptionLabel.text = youAreRabbit?.definition
            
        } else {
            let youAreTurtle = Animal(rawValue: "🐢")
            
            animalYouAreLabel.text = "Вы - \(youAreTurtle?.rawValue ?? "a")!"
            discriptionLabel.text = youAreTurtle?.definition
        }
    }

}
