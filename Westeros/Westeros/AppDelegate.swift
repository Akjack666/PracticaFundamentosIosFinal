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

        // Crear el combinador
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = houses.map { HouseDetailViewController(model: $0).wrappedInNavigation()}
        
        // Asignamos el rootViewController del window
        window?.rootViewController = tabBarController
        
        return true
    }
}

