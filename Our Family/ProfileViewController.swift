//
//  ProfileViewController.swift
//  Our Family
//
//  Created by Ivan on 17.11.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.purple.cgColor
        
        guard let person = person else { return }
        imageView.image = UIImage(named: person.imageName)
        nameLabel.text = person.name
        locationLabel.text = person.locationText
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
