//
//  AppDelegate.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = .red
        
        // Crearnos los modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        let episodes = Repository.local.episodes
        
        // Creamos los controladores (el que irá en master, y el que irá en el detail)
        let houseListViewController = HouseListViewController(model: houses)
        let seasonListViewController = SeasonListViewController(model: seasons)
        let episodeListViewController = EpisodeListViewController(model: episodes)
        
        
        // Recuperar la última casa seleccionada (si hay alguna)
        let lastHouseSelected = houseListViewController.lastSelectedHouse()
        
        let houseDetailViewController = HouseDetailViewController(model: lastHouseSelected)
        let seasonDetailViewController = SeasonDetailViewController(model: seasons[0])
        let episodeDetailViewController = EpisodeDetailViewController(model: episodes[0])
        
        
        // Asigar delegados
        // Un objeto SOLO PUEDE TENER UN DELEGADO
        // Un objeto, puede ser delegado de muchos otros objetos
        houseListViewController.delegate = houseDetailViewController
        seasonListViewController.delegate = seasonDetailViewController
        episodeListViewController.delegate = episodeDetailViewController
       
        
        
        
        // Creamos el split view controller y asignamos los controladores
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [
         //   houseListViewController.wrappedInNavigation(),
         //  houseDetailViewController.wrappedInNavigation(),
        //    seasonListViewController.wrappedInNavigation(),
         //  seasonDetailViewController.wrappedInNavigation(),
            episodeListViewController.wrappedInNavigation(),
            episodeDetailViewController.wrappedInNavigation()
         
           
        ]
        
        
        // Asignamos el rootViewController del window
        window?.rootViewController = splitViewController
        
        
        
        return true
    }
    
}

