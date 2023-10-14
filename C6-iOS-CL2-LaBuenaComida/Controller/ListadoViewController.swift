//
//  ListadoViewController.swift
//  C6-iOS-CL2-LaBuenaComida
//
//  Created by Sadohu on 14/10/23.
//

import UIKit

class ListadoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tvPlatos: UITableView!
    var platosList : [PlatoEntity] = [];
    var indexPlato = -1;
    let refreshControl = UIRefreshControl();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        platosList = PlatoController().listPlatos();
        tvPlatos.dataSource = self;
        tvPlatos.delegate = self;
        tvPlatos.rowHeight = 90;
        /* Primer método de recarga de datos */
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged);
        tvPlatos.refreshControl = refreshControl;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /* Segundo método para recarga de datos */
        platosList = PlatoController().listPlatos();
        self.tvPlatos.reloadData();
    }
    
    @IBAction func btnNuevo(_ sender: UIButton) {
        /* Tercer método para recarga de datos */
        performSegue(withIdentifier: "nuevoPlato", sender: self);
    }

    @IBAction func btnRefresh(_ sender: UIButton) {
        platosList = PlatoController().listPlatos();
        self.tvPlatos.reloadData();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return platosList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let view = tvPlatos.dequeueReusableCell(withIdentifier: "itemPlato") as! ItemPlatoTableViewCell;
        let descripcion = platosList[indexPath.row].descripcion;
        let precio = String(platosList[indexPath.row].precio);
        view.lblDescripcion.text = descripcion;
        view.lblPrecio.text = "S/ " + precio;
        return view;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPlato = indexPath.row;
        performSegue(withIdentifier: "detallePlato", sender: self);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detallePlato"){
            let view = segue.destination as! DetallePlatoViewController;
            view.bean = platosList[indexPlato];
        }
    }
    
    @objc func updateData() {
        platosList = PlatoController().listPlatos();
        self.tvPlatos.reloadData();
        self.refreshControl.endRefreshing();
    }
}
