//
//  ResultViewController.swift
//  TestXcode
//
//  Created by Mañanas on 27/9/24.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var employeeCountLabel: UILabel!
    
    @IBOutlet weak var amountPerEmployeeLabel: UILabel!

    
    var totalTip: Double = 0.0 // Esta se recibirá desde la primera pantalla
    var employeeCount: Int = 1 // Inicialmente hay 1 empleado

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI() // Actualizar la interfaz cuando se carga la pantalla
    }

    // MARK: Actualizar la interfaz con los valores actuales
    func updateUI() {
        employeeCountLabel.text = "\(employeeCount)"
        let amountPerEmployee = totalTip / Double(employeeCount)
        amountPerEmployeeLabel.text = String(format: "$%.2f", amountPerEmployee)
    }

    // MARK: Actions para aumentar el número de empleados
    
    @IBAction func increaseEmployees(_ sender: Any) {
        employeeCount += 1
        updateUI()
    }
    
    // MARK: Actions para reducir el número de empleados
    
    @IBAction func decreaseEmployees(_ sender: Any) {
        if employeeCount > 1 {
            employeeCount -= 1
            updateUI()
        }
    }
}
