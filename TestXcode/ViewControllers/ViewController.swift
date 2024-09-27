//
//  ViewController.swift
//  TestXcode
//
//  Created by Mañanas on 27/9/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tipTextField: UITextField! // UITextField para ingresar la propina
    
    // Array para almacenar las propinas
    var tips: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath)
        cell.textLabel?.text = String(format: "€%.2f", tips[indexPath.row])
        return cell
    }
    
    // MARK: IBAction
    
    @IBAction func addTip(_ sender: UIButton) {
        guard let tipText = tipTextField.text, !tipText.isEmpty else {
            print("Por favor ingresa una propina válida.")
            return
        }
        
        if let newTip = Double(tipText) {
            tips.append(newTip)
            tableView.reloadData()
            tipTextField.text = ""
        } else {
            print("El valor ingresado no es un número válido.")
        }
    }
    
    // Acción para pasar a la segunda pantalla
    @IBAction func calculateTip(_ sender: UIButton) {
        // Aquí harías el segue a la segunda pantalla
        performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            // Asegúrate de que el destino es el ViewController de la segunda pantalla
            if let destinationVC = segue.destination as? ResultViewController {
                destinationVC.totalTip = tips.reduce(0, +) // Pasa la suma de las propinas
            }
        }
    }
}
