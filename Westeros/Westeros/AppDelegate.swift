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
        
        // Creamos los controladores
        var controllers = [UIViewController]()
        
        for eachHouse in houses {
            controllers.append(HouseDetailViewController(model: eachHouse).wrappedInNavigation())
        }
        
        // Crear el combinador
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        
        // Asignamos el rootViewController del window
        window?.rootViewController = tabBarController
        
        return true
    }
}

