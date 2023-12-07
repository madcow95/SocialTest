//
//  SignUpController.swift
//  SocialApp
//
//  Created by MadCow on 2023/11/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    
    private var authVM = SignupViewModel()
    
    // 프로필 이미지 등록 Button
    private let addProfilePhotoButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "add2"), for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(handleProfile), for: .touchUpInside)
        
        return btn
    }()
    
    // 사용할 이메일 Text Field
    private let emailTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "Email")
        tf.keyboardType = .emailAddress
        
        return tf
    }()
    
    // 사용할 비밀번호 Text Field
    private let passwordTextField: CustomTextField = {
        let pw = CustomTextField(placeHolder: "Password")
        pw.isSecureTextEntry = true
        
        return pw
    }()
    
    private let fullNameTextField = CustomTextField(placeHolder: "Full Name")
    private let nickNameTextField = CustomTextField(placeHolder: "Nick Name")
    
    // 회원가입 버튼
    private let signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setHeight(50)
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .lightGray.withAlphaComponent(0.5)
        btn.layer.cornerRadius = 10
//        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        btn.isEnabled = false
        
        return btn
    }()
    
    private let returnToLogin: UIButton = {
        let btn = UIButton(type: .system)
        btn.setAttributedTitle(firstPart: "이미 아이디가 있으신가요?", secondPart: " 로그인 하러가기")
        btn.addTarget(self, action: #selector(returnToLoginView), for: .touchUpInside)
        return btn
    }()
    
    // TODO: 1. 남,여 radio button    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .cyan
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()
        configureObservers()
        
        view.addSubview(addProfilePhotoButton)
        addProfilePhotoButton.centerX(inView: view)
        addProfilePhotoButton.setDimension(height: 130, width: 130)
        addProfilePhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        
        view.addSubview(returnToLogin)
        returnToLogin.centerX(inView: view)
        returnToLogin.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, nickNameTextField, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: addProfilePhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: -30)
    }
    
    func configureObservers() {
        emailTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        nickNameTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    // MARK: - Actions
    @objc func handleProfile() {
        print("DEBUG: addProfilePhotoButton Tapped!!!")
    }
    
    @objc func signUpAction() {
        print("email >>> \(emailTextField.text!)")
        print("password >>> \(passwordTextField.text!)")
        print("full Name >>> \(fullNameTextField.text!)")
        print("nick name >>> \(nickNameTextField.text!)")
    }
    
    @objc func returnToLoginView() {
        let controller: UIViewController = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textChanged(sender: UITextField) {
        if sender == emailTextField {
            authVM.email = emailTextField.text
        } else if sender == passwordTextField {
            authVM.password = passwordTextField.text
        } else if sender == fullNameTextField {
            authVM.fullName = fullNameTextField.text
        } else if sender == nickNameTextField {
            authVM.nickName = nickNameTextField.text
        }
        
        updateForm()
    }
}

extension SignUpViewController: FormViewModel {
    func updateForm() {
        signUpButton.backgroundColor = authVM.buttonBackgoundColor
        signUpButton.setTitleColor(authVM.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = authVM.formIsValid
    }
}
