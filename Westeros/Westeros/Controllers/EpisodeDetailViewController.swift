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
        
    }
    
    
    func syncModelWithView() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        print("Desde aqui \(model)")
        seasonTitle.text = model._season?.nombre
        episodeDate.text = "Se estreno el  \(dateFormatter.string(from: model.fecha))"
        episodeTitle.text = model.titulo
        episodeDescription.text = model.description
        
        
    }
    
    
    
}



extension EpisodeDetailViewController: EpisodeListViewControllerDelegate {
    func episodeListViewController(_ viewController: EpisodeListViewController, didSelectSeason episode: Episode) {
        // Re-asigna el modelo
        self.model = episode
        
        // Sincroniza modelo (el nuevo) con la vista
        syncModelWithView()
    }
}
