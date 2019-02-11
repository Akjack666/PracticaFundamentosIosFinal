//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 07/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

class HouseListViewController: UITableViewController {
    
    // MARK: Properties
    let model: [House]
    
    // MARK: Initialization
    init(model: [House]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Descubrir cuál es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        // Crear una celda
        let cellId = "HouseCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sync celda - house (view - model)
        cell?.textLabel?.text = house.name
        cell?.imageView?.image = house.sigil.image
        
        // Devolver la celda
        return cell!
    }
    
    // MARK: UITableView Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Averiguar la casa que se ha pulsado
        let house = model[indexPath.row]
        
        // Crear el controlador de detalle de esa casa
        let houseDetailViewController = HouseDetailViewController(model: house)
        
        // Vamos a mostrarlo (push)
        navigationController?.pushViewController(houseDetailViewController, animated: true)
    }
}
