//
//  NuevoPlatoViewController.swift
//  C6-iOS-CL2-LaBuenaComida
//
//  Created by Sadohu on 14/10/23.
//

import UIKit

class NuevoPlatoViewController: UIViewController {
    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtDescripcion: UITextField!
    @IBOutlet weak var txtPrecio: UITextField!
    @IBOutlet weak var txtStock: UITextField!
    @IBOutlet weak var txtChef: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    @IBAction func btnGrabar(_ sender: UIButton) {
        
    }
}
