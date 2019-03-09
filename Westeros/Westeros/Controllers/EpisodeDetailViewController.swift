//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Dani rica on 17/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var seasonTitle: UILabel!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeDate: UILabel!
    @IBOutlet weak var episodeDescription: UILabel!
    
    
    var model: Episode
    
    init(model: Episode) {
        
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
        // setupUI()
        // episodesList.dataSource = self
        
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
    
        
        model = episode
        
        
    }
    
    
    func syncModelWithView() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        seasonTitle.text = model._season?.name
        episodeDate.text = "Se estreno el  \(dateFormatter.string(from: model.date))"
        episodeTitle.text = model.title
        episodeDescription.text = model.description
        
        
    }
    
    
    
}


