//
//  DetallePlatoViewController.swift
//  C6-iOS-CL2-LaBuenaComida
//
//  Created by Sadohu on 14/10/23.
//

import UIKit

class DetallePlatoViewController: UIViewController {
    @IBOutlet weak var lblCodigo: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    @IBOutlet weak var lblStock: UILabel!
    @IBOutlet weak var lblChef: UILabel!
    var bean : PlatoEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        lblCodigo.text = "#" + String(bean.codigo);
        lblDescripcion.text = bean.descripcion;
        lblPrecio.text = "S/ " + String(bean.precio);
        lblStock.text = String(bean.stock) + " unidad(es)."
        lblChef.text = bean.chef;
    }

}
