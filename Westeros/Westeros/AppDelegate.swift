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
    // Creamos el split view controller y asignamos los controladores
    let splitViewController = UISplitViewController()
    
    var houseListViewController : HouseListViewController?
    var seasonListViewController : SeasonListViewController?
    var houseDetailViewController : HouseDetailViewController?
    var seasonDetailViewController : SeasonDetailViewController?
   
    var seasonDetailNavigation : UINavigationController?
    var houseDetailNavigation : UINavigationController?
   


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = .red
        
        // Crearnos los modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        
        
        // Creamos los controladores (el que irá en master, y el que irá en el detail)
         houseListViewController = HouseListViewController(model: houses)
         seasonListViewController = SeasonListViewController(model: seasons)
      
     
       
        
        // Recuperar la última casa seleccionada (si hay alguna)
        let lastHouseSelected = houseListViewController!.lastSelectedHouse()
        
         houseDetailViewController = HouseDetailViewController(model: lastHouseSelected)
         seasonDetailViewController = SeasonDetailViewController(model: seasons[0])
    
        
        
        // Asigar delegados
        // Un objeto SOLO PUEDE TENER UN DELEGADO
        // Un objeto, puede ser delegado de muchos otros objetos
        houseListViewController!.delegate = houseDetailViewController
        seasonListViewController!.delegate = seasonDetailViewController
     
        seasonDetailNavigation = seasonDetailViewController!.wrappedInNavigation()
        houseDetailNavigation = houseDetailViewController!.wrappedInNavigation()

       
        
        // Creamos los controladores
        var controllers = [UIViewController]()
        
        
        controllers.append(houseListViewController!.wrappedInNavigation())
        controllers.append(seasonListViewController!.wrappedInNavigation())
        
        
        
        
        // Crear el combinador
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        tabBarController.delegate = self
        
        
        splitViewController.viewControllers = [
            
            tabBarController,
            houseDetailNavigation,
            seasonDetailNavigation,
            ] as! [UIViewController]
        

        // Asignamos el rootViewController del window
        window?.rootViewController = splitViewController
        
        return true
    }
    

}

// Detectar viewcontroller en la tab
extension AppDelegate : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        
        //Esto lo tengo que guardar como propiedades
        let view = viewController.title
        
     
        if view == "Seasons" {
            print("First tab")
            
            splitViewController.showDetailViewController(seasonDetailNavigation!,sender: self)
            
        } else if view == "Westeros" {
            print("Second tab")
            
            splitViewController.showDetailViewController(houseDetailNavigation!,sender: self)
            
        }
        
        
    }
    
}

