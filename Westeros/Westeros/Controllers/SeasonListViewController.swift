//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by g5 on 14/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit


protocol SeasonListViewControllerDelegate {
    // Should
    // Will
    // Did
    func houseListViewController(_ viewController: SeasonListViewController, didSelectHouse: Season)
}



class SeasonListViewController: UIViewController {

    @IBOutlet weak var SeasonTable: UITableView!
    
    // Propiedades
    
    let model: [Season]
    var delegate: HouseListViewControllerDelegate?
    
    init(model: [Season]) {
        
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func syncModelWithView() {
        
     }

   
    
   
}

extension SeasonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Descubrir cuál es la casa que tenemos que mostrar
        let season = model[indexPath.row]
        
        // Crear una celda
        let cellId = "SeasonCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sync celda - house (view - model)
        cell?.textLabel?.text = season.nombre
        
        // Devolver la celda
        return cell!
    }
    
    

}
