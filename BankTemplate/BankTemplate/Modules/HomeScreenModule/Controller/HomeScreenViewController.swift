//
//  HomeScreenViewController.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/28/24.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    // MARK: - Constants
    
    let cellTypes: [CellType] = [
        .avatar, .card, .account, .balance
    ]
    
    // MARK: - Visual Components
    
    private lazy var userInfoTableView: UITableView = {
        let tabelView = UITableView()
        tabelView.separatorStyle = .none
        tabelView.backgroundColor = .white
        tabelView.showsVerticalScrollIndicator = false
        userInfoTableView.dataSource = self
        userInfoTableView.delegate = self
        
        return tabelView
    }()
    
    // MARK: - Private Propertis
    
    private var client: Client?
    let networkService = NetworkService()
    let id: String
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchClient()
        setupSubviews()
        configureSubviews()
        setupTableView()
    }
    
    // MARK: - Private Methodes
    
    private func setupSubviews() {
        view.addSubviews([
            userInfoTableView
        ])
        view.backgroundColor = .white
    }
    
    private func configureSubviews() {
        configureUserInfoTableViewConstraints ()
    }
    
    private func fetchClient() {
        self.client = networkService.fetchClients(id: id)
    }
    
    private func setupTableView() {
        
        userInfoTableView.register(
            AvatarTableViewCell.self,
            forCellReuseIdentifier:
                AvatarTableViewCell.identifier
        )
    }
}

extension HomeScreenViewController {
    private func configureUserInfoTableViewConstraints() {
        NSLayoutConstraint.activate([
            userInfoTableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
                ),
            userInfoTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 30
                ),
            userInfoTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -30
                ),
            userInfoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor
                )
        ])
    }
}


//MARK: - HomeScreenViewController + UITableViewDataSource

extension HomeScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = cellTypes[indexPath.row]
        
        switch cellType {
        case .avatar:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AvatarTableViewCell.identifier,
                for: indexPath
            ) as? AvatarTableViewCell
            else {return UITableViewCell() }
            
            cell.configure(
                clientImageView: client?.avatar ?? "",
                name: client?.name ?? ""
            )
            return cell
        default:
             return UITableViewCell()
        }
    }
}

//MARK: - HomeScreenViewController + UITableViewDelegate

extension HomeScreenViewController: UITableViewDelegate {
    
}
