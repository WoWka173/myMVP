//
//  CollectionMenuPresenter.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 12.06.2022.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol CollectionMenuViewProtocol: AnyObject {
    func setupCollectionView()
    func reloadCollectionView()
}

protocol CollectionMenuPresenterProtocol: AnyObject {
    var view: CollectionMenuViewProtocol? { get set }
    func viewDidLoad()
    func numberOfRowInSection() -> Int
    func cellForItemAt(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func didSelectItemAt(indexPath: IndexPath, _ navigationController: UINavigationController)
}

//MARK: - Presenter
final class CollectionMenuPresenter: CollectionMenuPresenterProtocol {
    
    //MARK: - Properties
    weak var view: CollectionMenuViewProtocol?
    private var service: Network?
    private var model: [Eat] = []
    
    init() {
        self.service = Network()
    }
    
    //MARK: Methods
    func viewDidLoad() {
        fetchMenuData()
        view?.setupCollectionView()
    }
    
    func numberOfRowInSection() -> Int {
        return model.count
    }
    
    func cellForItemAt(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCustomCell", for: indexPath) as! CollectionViewCustomCell
        cell.setContent(name: model[indexPath.row].name, description: model[indexPath.row].description, image: model[indexPath.row].image)
        return cell
    }
    
    func didSelectItemAt(indexPath: IndexPath, _ navigationController: UINavigationController) {
        let presenter = DetailTableViewModulePresenter(model: model[indexPath.row])
        let vc = DetailTableViewModuleViewController(presenter: presenter)
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func fetchMenuData() {
        service?.fetchEatData({ [weak self] menu in
            guard let self = self else { return }
            self.model = menu
        })
    }
}
