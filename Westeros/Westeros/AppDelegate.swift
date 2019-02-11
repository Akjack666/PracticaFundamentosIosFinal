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

        // Creamos los controladores (el que irá en master, y el que irá en el detail)
        let houseListViewController = HouseListViewController(model: houses).wrappedInNavigation()
        let houseDetailViewController = HouseDetailViewController(model: houses.first!).wrappedInNavigation()
        
        // Creamos el split view controller y asignamos los controladores
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [houseListViewController, houseDetailViewController]
        
        
        // Asignamos el rootViewController del window
        window?.rootViewController = splitViewController
        
        return true
    }
}

