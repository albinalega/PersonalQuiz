//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Альбина Лега on 07/10/2022.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        navigationController?.dismiss(animated: true)
    }

}
