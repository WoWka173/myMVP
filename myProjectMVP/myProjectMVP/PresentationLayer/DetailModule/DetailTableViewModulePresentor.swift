//
//  DetailTableViewModulePresentor.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 10.06.2022.
//
import Foundation
import UIKit

// MARK: - Protocols
protocol DetailTableViewProtocol: AnyObject {
    func setContent(title: String, description: String, image: UIImage)
}


protocol DetailTablePresenterProtocol: AnyObject {
    var view: DetailTableViewProtocol? { get set }
    func viewDidLoad()
}

//MARK: - Presenter
class DetailTablePresenter: DetailTablePresenterProtocol {
   
    //MARK: - Properties
    weak var view: DetailTableViewProtocol?
    private var model: Eat
    
    //MARK: - Init
    init(model: Eat) {
        self.model = model
    }
    
    //MARK: - Methods
    func viewDidLoad() {
        view?.setContent(title: model.name, description: model.description, image: model.image)
    }
}
