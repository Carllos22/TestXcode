//
//  ViewController.swift
//  TestXcode
//
//  Created by Mañanas on 27/9/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tipTextField: UITextField!
    
    // MARK: Array to store tips
    var tips: [Double] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: Number rows in table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tips.count
    }

    // MARK: Configura las celdas de la tabla para mostrar las propinas
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath)
        cell.textLabel?.text = String(format: "$%.2f", tips[indexPath.row])
        return cell
    }

    // MARK: ADD TIP
    @IBAction func addTip(_ sender: UIButton) {
        if let newTip = Double(tipTextField.text ?? "") {
            tips.append(newTip)
            tableView.reloadData()
            tipTextField.text = ""
        }
    }
    
    // MARK: PASS SECOND VIEW
    @IBAction func calculateTip(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showResult", sender: self)
    }
}

