//
//  DetailTableViewModuleViewController.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 10.06.2022.
//

import UIKit
import SnapKit

class DetailTableViewModuleViewController: UIViewController {
    
    private var presenter: DetailTableViewModulePresenterProtocol
    
    private lazy var descriptionLabel: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = .systemFont(ofSize: 20)
        lable.textAlignment = . center
        return lable
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(presenter: DetailTableViewModulePresenterProtocol){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        setupImageView()
        setupDescriptionLable()

        
    }
    
    private func setupDescriptionLable() {
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(100)
            make.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func setupImageView() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(250)
        }
    }
}

extension DetailTableViewModuleViewController: DetailTableViewModuleViewProtocol {
    
    func setContent(title: String, description: String, image: UIImage) {
        self.navigationItem.title = title
        descriptionLabel.text = description
        imageView.image = image
    }
    
    
}
