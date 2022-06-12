//
//  TableViewCustomCell.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 09.06.2022.
//
import SnapKit
import UIKit

class TableViewCustomCell: UITableViewCell {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        return label
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupProductImageView()
        setupLabel()
        
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(name: String, image: UIImage) {
        label.text = name
        productImageView.image = image
    }
    
    private func setupProductImageView() {
        addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(10)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
    }
    
    private func setupLabel() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(productImageView.snp.right).offset(10)
            make.top.equalToSuperview().inset(10)
        }
    }
    
    
}
