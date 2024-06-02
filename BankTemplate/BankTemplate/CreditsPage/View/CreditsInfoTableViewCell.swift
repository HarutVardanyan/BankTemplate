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
        self.priceLabel.text = String (priceLabel)
        
        
        
        contentView.backgroundColor = UIColor(named: Constans.Color.creditsTableViewColor)
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = false
        
        setupSubviews()
        configureConstraints()
    }
    
    func setupSubviews() {
        selectionStyle = .none
        
        contentView.addSubviews([
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
    }
}

extension CreditsInfoTableViewCell {
    private func configureCreditsIdLabelConstraints() {
        NSLayoutConstraint.activate([
            creditsIdLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constans.Insets.topInset
            ),
            creditsIdLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            creditsIdLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
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
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            dateLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
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
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            amountLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            amountLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
}


