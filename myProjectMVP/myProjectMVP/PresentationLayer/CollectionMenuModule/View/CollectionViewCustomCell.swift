//
//  CollectionViewCustomCell.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 12.06.2022.
//

import UIKit
import SnapKit

final class CollectionViewCustomCell: UICollectionViewCell {
    
    //MARK: - Properties
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.font = .systemFont(ofSize: 15)
        return nameLabel
    }()
    
    private lazy var productImage: UIImageView = {
       let productImage = UIImageView()
        productImage.contentMode = .scaleAspectFit
        productImage.clipsToBounds = true
       return productImage
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK - Methods
    func setContent(name: String, description: String, image: UIImage) {
        nameLabel.text = name
        productImage.image = image
    }
    
    private func setupCell(){
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        clipsToBounds = false
        setupProductImage()
        setupNameLabel()
    }
    
    private func setupProductImage(){
        addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(25)
            make.right.left.equalToSuperview().inset(10)
        }
    }
}
