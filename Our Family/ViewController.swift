//
//  ViewController.swift
//  Our Family
//
//  Created by Ivan on 11.11.2021.
//

import UIKit

class ViewController: UIViewController {

    let idCell = "personCell"
    let personsArray = [
        Person(name: "Andreychuk Ivan Mykolayovych",
               imageName: "img_02",
               locationText: "I live in Vyshhorod",
               familyMember: "Gradfather"),
        Person(name: "Andreychuk Alina Martynivna",
               imageName: "img_01",
               locationText: "I live in Vyshhorod",
               familyMember: "Gradmother"),
        Person(name: "Andreychuk Ivan Ivanovych",
               imageName: "img_03",
               locationText: "I live in Vyshhorod",
               familyMember: "Uncle"),
        Person(name: "Danilov Oleksandr Anatoliovych",
               imageName: "img_05",
               locationText: "I live in Vyshhorod",
               familyMember: "Father"),
        Person(name: "Danilova Oksana Ivanivna",
               imageName: "img_04",
               locationText: "I live in Vyshhorod",
               familyMember: "Mother"),
        Person(name: "Setaya Khrystyna Oleksandrivna",
               imageName: "img_06",
               locationText: "I live in Kyiv",
               familyMember: "Daughter"),
        Person(name: "Danilov Yehor Oleksandrovych",
               imageName: "img_07",
               locationText: "I live in Vyshhorod",
               familyMember: "Son")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        let btnSettings = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(goToSettings))
        navigationItem.rightBarButtonItem = btnSettings
    }
    
    @objc func goToSettings() {
        
    }
    
    func goToProfile(_ person: Person) {
        guard let profileViewController = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
        profileViewController.person = person
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell: UITableViewCell
//        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: idCell) {
//            cell = dequeueCell
//        } else {
//                    cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
//                }
//
//                let person = personsArray[indexPath.row]
//
//                cell.textLabel?.text = person.name
//                cell.detailTextLabel?.text = "detail text"
//                cell.imageView?.image = UIImage(named: person.imageName)
        
        
        
//        Unwrap with GUARD
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? ProfileTableViewCell else {
//            return UITableViewCell()
//        }
//        let person = personsArray[indexPath.row]
//        cell.imageViewCell?.image = UIImage(named: person.imageName)
//        cell.titleViewCell?.text = person.name
//        cell.localViewCell?.text = person.locationText
//        cell.textViewCell?.text = person.familyMember
////
//        return cell
//    }

        //        Unwrap with IF
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? ProfileTableViewCell {
            let person = personsArray[indexPath.row]
                cell.imageViewCell?.image = UIImage(named: person.imageName)
                cell.titleViewCell?.text = person.name
                cell.localViewCell?.text = person.locationText
                cell.textViewCell?.text = person.familyMember
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = personsArray[indexPath.row]
        goToProfile(person)
    }
}

extension ViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text as Any)
    }
}



//    @IBOutlet var buttonCollection: [UIButton]!
//    @IBAction func buttonAction(_ sender: UIButton) {
//            //changeButtonColor(sender)
//        guard let newVC = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
//        guard let index = buttonCollection.firstIndex(of: sender) else { return }
//        let person = persons[index]
//        newVC.person = person
//        navigationController?.pushViewController(newVC, animated: true)
//
//    }
