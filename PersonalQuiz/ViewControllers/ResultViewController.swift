//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Альбина Лега on 07/10/2022.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var animalYouAreLabel: UILabel!
    @IBOutlet var discriptionLabel: UILabel!
    
    var animalEmoji = ""
    var chosenAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        animalYouAreLabel.text = "Вы - \(animalEmoji)"
        

    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        navigationController?.dismiss(animated: true)
    }

}
