//
//  ProfileUserPresenter.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 11.06.2022.
//

import Foundation
import UIKit

//MARK View -
protocol ProfileUserViewModuleViewProtocol: AnyObject {
    func setUserData(name: String, phone: String, adress: String, image: UIImage)
    func updateUserData()
}

//MARK Presenter -
protocol ProfileUserViewModulePresenterProtocol: AnyObject {
    var view: ProfileUserViewModuleViewProtocol? { get set }
    func viewDidLoad()
    func getData()
}

class ProfileUserViewModulePresentor: ProfileUserViewModulePresenterProtocol {
    
    weak var view: ProfileUserViewModuleViewProtocol?
    private var service: UserNetwork
    private var model: User = User(name: "", phone: "", adress: "", imageUser: UIImage(imageLiteralResourceName: "Шашлык"))
    
    init(){
        self.service = UserNetwork()
    }
    
    func viewDidLoad() {
       fetchUserData()
    }
    
    func getData() {
        view?.setUserData(name: model.name, phone: model.phone, adress: model.adress, image: model.imageUser)
    }
    
    
    private func fetchUserData() {
        service.fetchUserData({ [ weak self ] user in
            guard let self = self else { return }
            self.model = user
        })
    }
}

