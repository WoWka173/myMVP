//
//  ProfileUserModuleViewController.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 11.06.2022.
//
import SnapKit
import UIKit

class ProfileUserViewController: UIViewController {
    
    private var presenter: ProfileUserViewModulePresenterProtocol
    
    private var userImage: UIImageView = {
        let userImage = UIImageView()
        userImage.contentMode = .scaleAspectFit
        userImage.image = UIImage(imageLiteralResourceName: "User")
        return userImage
    }()
    
    private var userName: UILabel = {
        let userName = UILabel()
        userName.textColor = .black
        userName.font = .systemFont(ofSize: 20)
        userName.text = "Name: "
        return userName
    }()
    
    private var userPhone: UILabel = {
        let userPhone = UILabel()
        userPhone.textColor = .black
        userPhone.font = .systemFont(ofSize: 20)
        userPhone.text = "Phone: "
        return userPhone
    }()
    
    private var userAdress: UILabel = {
        let userAdress = UILabel()
        userAdress.textColor = .black
        userAdress.font = .systemFont(ofSize: 20)
        userAdress.text = "Email Adress: "
        return userAdress
    }()
    
    init(presenter: ProfileUserViewModulePresenterProtocol) {
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
        setupView()
        updateUserData()
        
        
    }
    //MARK: - Methods
    
    func setUserData(name: String, phone: String, adress: String, image: UIImage) {
        setDataToContent(name: name, phone: phone, adress: adress, image: image)
    }
    
    func setDataToContent(name: String, phone: String, adress: String, image: UIImage){
        userName.text = "Name: " + name
        userPhone.text = "Phone: " + phone
        userAdress.text = "Email Adress: " + adress
        userImage.image = image
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.backgroundColor = .white
        setupUserImage()
        setupUserName()
        setupUserPhone()
        setupUserAdress()
    }
    
    private func setupUserImage() {
        view.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalTo(150)
            make.top.equalToSuperview().inset(100)
            make.left.equalToSuperview().inset(25)
        }
    }
    private func setupUserName() {
        view.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(125)
            make.left.equalTo(userImage.snp.right).offset(15)
        }
    }
    private func setupUserPhone() {
        view.addSubview(userPhone)
        userPhone.snp.makeConstraints { make in
            make.top.equalTo(userImage.snp.bottom).offset(50)
            make.left.equalToSuperview().inset(50)
        }
    }
    private func setupUserAdress() {
        view.addSubview(userAdress)
        userAdress.snp.makeConstraints { make in
            make.top.equalTo(userPhone.snp.bottom).offset(50)
            make.left.equalToSuperview().inset(50)
        }
    }
}

extension ProfileUserViewController: ProfileUserViewModuleViewProtocol {
    func updateUserData() {
        presenter.getData()
    }
}
