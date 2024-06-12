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
    
   static let identifier = "AvatarTableViewCell"
    
    enum Constans {
        enum Insets {
            static let topAClientImageConstans: CGFloat = 30
            static let leadingClientImageConstans: CGFloat = 15
            static let widthClientImageConstans: CGFloat = 100
            static let heightClientImageConstans: CGFloat = 100
            static let leadingClientNameLabelConstans: CGFloat = 20
            static let trailingClientNameLabelConstans: CGFloat = -15
            static let heightClientNameLabelConstans: CGFloat = 40
        }
    }
    
    // MARK: - Visual Components
    
    let clientImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    // MARK: - Configuration
    
    public func configure(
        clientImageView: String,
        name: String
    ) {
        self.clientImageView.image = UIImage(named: clientImageView)
        self.nameLabel.text = name

        setupSubviews()
        configureConstraints()
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            clientImageView.layer.cornerRadius = clientImageView.frame.width / 2
            clientImageView.clipsToBounds = true
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
                    constant: Constans.Insets.topAClientImageConstans
                ),
                clientImageView.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: Constans.Insets.leadingClientImageConstans
                ),
                clientImageView.widthAnchor.constraint(
                    equalToConstant: Constans.Insets.widthClientImageConstans
                ),
                clientImageView.heightAnchor.constraint(
                    equalToConstant: Constans.Insets.heightClientImageConstans
                )
            ])
        }
        
        private func configureNameLabelConstraints() {
            NSLayoutConstraint.activate([
                nameLabel.centerYAnchor.constraint(
                    equalTo: clientImageView.centerYAnchor
                ),
                nameLabel.leadingAnchor.constraint(
                    equalTo: clientImageView.trailingAnchor,
                    constant: Constans.Insets.leadingClientNameLabelConstans
                ),
                nameLabel.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: Constans.Insets.trailingClientNameLabelConstans
                ),
                nameLabel.heightAnchor.constraint(
                    equalToConstant: Constans.Insets.heightClientNameLabelConstans
                )
            ])
        }
    }
