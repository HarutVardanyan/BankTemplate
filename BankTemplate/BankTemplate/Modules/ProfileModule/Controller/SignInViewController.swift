//
//  ViewController.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/17/24.
//

import UIKit

/// Ekran Dlya Vxoda prilajenii

final class SignInViewController: UIViewController {
    
    // MARK: - Constants
    
    enum Constants {
        enum Insets {
            static let topSignInLogo: CGFloat = 143
            static let bottomtextFieldEmail: CGFloat = 141
            static let leadingSignInLogo: CGFloat = 39
            static let trailingSignInLogo: CGFloat = -40
            static let heightSignInLogo: CGFloat = 243
            static let heightTextFieldEmail: CGFloat = 50
            static let bottomTextFieldPass: CGFloat = 30
            static let topSignInButton: CGFloat = 58
            static let trailingSignInButton: CGFloat = -103
            static let leadingSignInButton: CGFloat = 102
            static let heightSignInButton: CGFloat = 48
        }
        enum Texts {
            static let bankLogo = "bankLogo"
            static let textEmailBackColor = "textEmailBackColor"
            static let textColor = "textColor"
            static let emailText = "Email"
            static let emailPassword = "Password"
            }
    }
    
    //MARK: - Visual Components
    
    private let signInLogo = {
        let signImage = UIImageView()
        
        signImage.image = UIImage(named: Constants.Texts.bankLogo)
        
        return signImage
    }()
    
    private let emailTextField = {
        let textEmail = UITextField()
        
        textEmail.backgroundColor = UIColor(named: Constants.Texts.textEmailBackColor)
        textEmail.text = Constants.Texts.emailText
        textEmail.textColor = UIColor(named: Constants.Texts.textColor)
        textEmail.font = UIFont.systemFont(ofSize: 21)
        textEmail.borderStyle = .roundedRect
        textEmail.layer.cornerRadius = 25
        textEmail.layer.masksToBounds = true
        
        return textEmail
    }()
    
    private let passwordlTextField = {
        let textPass = UITextField()
        
        textPass.backgroundColor = UIColor(named: Constants.Texts.textEmailBackColor)
        textPass.text = Constants.Texts.emailPassword
        textPass.textColor = UIColor(named: Constants.Texts.textColor)
        textPass.font = UIFont.systemFont(ofSize: 21)
        textPass.borderStyle = .roundedRect
        textPass.layer.cornerRadius = 25
        textPass.layer.masksToBounds = true

        return textPass
    }()
    
    private let signInButton = {
        let logButton = UIButton()
        
        logButton.setTitle("Sign In", for: .normal)
        logButton.setTitleColor(UIColor(named: "buttonTitleColor"), for: .normal)
        logButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)

        return logButton
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        configureConstraints()
    }
    
    //MARK: - Private Methods
    
    private func setupSubviews(){
        view.backgroundColor = UIColor(named: "signInBackColor")
        
        view.addSubview(signInLogo)
        view.addSubview(emailTextField)
        view.addSubview(passwordlTextField)
        view.addSubview(signInButton)

    }
    
    private func configureConstraints() {
        signInLogo.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordlTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        configureSignInLogoConstraints()
        configureTextFieldEmailConstraints()
        configureTextFieldPassConstraints()
        configureSignInButtonConstraints()
    }
}

extension SignInViewController{
    
    private func configureSignInLogoConstraints() { NSLayoutConstraint.activate([
        signInLogo.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: Constants.Insets.topSignInLogo
        ),
        signInLogo.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: Constants.Insets.leadingSignInLogo
        ),
        signInLogo.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: Constants.Insets.trailingSignInLogo
        ),
        signInLogo.heightAnchor.constraint(
            equalToConstant: Constants.Insets.heightSignInLogo
        )
     ])
   }
    private func configureTextFieldEmailConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(
                equalTo: signInLogo.bottomAnchor,
                constant: Constants.Insets.bottomtextFieldEmail
        ),
            emailTextField.leadingAnchor.constraint(
                equalTo: signInLogo.leadingAnchor,
                constant: Constants.Insets.leadingSignInLogo
        ),
            emailTextField.trailingAnchor.constraint(
                equalTo: signInLogo.trailingAnchor,
                constant: Constants.Insets.trailingSignInLogo
        ),
            emailTextField.heightAnchor.constraint(
                equalToConstant: Constants.Insets.heightTextFieldEmail
        )
     ])
   }
    private func configureTextFieldPassConstraints() {
        NSLayoutConstraint.activate([
            passwordlTextField.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor,
                constant: Constants.Insets.bottomTextFieldPass
        ),
            passwordlTextField.leadingAnchor.constraint(
                equalTo: signInLogo.leadingAnchor,
                constant: Constants.Insets.leadingSignInLogo
        ),
            passwordlTextField.trailingAnchor.constraint(
                equalTo: signInLogo.trailingAnchor,
                constant: Constants.Insets.trailingSignInLogo
        ),
            passwordlTextField.heightAnchor.constraint(
                equalToConstant: Constants.Insets.heightTextFieldEmail
        )
     ])
   }
    private func configureSignInButtonConstraints() {
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(
                equalTo: passwordlTextField.bottomAnchor,
                constant: Constants.Insets.topSignInButton
        ),
            signInButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leadingSignInButton
        ),
            signInButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailingSignInButton
        ),
            signInButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.heightSignInButton
        )
     ])
   }
}

