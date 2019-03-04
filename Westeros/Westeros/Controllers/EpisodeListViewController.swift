//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Dani rica on 17/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

protocol EpisodeListViewControllerDelegate {
    // Should
    // Will
    // Did
    func episodeListViewController(_ viewController: EpisodeListViewController, didSelectSeason: Episode)
}

class EpisodeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var episodeList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeList.dataSource = self
        episodeList.delegate = self

        // Do any additional setup after loading the view.
    }
    
    var model: [Episode]
    var delegate: EpisodeListViewControllerDelegate?
    
    init(model: [Episode]) {
        
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Descubrir cuál es la casa que tenemos que mostrar
        let episode = model[indexPath.row]
        
        // Crear una celda
        let cellId = "EpisodeCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sync celda - house (view - model)
        cell?.textLabel?.text = episode.title
        
        
        // Devolver la celda
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Averiguar la casa que se ha pulsado
        let episode = model[indexPath.row]
        
        // Avisar al delegado
        // Quien quiera, que se conforme al HouseListViewControllerDelegate para hacer lo que tenga que hacer
        delegate?.episodeListViewController(self, didSelectSeason: episode)
        
    }
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
