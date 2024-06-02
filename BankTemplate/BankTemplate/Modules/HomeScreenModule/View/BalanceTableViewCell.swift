//
//  BalanceTableViewCell.swift
//  BankTemplate
//
//  Created by MacBook Pro on 6/2/24.
//

import UIKit

final class BalanceTableViewCell: UITableViewCell {

        // MARK: - Constants

        static let identifier = "BalanceTableViewCell"
        
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
        
        let balanceNameLabel: UILabel = {
            let label = UILabel()
            label.text = Constans.Text.title
            label.font = .systemFont(ofSize: 16, weight: .bold)
            label.textColor = .black
            
            return label
        }()
        
    let balanceLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .bold )
            label.textColor = .black
            
            return label
        }()
    
    // MARK: - Configuration

    public func configure (
            balanceLabel: Int
        ) {
            self.balanceLabel.text = String(balanceLabel)

            setupSubviews()
            configureConstraints()
        }
        
        func setupSubviews() {
            selectionStyle = .none
            
            contentView.addSubviews([
                balanceNameLabel,
                balanceLabel,
            ])
        }
        
        //MARK: - Private Methods

        private func configureConstraints() {
            configureBalanceNameLabelViewConstraints()
            configureBalanceLabelLabelViewConstraints()
        }
    }

    extension BalanceTableViewCell {
        private func configureBalanceNameLabelViewConstraints() {
            NSLayoutConstraint.activate([
                balanceNameLabel.topAnchor.constraint(
                    equalTo: contentView.topAnchor,
                    constant: Constans.Insets.topInset
                ),
                balanceNameLabel.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor
                ),
                balanceNameLabel.heightAnchor.constraint(
                    equalToConstant: Constans.Insets.height
                )
            ])
        }
        
        private func configureBalanceLabelLabelViewConstraints() {
            NSLayoutConstraint.activate([
                balanceLabel.centerYAnchor.constraint(
                    equalTo: balanceNameLabel.centerYAnchor
                ),
                balanceLabel.trailingAnchor.constraint(
                    lessThanOrEqualTo: contentView.trailingAnchor
                ),
                balanceLabel.heightAnchor.constraint(
                    equalToConstant: Constans.Insets.height
                )
            ])
        }
    }



