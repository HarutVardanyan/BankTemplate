//
//  ProfileEditingTableViewCell.swift
//  BankTemplate
//
//  Created by MacBook Pro on 6/7/24.
//

import UIKit

final class ProfileEditingTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let identifier = "ProfileEditingTableViewCell"
    
    enum Constans {
        enum Insets {
            static let topInset: CGFloat = 10
            static let leading: CGFloat = 30
            static let trailing: CGFloat = -30
            static let height: CGFloat = 30
            static let topAge: CGFloat = 63
            static let topAClientImageConstans: CGFloat = 30
            static let widthClientImageConstans: CGFloat = 100
            static let heightClientImageConstans: CGFloat = 100
        }
        enum Texts{
            static let AgeTitleLabel = "Age"
            static let AddressTitleLabel = "Address"
            static let PasswordTitleLabel = "Password"
            static let GenderTitleLabel = "Gender"
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
    
    let ageTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constans.Texts.AgeTitleLabel
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    let addressTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constans.Texts.AddressTitleLabel
        label.font = .systemFont(ofSize: 16, weight: .bold )
        label.textColor = .black
        
        return label
    }()
    
    let passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constans.Texts.PasswordTitleLabel
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    let genderTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constans.Texts.GenderTitleLabel
        label.font = .systemFont(ofSize: 16, weight: .bold )
        label.textColor = .black
        
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold )
        label.textColor = .black
        
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold )
        label.textColor = .black
        
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold )
        label.textColor = .black
        
        return label
    }()
    
    // MARK: - Configuration
    
    public func configure (
        ageLabel: Int,
        addressLabel: String,
        passwordLabel: String,
        genderLabel: String,
        nameLabel: String,
        clientImageView: String
        
    ) {
        self.ageLabel.text = String(ageLabel)
        self.addressLabel.text = addressLabel
        self.passwordLabel.text = passwordLabel
        self.genderLabel.text = genderLabel
        self.nameLabel.text = nameLabel
        self.clientImageView.image = UIImage(named: clientImageView)

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
        contentView.backgroundColor = .white
        contentView.layer.masksToBounds = false
        
        contentView.addSubviews([
            clientImageView,
            nameLabel,
            ageTitleLabel,
            addressTitleLabel,
            passwordTitleLabel,
            genderTitleLabel,
            ageLabel,
            addressLabel,
            passwordLabel,
            genderLabel
        ])
    }
    
    //MARK: - Private Methods
    
    private func configureConstraints() {
        configureClientImageViewConstraints()
        configureNameLabelConstraints()
        configureAgeTitleLabelConstraints()
        configureAddressTitleLabelConstraints()
        configurePasswordTitleLabelConstraints()
        configureGenderTitleLabelConstraints()
        configureAgeLabelConstraints()
        configureAddressLabelConstraints()
        configurePasswordLabelConstraints()
        configureGenderLabelConstraints()
    }
}

extension ProfileEditingTableViewCell {
    
    private func configureClientImageViewConstraints() {
        NSLayoutConstraint.activate([
            clientImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constans.Insets.topAClientImageConstans
            ),
            clientImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
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
            
            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            nameLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    
    private func configureAgeTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            ageTitleLabel.topAnchor.constraint(
                equalTo: clientImageView.bottomAnchor,
                constant: Constans.Insets.topAge
            ),
            ageTitleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            ageTitleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            ageTitleLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    
    private func configureAddressTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            addressTitleLabel.topAnchor.constraint(
                equalTo: ageTitleLabel.bottomAnchor,
                constant: Constans.Insets.topInset
            ),
            addressTitleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            addressTitleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            addressTitleLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    private func configurePasswordTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            passwordTitleLabel.topAnchor.constraint(
                equalTo: addressTitleLabel.bottomAnchor,
                constant: Constans.Insets.topInset
            ),
            passwordTitleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            passwordTitleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            passwordTitleLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    
    private func configureGenderTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            genderTitleLabel.topAnchor.constraint(
                equalTo: passwordTitleLabel.bottomAnchor,
                constant: Constans.Insets.topInset
            ),
            genderTitleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constans.Insets.leading
            ),
            genderTitleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            genderTitleLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    
    private func configureAgeLabelConstraints() {
        NSLayoutConstraint.activate([
            ageLabel.centerYAnchor.constraint(
                equalTo: ageTitleLabel.centerYAnchor
            ),
            ageLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            ageLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }

    private func configureAddressLabelConstraints() {
        NSLayoutConstraint.activate([
            addressLabel.centerYAnchor.constraint(
                equalTo: addressTitleLabel.centerYAnchor
            ),
            addressLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            addressLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    
    private func configurePasswordLabelConstraints() {
        NSLayoutConstraint.activate([
            passwordLabel.centerYAnchor.constraint(
                equalTo: passwordTitleLabel.centerYAnchor
            ),
            passwordLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            passwordLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
    
    private func configureGenderLabelConstraints() {
        NSLayoutConstraint.activate([
            genderLabel.centerYAnchor.constraint(
                equalTo: genderTitleLabel.centerYAnchor
            ),
            genderLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constans.Insets.trailing
            ),
            genderLabel.heightAnchor.constraint(
                equalToConstant: Constans.Insets.height
            )
        ])
    }
}
