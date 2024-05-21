//
//  ViewController.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/17/24.
//

import UIKit

class ViewController: UIViewController {
    
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
    }
    //MARK: - Visual Components
    
    private let signInLogo = {
        let signImage = UIImageView()
        
        signImage.image = UIImage(named: "bankLogo")
        
        return signImage
    }()
    
    private let textFieldEmail = {
        let textEmail = UITextField()
        
        textEmail.backgroundColor = UIColor(named: "textEmailBackColor")
        textEmail.text = "Email"
        textEmail.textColor = UIColor(named: "textColor")
        textEmail.font = UIFont.systemFont(ofSize: 21)
        textEmail.borderStyle = .roundedRect
        textEmail.layer.cornerRadius = 25
        textEmail.layer.masksToBounds = true
        
        
        return textEmail
    }()
    
    private let textFieldPass = {
        let textPass = UITextField()
        
        textPass.backgroundColor = UIColor(named: "textEmailBackColor")
        textPass.text = "Password"
        textPass.textColor = UIColor(named: "textColor")
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
        view.addSubview(textFieldEmail)
        view.addSubview(textFieldPass)
        view.addSubview(signInButton)

    }
    
    private func configureConstraints() {
        signInLogo.translatesAutoresizingMaskIntoConstraints = false
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        textFieldPass.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        configureSignInLogoConstraints()
        configureTextFieldEmailConstraints()
        configureTextFieldPassConstraints()
        configureSignInButtonConstraints()
    }
}

extension ViewController{
    
    private func configureSignInLogoConstraints() { NSLayoutConstraint.activate([
        signInLogo.topAnchor.constraint(equalTo: view.topAnchor,constant: Constants.Insets.topSignInLogo
        ),
        signInLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: Constants.Insets.leadingSignInLogo
        ),
        signInLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: Constants.Insets.trailingSignInLogo
        ),
        signInLogo.heightAnchor.constraint(equalToConstant: Constants.Insets.heightSignInLogo
        )
     ])
   }
    private func configureTextFieldEmailConstraints() {
        NSLayoutConstraint.activate([
            textFieldEmail.topAnchor.constraint(equalTo: signInLogo.bottomAnchor,constant: Constants.Insets.bottomtextFieldEmail
        ),
            textFieldEmail.leadingAnchor.constraint(equalTo: signInLogo.leadingAnchor,constant: Constants.Insets.leadingSignInLogo
        ),
            textFieldEmail.trailingAnchor.constraint(equalTo: signInLogo.trailingAnchor,constant: Constants.Insets.trailingSignInLogo
        ),
            textFieldEmail.heightAnchor.constraint(equalToConstant: Constants.Insets.heightTextFieldEmail
        )
     ])
   }
    private func configureTextFieldPassConstraints() {
        NSLayoutConstraint.activate([
            textFieldPass.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor,constant: Constants.Insets.bottomTextFieldPass
        ),
            textFieldPass.leadingAnchor.constraint(equalTo: signInLogo.leadingAnchor,constant: Constants.Insets.leadingSignInLogo
        ),
            textFieldPass.trailingAnchor.constraint(equalTo: signInLogo.trailingAnchor,constant: Constants.Insets.trailingSignInLogo
        ),
            textFieldPass.heightAnchor.constraint(equalToConstant: Constants.Insets.heightTextFieldEmail
        )
     ])
   }
    private func configureSignInButtonConstraints() {
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: textFieldPass.bottomAnchor,constant: Constants.Insets.topSignInButton
        ),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: Constants.Insets.leadingSignInButton
        ),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: Constants.Insets.trailingSignInButton
        ),
            signInButton.heightAnchor.constraint(equalToConstant: Constants.Insets.heightSignInButton
        )
     ])
   }
}

