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
    var chosenAnswers: [Answer] = [] // Если нельзя присвоить значение по умолчанию, то ставим "!" вместо "= []"
    
    // MARK: override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    // MARK: IBActions
    @IBAction func doneButtonPressed(_ sender: Any) {
        navigationController?.dismiss(animated: true)
    }
    
}

extension ResultViewController {
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = chosenAnswers.map { $0.animal } // наполняем массив animals животными из массива chosenAnswers (перебираем и возвращаем новый массив)
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] { // если у нас есть такое животное, то
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal) // прибавляем к ключу 1
            } else {
                frequencyOfAnimals[animal] = 1 // если такого животного нет, прибавляем 1
            }
        }
        
//          ВТОРОЙ ВАРИАНТ:
//        for animal in animals {
//            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
//        } // мне кажется, он понятней, но Алексей не согласен
        
//          ТРЕТИЙ ВАРИАНТ:
//        for animal in animals {
//            frequencyOfAnimals[animal, default: 0] += 1
//        } 
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value } // сравниваем значения словаря
        guard let mostFrequentAnimal = sortedFrequencyOfAnimals.first?.key else { return } // берем первое значение (оно самое большое)
        
        updateUI(with: mostFrequentAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        animalYouAreLabel.text = "Вы - \(animal.rawValue)!"
        discriptionLabel.text = animal.definition
    }
}
