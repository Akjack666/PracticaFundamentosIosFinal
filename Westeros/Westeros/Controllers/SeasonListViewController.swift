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
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectSeason: Season)
}



class SeasonListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var SeasonTable: UITableView!
    
    // Propiedades
    
    let model: [Season]
    var delegate: SeasonListViewControllerDelegate?
    
    init(model: [Season]) {
        
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SeasonTable.dataSource = self
        SeasonTable.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    func syncModelWithView() {
        
     }
    
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // Averiguar la casa que se ha pulsado
        let season = model[indexPath.row]
        
        // Avisar al delegado
        // Quien quiera, que se conforme al HouseListViewControllerDelegate para hacer lo que tenga que hacer
        delegate?.seasonListViewController(self, didSelectSeason: season)
        
        
        // Emitir la misma info por notificaciones
        let notificationCenter = NotificationCenter.default
        // Creamos la notificación
        let notification = Notification(name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [SEASON_KEY: season])
        
        // Enviamos la notificación
        notificationCenter.post(notification)
    }

    
    
   
}


