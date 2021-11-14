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
            //button.setTitle(name, for: .normal)
            button.backgroundColor = .blue
            button.setTitleColor(.white, for: .normal)
        } else {
            //button.setTitle(name, for: .normal)
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
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBAction func buttonAction(_ sender: UIButton) {
            changeButtonColor(sender)
        
        
    }
    
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }


}

