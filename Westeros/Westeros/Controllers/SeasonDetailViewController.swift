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
        title = model.nombre
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
        
        episodesList.dataSource = self
        
      //  episodesList.delegate = self
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
        tittleSeason.text = model.nombre
        dateSeason.text = "Se estreno el  \(dateFormatter.string(from: model.fecha_lanzamiento))"
        episodesList.dataSource = self
        self.episodesList.reloadData()


    }
    
 /*   // MARK: UI
    func setupUI() {
        // Crear los botones
        let episodeButton = UIBarButtonItem(title: "Episode", style: .plain, target: self, action: #selector(displayEpisode))

        
        // Mostrar los botones
        navigationItem.rightBarButtonItems = [episodeButton]
    }
    
    @objc func displayEpisode() {
        // Creamos el controlador
        let episodeDetailController = EpisodeDetailViewController(model: episode)
        
        // Lo mostramos mediante push
        navigationController?.pushViewController(episodeDetailController, animated: true)
    }
    
   */

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
        cell?.textLabel?.text = episode.titulo
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




    

