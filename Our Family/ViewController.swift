//
//  ViewController.swift
//  Our Family
//
//  Created by Ivan on 11.11.2021.
//

import UIKit

class ViewController: UIViewController {

    let idCell = "personCell"
    var filteredPersons = [
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
    
    var bufferedPersons = [
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
    
    var searchController: UISearchController!
    var searchResult: [Person] = []
    
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
        self.navigationController?.navigationBar.prefersLargeTitles = true

//      tableView.isEditing = true               Ask Christina why it doesn’t work
        
        let search = UISearchController(searchResultsController: nil)

        // 1
        search.searchResultsUpdater = self
        // 2
        search.obscuresBackgroundDuringPresentation = false
        // 3
        search.searchBar.placeholder = "Search Person"
        // 4
        navigationItem.searchController = search
        // 5
        definesPresentationContext = true

        let btnSettings = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(goToSettings))
        navigationItem.rightBarButtonItem = btnSettings
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    @objc func goToSettings() {
//        let vc = storyboard?.instantiateInitialViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeRead = UIContextualAction(style: .normal, title: "Oops!") { (action, view, success) in
            print ("No Read Swipe")
        }
            // swipeRead.image =
            swipeRead.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return UISwipeActionsConfiguration(actions: [swipeRead])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeMore = UIContextualAction(style: .normal, title: "More") { (action, view, success) in
            print ("More")
        }
            // swipeMore.image =
            swipeMore.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let swipeFlag = UIContextualAction(style: .normal, title: "Flag") { (action, view, success) in
            print ("Flag")
        }
            // swipeFlag.image =
            swipeFlag.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    
        let swipeAr = UIContextualAction(style: .normal, title: "Archive") { (action, view, success) in
            print ("Archive")
        }
            // swipeArchive.image =
            swipeAr.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        let conf = UISwipeActionsConfiguration(actions: [swipeAr, swipeFlag, swipeMore])   // Full Swipe off
        if indexPath.row == 0 {          // Full Swipe works in the front row, but doesn't work for the rest
            conf.performsFirstActionWithFullSwipe = true
            } else {
            conf.performsFirstActionWithFullSwipe = false
            }
        return conf
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
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredPersons.count
//    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
      if isFiltering {
        return filteredPersons.count
      }
        
      return filteredPersons.count
    }

    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        
//        if let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? ProfileTableViewCell {
//            let person = filteredPersons[indexPath.row]
//                cell.imageViewCell?.image = UIImage(named: person.imageName)
//                cell.titleViewCell?.text = person.name
//                cell.localViewCell?.text = person.locationText
//                cell.textViewCell?.text = person.familyMember
//            return cell
//        } else {
//            return UITableViewCell()
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      let person: Person
      if isFiltering {
        person = filteredPersons[indexPath.row]
      } else {
        person = filteredPersons[indexPath.row]
      }
      cell.textLabel?.text = person.name
      //cell.detailTextLabel?.text = bufferedPersons.rawValue
      return cell
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = filteredPersons[indexPath.row]
        goToProfile(person)
    }
}

    

extension ViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text)
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if searchController.searchBar.text != nil {
            
        }
    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }

    func filterContentForSearchText(_ searchText: String? = nil) {
      filteredPersons = bufferedPersons.filter { (persons: Person) -> Bool in
        return persons.name.lowercased().contains(searchText!.lowercased())
      }
      
      tableView.reloadData()
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
