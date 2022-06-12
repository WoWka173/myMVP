//
//  DetailTableViewModulePresentor.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 10.06.2022.
//
import Foundation
import UIKit

// MARK: View -
protocol DetailTableViewModuleViewProtocol: AnyObject {
    func setContent(title: String, description: String, image: UIImage)
}

//MARK: Presentor -
protocol DetailTableViewModulePresenterProtocol: AnyObject {
    var view: DetailTableViewModuleViewProtocol? { get set }
    func viewDidLoad()
}

class DetailTableViewModulePresenter: DetailTableViewModulePresenterProtocol {
   
    weak var view: DetailTableViewModuleViewProtocol?
    private var model: Eat
    
    init(model: Eat) {
        self.model = model
    }
    
    func viewDidLoad() {
        view?.setContent(title: model.name, description: model.description, image: model.image)
    }
}
