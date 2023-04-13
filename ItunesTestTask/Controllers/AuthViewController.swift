//
//  AuthViewController.swift
//  ItunesTestTask
//
//  Created by Vladlens Kukjans on 07/03/2023.
//

import UIKit

class AuthViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "LogIn"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.placeholder = "Enter email"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var  signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.2824391723, blue: 0.53539747, alpha: 1)
        button.setTitle("SignUP", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("SignIN", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var textFieldsStackView = UIStackView()
    private var buttonsStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupDelegate()
        setConstraints()
        registerKeyboardNotification()
        
        
        
    }
    
    deinit {
        removeKeyboardNotification()
    }
    
    private func setupViews() {
        title = "SignIn"
        view.backgroundColor = .white
        
        textFieldsStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField],
                                          axis: .vertical,
                                          spacing: 10,
                                          distribution: .fillProportionally)
        
        buttonsStackView = UIStackView(arrangedSubviews: [signInButton, signUpButton],
                                       axis: .horizontal,
                                       spacing: 10,
                                       distribution: .fillEqually)
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(textFieldsStackView)
        backgroundView.addSubview(loginLabel)
        backgroundView.addSubview(buttonsStackView)
        
    }
    
    private func setupDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc private func signUpButtonTapped() {
        let signUpViewController = SignUpViewController()
        self.present(signUpViewController, animated: true)
    }
    
    @objc private func signInButtonTapped() {
        
//        let mail = emailTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
//        let user = findUserDataBase(mail: mail)
//
//        if user == nil {
//            loginLabel.text = "User not found"
//            loginLabel.textColor = .red
//
//        } else if user?.password == password {
//
//            let navVC = UINavigationController(rootViewController: AlbumsViewController())
//            navVC.modalPresentationStyle = .fullScreen
//            self.present(navVC, animated: true)
//
//            guard let activeUser = user else {return}
//            DataBase.shared.saveActiveUser(user: activeUser)
//
//        } else {
//            loginLabel.text = "Wrong password"
//            loginLabel.textColor = .red
//        }
        let navVC = UINavigationController(rootViewController: AlbumsViewController())
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
        
        
    }
    // checking user in our database, true email existance
     private func findUserDataBase(mail: String) -> Users? {
            let dataBase = DataBase.shared.users
            print(dataBase)
         
         for user in dataBase {
             if user.email == mail {
                 return user
             }
         }
         return nil
    }
}

//MARK: - UITextFieldDelegate

extension AuthViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}

//MARK: - Will hide and bring back our keybourd 
extension AuthViewController {
    
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    @objc private func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        guard let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 2)
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentOffset = CGPoint.zero
    }
}
    
    //MARK: - SetConstraints
    
    extension AuthViewController {
        
        private func setConstraints() {
            
            NSLayoutConstraint.activate([
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
            
            NSLayoutConstraint.activate([
                backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
                backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
            
            NSLayoutConstraint.activate([
                textFieldsStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                textFieldsStackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
                textFieldsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
                textFieldsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
            ])
            
            NSLayoutConstraint.activate([
                loginLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                loginLabel.bottomAnchor.constraint(equalTo: textFieldsStackView.topAnchor, constant: -30),
            ])
            
            NSLayoutConstraint.activate([
                signUpButton.heightAnchor.constraint(equalToConstant: 40),
                signInButton.heightAnchor.constraint(equalToConstant: 40),
            ])
            
            NSLayoutConstraint.activate([
                buttonsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
                buttonsStackView.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 30),
                buttonsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            ])
        }
    }
    

