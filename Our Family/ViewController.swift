//
//  ViewController.swift
//  Our Family
//
//  Created by Ivan on 11.11.2021.
//

import UIKit

class ViewController: UIViewController {

    func changeButtonColor(_ button: UIButton) {
        if button.backgroundColor == .white {
            button.backgroundColor = .purple
            button.setTitleColor(.white, for: .normal)
        } else {
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        }
    }
    
    
    let nameList = [
        "Andreychuk Ivan Mykolayovych",
        "Andreychuk Alina Martynivna",
        "Andreychuk Ivan Ivanovych",
        "Danilov Oleksandr Anatoliovych",
        "Danilova Oksana Ivanivna",
        "Setaya Khrystyna Oleksandrivna",
        "Danilov Yehor Oleksandrovych"
        
    ]
    
    let persons = [
        Person(name: "Andreychuk Ivan Mykolayovych",
               imageName: "img_02",
               descriptionText: "I live in Vyshhorod"),
        Person(name: "Andreychuk Alina Martynivna",
               imageName: "img_01",
               descriptionText: "I live in Vyshhorod"),
        Person(name: "Andreychuk Ivan Ivanovych",
               imageName: "img_03",
               descriptionText: "I live in Vyshhorod"),
        Person(name: "Danilov Oleksandr Anatoliovych",
               imageName: "img_05",
               descriptionText: "I live in Vyshhorod"),
        Person(name: "Danilova Oksana Ivanivna",
               imageName: "img_04",
               descriptionText: "I live in Vyshhorod"),
        Person(name: "Setaya Khrystyna Oleksandrivna",
               imageName: "img_06",
               descriptionText: "I live in Vyshhorod"),
        Person(name: "Danilov Yehor Oleksandrovych",
               imageName: "img_07",
               descriptionText: "I live in Vyshhorod")
    ]
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBAction func buttonAction(_ sender: UIButton) {
            changeButtonColor(sender)
        guard let newVC = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
        guard let index = buttonCollection.firstIndex(of: sender) else { return }
        let person = persons[index]
        newVC.person = person
        navigationController?.pushViewController(newVC, animated: true)
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
}

