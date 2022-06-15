//
//  ViewController.swift
//  UIStacView
//
//  Created by Владимир Курганов on 15.06.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    //MARK: - Properties
    
    private var numberView: ContainerView = {
        let numberView = ContainerView()
        numberView.setPlaceholder(text: "Введите номер")
        return numberView
    }()
    
    private var codeView: ContainerView = {
        let codeView = ContainerView()
        codeView.setPlaceholder(text: "Введите код")
        return codeView
    }()
    
    private lazy var doneButton: UIButton = {
        let doneButton = UIButton(type: .system)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        doneButton.setTitle("Применить", for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.layer.cornerRadius = 10
        doneButton.backgroundColor = UIColor(red: 157/255, green: 37/255, blue: 141/255, alpha: 1)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        return doneButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    //MARK: - Methods
    
    
    private func setupView() {
        setupStackView()
        setupContainerView()
        setupDoneButton()
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview()
        }
    }
    
    private func setupContainerView() {
        stackView.addArrangedSubview(numberView)
        stackView.addArrangedSubview(codeView)
        stackView.setCustomSpacing(50, after: numberView)
        stackView.setCustomSpacing(50, after: codeView)
    }
    
    private func setupDoneButton() {
        stackView.addArrangedSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
    private func showError() {
        numberView.showError(text: "Неправильный номер")
        codeView.showError(text: "Неправильный код")
    }
    
    @objc
    private func doneButtonTapped() {
        showError()
        print("doneButton Tapped")
    }
    
}


