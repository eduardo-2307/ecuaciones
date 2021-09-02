//
//  ViewController.swift
//  ecuaciones2doGrado
//
//  Created by user191927 on 8/25/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputATextField: UITextField!
    
    @IBOutlet weak var inputBTextField: UITextField!
    
    @IBOutlet weak var inputCTextField: UITextField!
    
    @IBOutlet weak var root1: UITextField!
    
    @IBOutlet weak var root2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    var a = Double()
    var b = Double()
    var c = Double()
    var delta = Double()
    var x1 = Double()
    var x2 = Double()
    var x1_ = Double()
    var x2_ = Double()
    var ecuacionLineal = Bool()
    var ecuacionCuadratica = Bool()

    func revisarEcuacion() {
        if a == 0 {
            ecuacionLineal = true
            ecuacionCuadratica = false
        } else if a != 0 {
            ecuacionCuadratica = true
            ecuacionLineal = false
        }
    }


    func Delta() -> Double {
        delta = (b * b) - (4 * a * c)
        return delta
    }


    func resolver() {
        if ecuacionLineal == true {
            x1 = -c / b
            root2.isHidden = true
            root1.text = String(x1)
            
        } else if ecuacionCuadratica == true {
            delta = (b * b) - (4 * a * c)
            if delta >= 0 {
                x1 = ( -b + sqrt(delta)) / 2 * a
                x2 = ( -b - sqrt(delta)) / 2 * a
                root1.isHidden = false
                root2.isHidden = false
                root1.text = String(x1)
                root2.text = String(x2)

            } else if delta < 0 {
                x1 = ( -b ) / (2 * a)
                x1_ = (sqrt(-delta) / (2 * a))
                x2 = ( -b ) / (2 * a)
                x2_ = (sqrt(-delta) / (2 * a))
                root1.isHidden = false
                root2.isHidden = false
                
                root1.text = String(x1) + " + "  + String(format: "%.2f",x1_) + " i"
                root2.text = String(x2) + " - " + String(format: "%.2f",x2_) + " i"
                

            }
        }
    }

    
    @IBAction func calculateBtn(_ sender: UIButton) {
        a = Double(inputATextField.text!)!
        b = Double(inputBTextField.text!)!
        c = Double(inputCTextField.text!)!
        revisarEcuacion()
        resolver()
        
    }
    
}

