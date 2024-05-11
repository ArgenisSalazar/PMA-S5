//
//  SecondTableViewController.swift
//  S5-A-TablasSalazar
//
//  Created by Mac21 on 13/04/24.
//

import UIKit

class SecondTableViewController: UIViewController {
    
    var element: Person?
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let element = element {
            labelTitulo.text = "\(element.name) \(element.lastname)\nAddress: \(element.address)"
        }
    }

}
