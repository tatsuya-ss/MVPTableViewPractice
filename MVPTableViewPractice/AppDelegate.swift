//
//  AppDelegate.swift
//  MVPTableViewPractice
//
//  Created by 坂本龍哉 on 2021/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        let sampleViewController = UIStoryboard(name: "Main",
                                                bundle: nil).instantiateInitialViewController() as! ViewController
        let navigationController = UINavigationController(rootViewController: sampleViewController)
        
        let model = SampleModel()
        let presenter = SamplePresenter(view: sampleViewController,
                                        model: model)
        
        sampleViewController.inject(presenter: presenter)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle


}

