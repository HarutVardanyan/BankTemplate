//
//  MyCredits.swift
//  BankTemplate
//
//  Created by MacBook Pro on 6/2/24.
//

import UIKit

final class MyCreditsController: UIViewController {
    
    // MARK: - Constants
        
    enum Constants {
        enum Insets {
            static let top: CGFloat = 23
            static let leading: CGFloat = 30
            static let trailing: CGFloat = -30
            static let topPageLabel: CGFloat = 55
            static let heightPageLabel: CGFloat = 41
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
    
    private lazy var creditsTableView: UITableView = {
        let tabelView = UITableView()
        tabelView.separatorStyle = .none
        tabelView.backgroundColor = .clear
        tabelView.showsVerticalScrollIndicator = false
        tabelView.isScrollEnabled = true
        tabelView.dataSource = self
        tabelView.delegate = self
        
        return tabelView
    }()
    
    let pageNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.pagenaameText
        label.font = .systemFont(ofSize: 25, weight: .bold )
        label.textColor = UIColor(named: Constants.Color.pageNameColor)
        
        return label
    }()
    
    // MARK: - Private Propertis
    
    private var credits: [Credit] = []
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
        fetchCredits()
        setupTableView()
    }
    
    // MARK: - Private Methodes
    
    private func setupSubviews() {
        view.addSubviews([
            creditsTableView,
            pageNameLabel
        ])
        view.backgroundColor = UIColor(named: Constants.Color.creditsBackgrundColor)
    }
    
    private func configureSubviews() {
        configureUserInfoTableViewConstraints ()
        configurePageNameLabelConstraints()
    }
    
    private func fetchCredits() {
        credits = networkService.fetchCredits(for: id)
    }
    
    private func setupTableView() {
        
        creditsTableView.register(
            CreditsInfoTableViewCell.self,
            forCellReuseIdentifier:
                CreditsInfoTableViewCell.identifier
        )
    }
}

extension MyCreditsController {
    private func configureUserInfoTableViewConstraints() {
        NSLayoutConstraint.activate([
            creditsTableView.topAnchor.constraint(
                equalTo: pageNameLabel.bottomAnchor,
                constant: Constants.Insets.top
                ),
            creditsTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leading
                ),
            creditsTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailing
                ),
            creditsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor
                )
        ])
    }
}

extension MyCreditsController {
    private func configurePageNameLabelConstraints() {
        NSLayoutConstraint.activate([
            pageNameLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.Insets.topPageLabel
            ),
            pageNameLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            pageNameLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.heightPageLabel
            )
        ])
    }
}

//MARK: - MyCredits + UITableViewDataSource

extension MyCreditsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        credits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let credit = credits[indexPath.row]

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CreditsInfoTableViewCell.identifier,
                for: indexPath
            ) as? CreditsInfoTableViewCell
            else {return UITableViewCell() }

            cell.configure(
                creditsIdLabel: credit.creditId,
                dateNumberLabel: credit.creditDate,
                priceLabel: Int(credit.creditAmount)
            )
            return cell
        }
    }

    
    //MARK: - MyCredits + UITableViewDelegate
    
extension MyCreditsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 131
        }
    }
