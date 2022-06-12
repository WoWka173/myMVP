//
//  CollectionMenuViewController.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 12.06.2022.
//

import SnapKit
import UIKit

final class CollectionMenuViewController: UIViewController {
    
    //MARK: - Properties
    private var presenter: CollectionMenuPresenterProtocol
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 50
        layout.itemSize = CGSize(width: view.frame.size.width/1.5, height: view.frame.size.height/2)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCustomCell.self, forCellWithReuseIdentifier: "CollectionViewCustomCell")
        return collectionView
    }()
    
    //MARK: - Init
    init(presenter: CollectionMenuPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewDidLoad()
        self.navigationItem.title = "Коллекция Меню"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}

//MARK: - Extensions
extension CollectionMenuViewController: CollectionMenuViewProtocol {
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemGray6
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}

extension CollectionMenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfRowInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.cellForItemAt(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let navigationController = self.navigationController else { return }
        presenter.didSelectItemAt(indexPath: indexPath, navigationController)
    }
}

 

