//
//  TableViewController.swift
//  S5-A-TablasSalazar
//
//  Created by Mac21 on 13/04/24.
//

import UIKit

struct Person {
    let name: String
    let lastname: String
    let address: String
}


class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    let people: [Person] = [
        Person(name: "Argenis", lastname: "Salazar", address: "Lima"),
        Person(name: "Paolo", lastname: "Sihuay", address: "Lima"),
        Person(name: "Marcos", lastname: "Diaz", address: "Lima")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let person = people[indexPath.row]
        
        var tableContent = UIListContentConfiguration.cell()
        tableContent.text = "\(person.name) \(person.lastname) "
        cell.contentConfiguration = tableContent
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(people[indexPath.row])
        self.performSegue(withIdentifier: "SecondSegue", sender: people[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondSegue"{
            let secondTableView: SecondTableViewController = segue.destination as! SecondTableViewController
            secondTableView.element = sender as? Person
            
        }
    }
}
