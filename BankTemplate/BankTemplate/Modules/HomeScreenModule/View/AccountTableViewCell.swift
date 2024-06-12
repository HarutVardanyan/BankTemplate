//
//  AccountTableViewCell.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/26/24.
//

import UIKit

final class AccountTableViewCell: UITableViewCell {

    // MARK: - Constants

    static let identifier = "AccountTableViewCell"
    
    enum Constans {
        enum Insets {
            static let topInset: CGFloat = 10
            static let leading: CGFloat = 30
            static let trailing: CGFloat = -30
            static let height: CGFloat = 30
        }
        enum Text{
            static let title = "Account"
        }
    }
    
    // MARK: - Visual Components
    
    let accountLabel: UILabel = {
        let label = UILabel()
        label.text = Constans.Text.title
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    let accauntNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold )
        label.textColor = .black
        
        return label
    }()
    
    // MARK: - Configuration

    public func configure(
        accauntNumberLabel: String
    ) {
        self.accauntNumberLabel.text = accauntNumberLabel

        setupSubviews()
        configureConstraints()
    }
    
    func setupSubviews() {
        selectionStyle = .none
        
        contentView.addSubviews([
            accountLabel,
            accauntNumberLabel,
        ])
    }
    
    //MARK: - Private Methods

    private func configureConstraints() {
        configureAccountLabelViewConstraints()
        configureAccountNumberLabelViewConstraints()
    }
}

extension AccountTableViewCell {
    private func configureAccountLabelViewConstraints() {
        NSLayoutConstraint.activate([
            accountLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constans.Insets.topInset
            ),
            accountLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            accountLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    
    private func configureAccountNumberLabelViewConstraints() {
        NSLayoutConstraint.activate([
            accauntNumberLabel.centerYAnchor.constraint(
                equalTo: accountLabel.centerYAnchor
            ),
            accauntNumberLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: contentView.trailingAnchor
            ),
            accauntNumberLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
}
