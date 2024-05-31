//
//  SignUpViewController.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/23/24.
//
import UIKit

/// Ekran Dlya Registracii

final class SignUpViewController: UIViewController {
    
    // MARK: - Constants
    
    enum Constants {
        enum Insets {
            static let topSignUpLogo: CGFloat = 143
            static let bottomtextFieldEmail: CGFloat = 141
            static let leadingSignUpLogo: CGFloat = 39
            static let trailingSignUpLogo: CGFloat = -40
            static let heightSignUpLogo: CGFloat = 243
            static let heightTextFieldEmail: CGFloat = 50
            static let bottomTextFieldPass: CGFloat = 30
            static let topSignUpButton: CGFloat = 58
            static let trailingSignUpButton: CGFloat = -103
            static let leadingSignUpButton: CGFloat = 102
            static let heightSignUpButton: CGFloat = 48
            static let topSignInButton: CGFloat = 443
            static let leadingSignInButton: CGFloat = 136
            static let trailingSignInButton: CGFloat = -138
            static let bottomSignInButton: CGFloat = -383
            static let topHaveLabel: CGFloat = 409
            static let leadingHaveLabel: CGFloat = 74
            static let trailingHaveLabel: CGFloat = -75
            static let bottomHaveLabel: CGFloat = -409
        }
        enum Texts {
            static let signUpPhoto = "signUpImage"
            static let textEmailBackColor = "textFildColor"
            static let textColor = "textFildTextColor"
            static let emailText = "Email"
            static let emailPassword = "Password"
            static let signInButtonColor = "signUpButtonColor"
            static let iHaveAccaount = "Already have an account?"
            }
    }
    
    //MARK: - Visual Components
    
    private let signUpLogo = {
        let signImage = UIImageView()
        
        signImage.image = UIImage(named: Constants.Texts.signUpPhoto)
        
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
    
    private let signUpButton = {
        let logButton = UIButton()
        
        logButton.setTitle("Sign Up", for: .normal)
        logButton.setTitleColor(UIColor(named: "buttonTitleColor"), for: .normal)
        logButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)

        return logButton
    }()
    
    private let goSignInButton: UIButton = {
        let signInButton = UIButton()
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(UIColor(
            named: Constants.Texts.signInButtonColor),
            for: .normal)
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        return signInButton
    }()
    
    private let haveLabel = {
        let label = UILabel()
        
        label.text = Constants.Texts.iHaveAccaount
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        configureConstraints()
    }
    
    //MARK: - Private Methods
    
    private func setupSubviews(){
        view.addSubviews([
        
            signUpLogo,
            emailTextField,
            passwordlTextField,
            signUpButton,
            goSignInButton,
            haveLabel
        ])
        view.backgroundColor = UIColor(named: "singnUpBackColor")
    }
    
    @objc private func signInButtonTapped() {
        let signInViewController = SignInViewController()
        signInViewController.modalPresentationStyle = .fullScreen
        present(signInViewController, animated: true, completion: nil)
    }
    
    private func configureConstraints() {

        configureSignUpLogoConstraints()
        configureTextFieldEmailConstraints()
        configureTextFieldPassConstraints()
        configureSignUpButtonConstraints()
        configureGoSignInButtonConstraints()
        configureHaveLabelConstraints()
    }
}

extension SignUpViewController{
    
    private func configureSignUpLogoConstraints() { NSLayoutConstraint.activate([
        signUpLogo.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: Constants.Insets.topSignUpLogo
        ),
        signUpLogo.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: Constants.Insets.leadingSignUpLogo
        ),
        signUpLogo.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: Constants.Insets.trailingSignUpLogo
        ),
        signUpLogo.heightAnchor.constraint(
            equalToConstant: Constants.Insets.heightSignUpLogo
        )
     ])
   }
    private func configureTextFieldEmailConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(
                equalTo: signUpLogo.bottomAnchor,
                constant: Constants.Insets.bottomtextFieldEmail
        ),
            emailTextField.leadingAnchor.constraint(
                equalTo: signUpLogo.leadingAnchor,
                constant: Constants.Insets.leadingSignUpLogo
        ),
            emailTextField.trailingAnchor.constraint(
                equalTo: signUpLogo.trailingAnchor,
                constant: Constants.Insets.trailingSignUpLogo
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
                equalTo: signUpLogo.leadingAnchor,
                constant: Constants.Insets.leadingSignUpLogo
        ),
            passwordlTextField.trailingAnchor.constraint(
                equalTo: signUpLogo.trailingAnchor,
                constant: Constants.Insets.trailingSignUpLogo
        ),
            passwordlTextField.heightAnchor.constraint(
                equalToConstant: Constants.Insets.heightTextFieldEmail
        )
     ])
   }
    private func configureSignUpButtonConstraints() {
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(
                equalTo: passwordlTextField.bottomAnchor,
                constant: Constants.Insets.topSignUpButton
        ),
            signUpButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leadingSignUpButton
        ),
            signUpButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailingSignUpButton
        ),
            signUpButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.heightSignUpButton
        )
     ])
   }
    private func configureGoSignInButtonConstraints() {
        NSLayoutConstraint.activate([
            goSignInButton.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.Insets.topSignInButton
        ),
            goSignInButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leadingSignInButton
        ),
            goSignInButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailingSignInButton
        ),
            goSignInButton.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.Insets.bottomSignInButton
        )
     ])
   }
    private func configureHaveLabelConstraints() {
        NSLayoutConstraint.activate([
            haveLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.Insets.topHaveLabel
        ),
            haveLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leadingHaveLabel
        ),
            haveLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailingHaveLabel
        ),
            haveLabel.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.Insets.bottomHaveLabel
        )
     ])
   }
}

