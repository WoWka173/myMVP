//
//  CustomTabBar.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 14.06.2022.
//

import UIKit

class CustomTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar()  {
        
        tabBar.backgroundColor = .white
        
        let firstPresenter: MainTablePresenterProtocol = MainTableViewPresenter()
        let firstNC = UINavigationController(rootViewController: MainTableViewController(presenter: firstPresenter))
        
        let secondPresenter:CollectionMenuPresenterProtocol = CollectionMenuPresenter()
        let secondNC = UINavigationController(rootViewController: CollectionMenuViewController(presenter: secondPresenter))
        
        let thridPresentor: ProfileUserViewModulePresenterProtocol = ProfileUserViewModulePresentor()
        let thirdNC = UINavigationController(rootViewController: ProfileUserViewController(presenter: thridPresentor))
        
        let fourNC = UINavigationController(rootViewController: MainTableViewController(presenter: firstPresenter))
        
        viewControllers = [firstNC, secondNC, thirdNC, fourNC]
        setViewControllers([firstNC, secondNC, thirdNC, fourNC], animated: true)
        tabBar.isHidden = false
        
        firstNC.title = "Меню"
        secondNC.title = "Коллекция меню"
        thirdNC.title = "Профиль"
        fourNC.title = "Контакты"
        
        guard let items = tabBar.items else { return }
        let images = ["menucard", "menucard.fill", "brain.head.profile","phone.bubble.left"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
    }
}
