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
            button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        } else {
            //button.setTitle(name, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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

