//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by g5 on 14/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

protocol SeasonDetailViewControllerDelegate {
    // Should
    // Will
    // Did
    func seasonDetailViewController(_ viewController: SeasonDetailViewController, didSelectEpisode: Episode)
}

class SeasonDetailViewController: UIViewController  {

    @IBOutlet weak var tittleSeason: UILabel!
    @IBOutlet weak var dateSeason: UILabel!
    @IBOutlet weak var episodesList: UITableView!
    
    var model: Season
    
    var delegate: SeasonDetailViewControllerDelegate?
    
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
        
        episodesList.dataSource = self
        episodesList.delegate = self
        
        
        
      
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       syncModelWithView()
       // setupUI()
       // episodesList.dataSource = self
        episodesList.dataSource = self
        episodesList.delegate = self
        
        // Nos damos de alta en las notificaciones
        // Tan pronto como te des de alta, implementa el código para darte de baja. Si no, te olvidarás
        let notificationCenter = NotificationCenter.default
        let name = Notification.Name(EPISODE_DID_CHANGE_NOTIFICATION_NAME)
        
        notificationCenter.addObserver(self,
                                       selector: #selector(episodeDidChange(notification:)),
                                       name: name,
                                       object: nil) // Object es quien manda la notific
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Nos damos de baja en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    
    @objc func episodeDidChange(notification: Notification) {
        // Sacar el userInfo de la noti, y la casa del userInfo
        guard let info = notification.userInfo,
            let episode = info[EPISODE_KEY] as? Episode else {
                print("Desde notificacion")
                return
        }
        
        
        model = episode._season!
        
        syncModelWithView()
        
    
    }
    
    
    func syncModelWithView() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        print("Desde aqui \(model)")
        tittleSeason.text = model.name
        dateSeason.text = "Se estreno el  \(dateFormatter.string(from: model.releaseDate))"
        title = model.name
        episodesList.dataSource = self
        self.episodesList.reloadData()


    }
    

}

extension SeasonDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.sortedEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Descubrir los episodios
       let episode = model.sortedEpisodes[indexPath.row]
        
        // Pedir una celda a la tabla (si es que la tiene), o si no, crearla.
        let cellId = "EpisodeCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        // Sincronizar modelo y vista
        cell?.textLabel?.text = episode.title
        cell?.detailTextLabel?.text = episode.description
        
        // Devolver la celda
        return cell!
    }
    

    
    }


extension SeasonDetailViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectSeason season: Season) {
        // Re-asigna el modelo
        self.model = season
        
        // Sincroniza modelo (el nuevo) con la vista
        syncModelWithView()
    }
}


extension SeasonDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let episode = model.sortedEpisodes[indexPath.row]
        
        delegate?.seasonDetailViewController(self, didSelectEpisode: episode)
        
        let episodeDetailViewController = EpisodeDetailViewController(model: episode)
        
        // Emitir la misma info por notificaciones
        let notificationCenter = NotificationCenter.default
        // Creamos la notificación
        let notification = Notification(name: Notification.Name(EPISODE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [EPISODE_KEY: episode])
        
        // Enviamos la notificación
        notificationCenter.post(notification)
        
        navigationController?.pushViewController(episodeDetailViewController, animated: true)
        
        print(episode)
        
    }
}


