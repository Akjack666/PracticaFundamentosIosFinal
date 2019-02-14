//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by g5 on 14/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController  {

    @IBOutlet weak var tittleSeason: UILabel!
    @IBOutlet weak var dateSeason: UILabel!
    @IBOutlet weak var episodesList: UITableView!
    
    let model: Season
    
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
      //  episodesList.delegate = self as! UITableViewDelegate
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
       // setupUI()
    }
    
    
    func syncModelWithView() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        
        tittleSeason.text = model.nombre
        
        dateSeason.text = "Se estreno el  \(dateFormatter.string(from: model.fecha_lanzamiento))"

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
        cell?.textLabel?.text = episode.titulo
        cell?.detailTextLabel?.text = episode.description
        
        // Devolver la celda
        return cell!
    }
    
    }



    

