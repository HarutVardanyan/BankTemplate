//
//  CreditsInfoTableViewCell.swift
//  BankTemplate
//
//  Created by MacBook Pro on 6/2/24.
//

import UIKit

final class CreditsInfoTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let identifier = "CreditsInfoTableViewCell"
    
    enum Constans {
        enum Insets {
            static let topInset: CGFloat = 10
            static let leading: CGFloat = 30
            static let trailing: CGFloat = -30
            static let height: CGFloat = 30
            static let containerViewTopLeading: CGFloat = 5
            static let containerViewBottomTrealing: CGFloat = -5

        }
        enum Color{
            static let creditsTableViewColor = "CreditsTableViewColor"
        }
        enum Texts{
            static let DateLabel = "Date"
            static let AmountLabel = "Amount"
        }
    }
    
    // MARK: - Visual Components
    
    let containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let creditsIdLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = Constans.Texts.DateLabel
        label.font = .systemFont(ofSize: 16, weight: .bold )
        label.textColor = .black
        
        return label
    }()
    
    let dateNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.text = Constans.Texts.AmountLabel
        label.font = .systemFont(ofSize: 16, weight: .bold )
        label.textColor = .black
        
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold )
        label.textColor = .black
        
        return label
    }()
    
    // MARK: - Configuration
    
    public func configure (
        creditsIdLabel: String,
        dateNumberLabel: String,
        priceLabel: Int
    ) {
        self.creditsIdLabel.text = creditsIdLabel
        self.dateNumberLabel.text = dateNumberLabel
        self.priceLabel.text = "$ \(priceLabel)"
        
        setupSubviews()
        configureConstraints()
    }
    
    func setupSubviews() {
        selectionStyle = .none
        containerView.backgroundColor = UIColor(named: "PageNameColor")
        containerView.layer.cornerRadius = 35
        containerView.layer.masksToBounds = false
        contentView.backgroundColor = UIColor(named: "MyCreditsBackgrundColor")
        
        contentView.addSubviews([
            containerView
        ])
        containerView.addSubviews([
            creditsIdLabel,
            dateLabel,
            dateNumberLabel,
            amountLabel,
            priceLabel
        ])
    }
    
    //MARK: - Private Methods
    
    private func configureConstraints() {
        configureCreditsIdLabelConstraints()
        configureDateLabelConstraints()
        configureAmountLabelConstraints()
        configureContainerViewConstraints()
        configureDateNumberLabelConstraints()
        configurePriceLabelConstraints()
    }
}

extension CreditsInfoTableViewCell {
    
    private func configureContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constans.Insets.containerViewTopLeading
            ),
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.containerViewTopLeading
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.containerViewBottomTrealing
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constans.Insets.containerViewBottomTrealing
            )
        ])
    }
    
    private func configureCreditsIdLabelConstraints() {
        NSLayoutConstraint.activate([
            creditsIdLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: Constans.Insets.topInset
            ),
            creditsIdLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            creditsIdLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            creditsIdLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    
    private func configureDateLabelConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(
                equalTo: creditsIdLabel.bottomAnchor,
                constant: Constans.Insets.topInset
            ),
            dateLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            dateLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            dateLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    private func configureAmountLabelConstraints() {
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(
                equalTo: dateLabel.bottomAnchor,
                constant: Constans.Insets.topInset
            ),
            amountLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            amountLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            amountLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    private func configureDateNumberLabelConstraints() {
            NSLayoutConstraint.activate([
                dateNumberLabel.centerYAnchor.constraint(
                    equalTo: dateLabel.centerYAnchor
                ),
                dateNumberLabel.trailingAnchor.constraint(
                    equalTo: containerView.trailingAnchor,
                    constant: Constans.Insets.trailing
                ),
                dateNumberLabel.heightAnchor.constraint(
                    equalToConstant: Constans.Insets.height
                )
            ])
    }
    
    private func configurePriceLabelConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(
                equalTo: amountLabel.centerYAnchor
            ),
            priceLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            priceLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    
}

