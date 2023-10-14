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
    @IBOutlet weak var lblError: UILabel!
    var platoList : [PlatoEntity] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        lblError.isHidden = true;
        platoList = PlatoController().listPlatos();
    }

    @IBAction func btnGrabar(_ sender: UIButton) {
        var codigo, stock : Int;
        var descripcion, chef : String;
        var precio : Double;
        
        codigo = Int(txtCodigo.text ?? "0") ?? 0;
        descripcion = txtDescripcion.text ?? "";
        precio = Double(txtPrecio.text ?? "0") ?? 0;
        stock = Int(txtStock.text ?? "0") ?? 0;
        chef = txtChef.text ?? "";
        
        let data = Plato(codigo: codigo, descripcion: descripcion, precio: precio, stock: stock, chef: chef);
        
        let platoExiste = platoList.contains(where: {
            $0.codigo == codigo
        })
        
        if(platoExiste){
            lblError.isHidden = false;
            print("Error manito");
        }else{
            PlatoController().addPlato(bean: data);
            platoList = PlatoController().listPlatos();
            lblError.isHidden = true;
            print("Add new plato success!");
        }
    }
    
    @IBAction func txtCodigoListener(_ sender: UITextField) {
        lblError.isHidden = true;
    }
}
