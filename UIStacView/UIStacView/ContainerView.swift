//
//  ContainerView.swift
//  UIStacView
//
//  Created by Владимир Курганов on 15.06.2022.
//

import UIKit
import SnapKit

class ContainerView: UIView {

    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Введите код"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .black
        return separatorView
    }()
    
    private lazy var errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.font = UIFont.systemFont(ofSize: 14)
        errorLabel.text = "Error"
        errorLabel.textColor = .clear
        return errorLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceholder(text: String) {
        textField.placeholder = text
    }
    
    func showError(text: String) {
        errorLabel.text = text
        errorLabel.textColor = .red
        separatorView.backgroundColor = .red
    }
    
    private func configureView() {
        backgroundColor = .white
        setupTextField()
        setupSeparatorView()
        setupErrorLabel()
    }
    
    private func setupTextField() {
        addSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalToSuperview()
        }
    }
    
    private func setupSeparatorView() {
        addSubview(separatorView)
        
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(textField.snp.bottom).offset(2)
        }
    }
    
    private func setupErrorLabel() {
        addSubview(errorLabel)
        
        errorLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(separatorView.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
    }
    
    
}

