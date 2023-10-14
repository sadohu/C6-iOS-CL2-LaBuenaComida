//
//  PlatoController.swift
//  C6-iOS-CL2-LaBuenaComida
//
//  Created by Sadohu on 14/10/23.
//

import UIKit

class PlatoController: NSObject {
    func addPlato(bean : Plato){
        let delegate = UIApplication.shared.delegate as! AppDelegate;
        let context = delegate.persistentContainer.viewContext;
        
        let entity = PlatoEntity(context: context);
        entity.codigo = Int16(bean.codigo);
        entity.descripcion = bean.descripcion;
        entity.precio = bean.precio;
        entity.stock = Int16(bean.stock);
        entity.chef = bean.chef;
        
        do{
            try context.save();
        } catch(let e as NSError){
            print(e.localizedDescription);
        }
    }
    
    func listPlatos() -> [PlatoEntity]{
        let delegate = UIApplication.shared.delegate as! AppDelegate;
        let context = delegate.persistentContainer.viewContext;
        
        var result : [PlatoEntity]!;
        do{
            let data = PlatoEntity.fetchRequest();
            result = try context.fetch(data);
        } catch(let e as NSError){
            print(e.localizedDescription);
        }
        return result;
    }
}
