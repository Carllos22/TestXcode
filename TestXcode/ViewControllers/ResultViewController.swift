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

    // Variables para el cálculo
    
    var totalTip: Double = 0.0 // Esta se recibirá desde la primera pantalla
    var employeeCount: Int = 1 // Inicialmente hay 1 empleado

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI() // Actualizar la interfaz cuando se carga la pantalla
    }

    // Función para actualizar la interfaz con los valores actuales
    func updateUI() {
        employeeCountLabel.text = "\(employeeCount)"
        let amountPerEmployee = totalTip / Double(employeeCount)
        amountPerEmployeeLabel.text = String(format: "$%.2f", amountPerEmployee)
    }

    // IBAction para aumentar el número de empleados
    @IBAction func increaseEmployees(_ sender: UIButton) {
        employeeCount += 1
        updateUI()
    }

    // IBAction para reducir el número de empleados
    @IBAction func decreaseEmployees(_ sender: UIButton) {
        if employeeCount > 1 {
            employeeCount -= 1
            updateUI()
        }
    }
}
