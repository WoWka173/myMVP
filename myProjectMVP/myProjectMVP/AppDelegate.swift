//
//  AppDelegate.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 09.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()
        
        let firstPresenter: MainTableViewModulePresenterProtocol = MainTableViewModulePresenter()
        let firstNC = UINavigationController(rootViewController: MainTableModuleViewController(presenter: firstPresenter))
        
        let secondNC = UINavigationController(rootViewController: MainTableModuleViewController(presenter: firstPresenter))
        
        let thridPresentor: ProfileUserViewModulePresenterProtocol = ProfileUserViewModulePresentor()
        let thirdNC = UINavigationController(rootViewController: ProfileUserViewController(presenter: thridPresentor))
        
        let fourNC = UINavigationController(rootViewController: MainTableModuleViewController(presenter: firstPresenter))
        
        tabBarController.viewControllers = [firstNC, secondNC, thirdNC, fourNC]
        tabBarController.setViewControllers([firstNC, secondNC, thirdNC, fourNC], animated: true)
        tabBarController.tabBar.isHidden = false
        
        firstNC.title = "Меню"
        secondNC.title = "Коллекция меню"
        thirdNC.title = "Профиль"
        fourNC.title = "Контакты"
        
        guard let items = tabBarController.tabBar.items else { return false }
        let images = ["menucard", "menucard.fill", "brain.head.profile","phone.bubble.left"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
     
        window?.rootViewController = tabBarController
        window?.backgroundColor = .clear
        window?.makeKeyAndVisible()
       
        return true
    }
}

