//
//  ProfileEditingController.swift
//  BankTemplate
//
//  Created by MacBook Pro on 6/7/24.
//

import UIKit

final class ProfileEditingController: UIViewController {
    
    // MARK: - Constants
        
    enum Constants {
        enum Insets {
            static let top: CGFloat = 23
            static let leading: CGFloat = 30
            static let trailing: CGFloat = -30
            static let topPageLabel: CGFloat = 55
            static let heightPageLabel: CGFloat = 41
            static let topAClientImageConstans: CGFloat = 30
            static let widthClientImageConstans: CGFloat = 100
            static let heightClientImageConstans: CGFloat = 100
        }
        enum Color {
            static let creditsBackgrundColor = "MyCreditsBackgrundColor"
            static let pageNameColor = "PageNameColor"
        }
        enum Texts {
            static let pagenaameText = "My Credits"
        }
    }
    
    // MARK: - Visual Components
    
    private lazy var profileEditTableView: UITableView = {
        let tabelView = UITableView()
        tabelView.separatorStyle = .none
        tabelView.backgroundColor = .clear
        tabelView.showsVerticalScrollIndicator = false
        tabelView.isScrollEnabled = false
        tabelView.dataSource = self
        tabelView.delegate = self
        
        return tabelView
    }()
    
    let clientImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Constants.Insets.widthClientImageConstans / 2

        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
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
        
        setupSubviews()
        configureSubviews()
        fetchClient()
        setupTableView()
        updateUI(with: client!)
    }
    
    // MARK: - Private Methodes
    
    private func setupSubviews() {
        view.addSubviews([
            profileEditTableView,
            clientImageView,
            nameLabel,
        ])
        view.backgroundColor = .white
    }
    
    private func configureSubviews() {
        configureProfileEditingTableViewConstraints ()
        configureClientImageViewConstraints()
        configureNameLabelConstraints()
    }
    
    private func fetchClient() {
        client = networkService.fetchClients(id: id)
    }
    
    private func updateUI(with client: Client) {
            self.client = client
            nameLabel.text = client.name
            if let avatarImage = UIImage(named: client.avatar) {
                clientImageView.image = avatarImage
            } else {
                clientImageView.image = UIImage(systemName: "person.circle") // Default image if avatar not found
            }
            profileEditTableView.reloadData()
        }
    
    private func setupTableView() {
        
        profileEditTableView.register(
            ProfileEditingTableViewCell.self,
            forCellReuseIdentifier:
                ProfileEditingTableViewCell.identifier
        )
    }
    
    
}

extension ProfileEditingController {
    private func configureProfileEditingTableViewConstraints() {
        NSLayoutConstraint.activate([
            profileEditTableView.topAnchor.constraint(
                equalTo: clientImageView.bottomAnchor,
                constant: Constants.Insets.top
                ),
            profileEditTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leading
                ),
            profileEditTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailing
                ),
            profileEditTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor
                )
        ])
    }
    
    private func configureClientImageViewConstraints() {
        NSLayoutConstraint.activate([
            clientImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Insets.topAClientImageConstans
            ),
            clientImageView.leadingAnchor.constraint(
                equalTo: profileEditTableView.leadingAnchor,
                constant: Constants.Insets.leading
            ),
            clientImageView.widthAnchor.constraint(
                equalToConstant: Constants.Insets.widthClientImageConstans
            ),
            clientImageView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.heightClientImageConstans
            )
        ])
    }
    
    private func configureNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(
                equalTo: clientImageView.centerYAnchor
            ),
            
            nameLabel.trailingAnchor.constraint(
                equalTo: profileEditTableView.trailingAnchor,
                constant: Constants.Insets.trailing
            ),
            nameLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.leading
            )
        ])
    }
    
    
}

//MARK: - MyCredits + UITableViewDataSource

extension ProfileEditingController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileEditingTableViewCell.identifier,
                for: indexPath
            ) as? ProfileEditingTableViewCell
            else {return UITableViewCell() }
        
        guard let client = client else {
            return UITableViewCell()
        }

        cell.configure(
            ageLabel: Int(client.Age),
            addressLabel: client.Address,
            passwordLabel: client.Password,
            genderLabel: client.Gender
            )
            return cell
        }
    }

//MARK: - MyCredits + UITableViewDelegate
    
extension ProfileEditingController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 1
        }
    }
