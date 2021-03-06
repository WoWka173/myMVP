//
//  ViewController.swift
//  myProjectMVP
//
//  Created by Владимир Курганов on 09.06.2022.
//

import UIKit

class MainTableViewController: UIViewController {
    
    //MARK: - Properties
    private var presenter: MainTablePresenterProtocol
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCustomCell.self, forCellReuseIdentifier: "TableViewCustomCell")
        return tableView
    }()
    
    //MARK: - Init
    init(presenter: MainTablePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewDidLoad()
        self.navigationItem.title = "Меню"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

}

//MARK - MainTableViewProtocol
extension MainTableViewController: MainTableViewProtocol {
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func reloadTableView() {
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension MainTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.cellForRow(tableView, cellForRow: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let naviGationController = self.navigationController else { return }
        presenter.didSelectRowAt(indexPath: indexPath, naviGationController)
    }
    
}
