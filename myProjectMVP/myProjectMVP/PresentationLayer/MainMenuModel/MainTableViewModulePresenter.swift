//
//  MainTableViewModulePresenter.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 09.06.2022.
//
import UIKit
import Foundation

protocol MainTableViewModuleViewProtocol: AnyObject {
    func setupTableView()
    func reloadTableView()
}

protocol MainTableViewModulePresenterProtocol: AnyObject {
    var view: MainTableViewModuleViewProtocol? { get set }
    func viewDidLoad()
    func numberOfRowInSection() -> Int
    func cellForRow(_ tableView: UITableView, cellForRow indexPath: IndexPath) -> UITableViewCell
    func didSelectRowAt(indexPath: IndexPath, _ navigationController: UINavigationController)
}

class MainTableViewModulePresenter: MainTableViewModulePresenterProtocol {
   
    weak var view: MainTableViewModuleViewProtocol?
    private var service: Network?
    private var model: [Eat] = []
    
    init() {
        self.service = Network()
    }
    
    func viewDidLoad() {
        fetchEat()
        view?.setupTableView()
    }
    
    func cellForRow(_ tableView: UITableView, cellForRow indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCustomCell", for: indexPath) as! TableViewCustomCell
        cell.accessoryType = .disclosureIndicator
        cell.setContent(name: model[indexPath.row].name, image: model[indexPath.row].image)
        return cell
    }
    
    func numberOfRowInSection() -> Int {
        return model.count
    }
    
    func didSelectRowAt(indexPath: IndexPath, _ navigationController: UINavigationController) {
        let presenter = DetailTableViewModulePresenter(model: model[indexPath.row])
        let vc = DetailTableViewModuleViewController(presenter: presenter)
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func fetchEat() {
        service?.fetchEatData { [ weak self ] eats in
            self?.model = eats
        }
    }
}
