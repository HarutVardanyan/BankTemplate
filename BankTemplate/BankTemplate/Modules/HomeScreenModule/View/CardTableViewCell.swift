//
//  CardTableViewCell.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/26/24.
//

import UIKit

final class CardTableViewCell: UITableViewCell {
    
    // MARK: - Constants

    static let identifier = "CardTableViewCell"
    
    enum Constans {
        enum Insets {
            static let topInset: CGFloat = 10
            static let leading: CGFloat = 30
            static let trailing: CGFloat = -30
            static let height: CGFloat = 30
        }
        enum Text{
            static let cardColor = "cardBackground"
        }
    }
    
    // MARK: - Visual Components
    
    let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    let cardDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        
        return label
    }()
    
    let cardNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - Configuration
    
    public func configure(
        cardNumber: String,
        cardDates: String,
        cardName: String
    ) {
        self.cardNumberLabel.text = cardNumber
        self.cardDateLabel.text = cardDates
        self.cardNameLabel.text = cardName
        contentView.backgroundColor = UIColor(named: Constans.Text.cardColor)
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = false

        setupSubviews()
        configureConstraints()
    }
    
    func setupSubviews() {
        selectionStyle = .none
        
        contentView.addSubviews([
            cardNumberLabel,
            cardDateLabel,
            cardNameLabel
        ])
    }
    
    //MARK: - Private Methods

    private func configureConstraints() {
        configureCardNumberLabelViewConstraints()
        configureCardDateLabelConstraints()
        configureCardNameLabelConstraints()
    }
}

extension CardTableViewCell {
    private func configureCardNumberLabelViewConstraints() {
        NSLayoutConstraint.activate([
            cardNumberLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constans.Insets.topInset
            ),
            cardNumberLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            cardNumberLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            cardNumberLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    
    private func configureCardDateLabelConstraints() {
        NSLayoutConstraint.activate([
            cardDateLabel.topAnchor.constraint(
                equalTo: cardNumberLabel.bottomAnchor,
                constant: Constans.Insets.topInset
            ),
            cardDateLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            cardDateLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            cardDateLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    private func configureCardNameLabelConstraints() {
        NSLayoutConstraint.activate([
            cardNameLabel.topAnchor.constraint(
                equalTo: cardDateLabel.bottomAnchor,
                constant: Constans.Insets.topInset
            ),
            cardNameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            cardNameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            cardNameLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
}
