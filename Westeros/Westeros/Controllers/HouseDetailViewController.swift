//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 04/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var wordsLabel: UILabel!
    
    // MARK: Properties
    let model: House
    
    // MARK: Initialization
    init(model: House) {
        // Primero, limpio mi mierda
        self.model = model
        // Llamo a super
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    // Chapuza de los de Cupertino relacionada con el miedo a nil
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
    }
    
    // MARK: Sync
    func syncModelWithView() {
        
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
    }
}
