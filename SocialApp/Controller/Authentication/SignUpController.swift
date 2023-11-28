//
//  SignUpController.swift
//  SocialApp
//
//  Created by MadCow on 2023/11/21.
//

import UIKit

class SignUPViewController: UIViewController {
    
    // MARK: - Properties
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
    private let nickNameTextField = CustomTextField(placeHolder: "NickName")
    
    // 회원가입 버튼
    private let signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setHeight(50)
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).withAlphaComponent(0.8)
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        btn.isEnabled = false
        
        return btn
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.addSubview(addProfilePhotoButton)
        addProfilePhotoButton.centerX(inView: view)
        addProfilePhotoButton.setDimension(height: 130, width: 130)
        addProfilePhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, nickNameTextField, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: addProfilePhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: -30)
    }
    
    
    // MARK: - Actions
    @objc func handleProfile() {
        print("DEBUG: addProfilePhotoButton Tapped!!!")
    }
    
    @objc func signUpAction() {
        print("DEBUG: signup Button Tapped!!@@!!")
    }
}
