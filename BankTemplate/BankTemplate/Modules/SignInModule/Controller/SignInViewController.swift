//
//  SignInViewController.swift
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
            static let topSignUpButton: CGFloat = 443
            static let leadingSignUpButton: CGFloat = 136
            static let trailingSignUpButton: CGFloat = -138
            static let bottomSignUpButton: CGFloat = -383
            static let topDontHaveLabel: CGFloat = 409
            static let leadingDontHaveLabel: CGFloat = 74
            static let trailingDontHaveLabel: CGFloat = -75
            static let bottomDontHaveLabel: CGFloat = -409
        }
        enum Texts {
            static let bankLogo = "bankLogo"
            static let textEmailBackColor = "textEmailBackColor"
            static let textColor = "textColor"
            static let emailText = "Email"
            static let emailPassword = "Password"
            static let signUpButtonColor = "signUpButtonColor"
            static let iDontHaveAccaount = "Don't have an account yet?"
            static let logIn = "Harut24@gmail.com"
            }
        enum LogInPassword {
            static let logIn = "Harut24@gmail.com"
            static let password = "123456"
            static let alert = "Please enter both email and password"
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
        textEmail.placeholder = Constants.Texts.emailText
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
        textPass.placeholder = Constants.Texts.emailPassword
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
        logButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)

        return logButton
    }()
    
    private let goSignUpButton: UIButton = {
        let signUpButton = UIButton()
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIColor(
            named: Constants.Texts.signUpButtonColor),
            for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        return signUpButton
    }()
    
    private let dontHaveLabel = {
        let label = UILabel()
        
        label.text = Constants.Texts.iDontHaveAccaount
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
        setupTextFieldDelegates()
    }
    
    //MARK: - Private Methods
    
    private func setupSubviews(){
        view.backgroundColor = UIColor(named: "signInBackColor")
        
        view.addSubview(signInLogo)
        view.addSubview(emailTextField)
        view.addSubview(passwordlTextField)
        view.addSubview(signInButton)
        view.addSubview(goSignUpButton)
        view.addSubview(dontHaveLabel)

    }
    
    @objc private func signUpButtonTapped() {
        let signUpViewController = SignUpViewController()
        signUpViewController.modalPresentationStyle = .fullScreen
        present(signUpViewController, animated: true, completion: nil)
    }
    
    @objc private func logInButtonTapped() {
        guard let email = emailTextField.text, let password = passwordlTextField.text else {
            showAlert(message: "Please enter both email and password")
            return
        }
        
        if email == Constants.LogInPassword.logIn && password == Constants.LogInPassword.password {
            
            let logInHomeScreenViewController = HomeScreenViewController(id: "1")
            logInHomeScreenViewController.modalPresentationStyle = .fullScreen
            present(logInHomeScreenViewController, animated: true, completion: nil)
        } else {
            showAlert(message: "Incorrect email or password")
        }
    }
    
    private func setupTextFieldDelegates() {
        emailTextField.delegate = self
        passwordlTextField.delegate = self
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    private func configureConstraints() {
        signInLogo.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordlTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        goSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        dontHaveLabel.translatesAutoresizingMaskIntoConstraints = false
        
        configureSignInLogoConstraints()
        configureTextFieldEmailConstraints()
        configureTextFieldPassConstraints()
        configureSignInButtonConstraints()
        configureGoSignUpButtonConstraints()
        configureDontHaveLabelConstraints()
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
    private func configureGoSignUpButtonConstraints() {
        NSLayoutConstraint.activate([
            goSignUpButton.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.Insets.topSignUpButton
        ),
            goSignUpButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leadingSignUpButton
        ),
            goSignUpButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailingSignUpButton
        ),
            goSignUpButton.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.Insets.bottomSignUpButton
        )
     ])
   }
    private func configureDontHaveLabelConstraints() {
        NSLayoutConstraint.activate([
            dontHaveLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.Insets.topDontHaveLabel
        ),
            dontHaveLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leadingDontHaveLabel
        ),
            dontHaveLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailingDontHaveLabel
        ),
            dontHaveLabel.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.Insets.bottomDontHaveLabel
        )
     ])
   }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == emailTextField {
            passwordlTextField.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
        return false
    }
}
