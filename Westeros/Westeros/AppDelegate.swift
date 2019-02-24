//
//  AppDelegate.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?
    // Creamos el split view controller y asignamos los controladores
    let splitViewController = UISplitViewController()
    
    var houseListViewController : HouseListViewController?
    var seasonListViewController : SeasonListViewController?
    var houseDetailViewController : HouseDetailViewController?
    var seasonDetailViewController : SeasonDetailViewController?
    var episodeDetailViewController : EpisodeDetailViewController?
    var episodeListViewController : EpisodeListViewController?
    var memberListViewController : MemberListViewController?
    var memberDetailViewController : MemberDetailViewController?
    
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = .red
        
        // Crearnos los modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        let episodes = Repository.local.episodes
        let members = Repository.local.houses[0].sortedMembers
        
        
        // Creamos los controladores (el que irá en master, y el que irá en el detail)
         houseListViewController = HouseListViewController(model: houses)
         seasonListViewController = SeasonListViewController(model: seasons)
         episodeListViewController = EpisodeListViewController(model: episodes)
        memberListViewController = MemberListViewController(model: members)
        
        
        // Recuperar la última casa seleccionada (si hay alguna)
        let lastHouseSelected = houseListViewController!.lastSelectedHouse()
        
         houseDetailViewController = HouseDetailViewController(model: lastHouseSelected)
         seasonDetailViewController = SeasonDetailViewController(model: seasons[0])
         episodeDetailViewController = EpisodeDetailViewController(model: episodes[0])
        memberDetailViewController = MemberDetailViewController(model: lastHouseSelected.sortedMembers[0])
        
        
        // Asigar delegados
        // Un objeto SOLO PUEDE TENER UN DELEGADO
        // Un objeto, puede ser delegado de muchos otros objetos
        houseListViewController!.delegate = houseDetailViewController
        seasonListViewController!.delegate = seasonDetailViewController
        episodeListViewController!.delegate = episodeDetailViewController
        memberListViewController!.delegate = memberDetailViewController
        
        
       
        
        // Creamos los controladores
        var controllers = [UIViewController]()
        
        
        controllers.append(houseListViewController!)
        controllers.append(seasonListViewController!)
        controllers.append(episodeListViewController!)
        
        
        // Crear el combinador
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        tabBarController.delegate = self
        
        
        
        
        
        splitViewController.viewControllers = [
            
            tabBarController,
          // houseListViewController.wrappedInNavigation(),
            houseDetailViewController!.wrappedInNavigation(),
        //   seasonListViewController.wrappedInNavigation(),
            seasonDetailViewController!.wrappedInNavigation(),
            episodeDetailViewController!.wrappedInNavigation(),
           
           
           
           
            episodeListViewController!.wrappedInNavigation(),
            episodeDetailViewController!.wrappedInNavigation()
           
        ]
        
        
        
        
        // Asignamos el rootViewController del window
        window?.rootViewController = splitViewController
        
        return true
    }
    
}

extension AppDelegate : UITabBarDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        
        //Esto lo tengo que guardar como propiedades
        let view = viewController.title
        
     
        if view == "Seasons" {
            print("First tab")
            
            splitViewController.showDetailViewController(seasonDetailViewController!,sender: self)
            
        } else if view == "Westeros" {
            print("Second tab")
            splitViewController.showDetailViewController(houseDetailViewController!,sender: self)
            
        }
        
        
    }
    
}

