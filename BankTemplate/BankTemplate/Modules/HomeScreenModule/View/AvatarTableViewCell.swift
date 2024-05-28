//
//  AvatarTableViewCell.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/26/24.
//

import UIKit

/// yacheyka dlya pakaza informacii o klientax
final class AvatarTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    let identifier = "AvatarTableViewCell"
    
    enum Constans {
        enum Text{
            static let title = "customers"
        }
        
        enum Insets {
            static let topInsetImage: CGFloat = 5
            static let leadingImage: CGFloat = 5
            static let ImageHeight: CGFloat = 50
            static let imageWidt: CGFloat = 50
        }
    }
    
    // MARK: - Visual Components
    
    let clientImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    public func configure(
        clientImageView: String,
        name: String
    ) {
        self.clientImageView.image = UIImage(named: clientImageView)
        self.nameLabel.text = name

        setupSubviews()
        configureConstraints()
    }
    
    func setupSubviews() {
        selectionStyle = .none
        
        contentView.addSubviews([
            clientImageView,
            nameLabel,
        ])
    }
    
    //MARK: - Private Methods
    
    private func configureConstraints() {
        configureClientImageViewConstraints()
        configureNameLabelConstraints()
    }
}
    
// Rasshereniya dlya ustanovki razmerov i poloyuyeniy viyushek
    extension AvatarTableViewCell {
        private func configureClientImageViewConstraints() {
            NSLayoutConstraint.activate([
                clientImageView.topAnchor.constraint(
                    equalTo: contentView.topAnchor,
                    constant: Constans.Insets.topInsetImage
                ),
                clientImageView.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: Constans.Insets.leadingImage
                ),
                clientImageView.widthAnchor.constraint(
                    equalToConstant: Constans.Insets.imageWidt
                ),
                clientImageView.heightAnchor.constraint(
                    equalToConstant: Constans.Insets.ImageHeight
                )
            ])
        }
        
        private func configureNameLabelConstraints() {
            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(
                    equalTo: contentView.topAnchor,
                    constant: 100
                ),
                nameLabel.leadingAnchor.constraint(
                    equalTo: clientImageView.trailingAnchor,
                    constant: 100
                ),
                nameLabel.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: 50
                ),
                nameLabel.heightAnchor.constraint(
                    equalToConstant: 50
                )
            ])
        }
    }
