//
//  LoginViewController.swift
//  SocialApp
//
//  Created by MadCow on 2023/11/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private let mainIcon: UIImageView = {
        let mi = UIImageView(image: #imageLiteral(resourceName: "Instagram_PNG-Logo-Oksdf"))
        mi.contentMode = .scaleAspectFill // TODO: - contentMode 자세히 알아봐야할거같다.
        mi.tintColor = .white
        return mi
    }()
    
    private let emailTextField: CustomTextField = {
//        let et = CustomTextField()
        let et = CustomTextField(placeHolder: "이메일")
        et.keyboardType = .emailAddress
//        et.layer.cornerRadius = 10
//        et.borderStyle = .none
//        et.textColor = .white
//        et.keyboardAppearance = .dark // 바로 키보드를 나오게 함.
//        et.keyboardType = .emailAddress // 보여지는 키보드의 형식
//        et.backgroundColor = UIColor(white: 1, alpha: 0.1) // 투명도 표시?
//        et.setHeight(50)
//        et.attributedPlaceholder = NSAttributedString(string: "\t이메일", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.8)])
        return et
    }()
    
    private let passwordTextField: CustomTextField = {
//        let pt = UITextField()
        let pt = CustomTextField(placeHolder: "비밀번호")
        pt.isSecureTextEntry = true
//        pt.layer.cornerRadius = 10
//        pt.borderStyle = .none
//        pt.textColor = .white
//        pt.keyboardAppearance = .dark
//        pt.backgroundColor = UIColor(white: 1, alpha: 0.1)
//        pt.setHeight(50)
//        pt.isSecureTextEntry = true // 비밀번호 설정, 복사/붙여넣기 등등 막힘
//        pt.attributedPlaceholder = NSAttributedString(string: "\t비밀번호", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.8)])
        return pt
    }()
    
    private let loginBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("로그인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold) // font가 아닌 titleLabel부터
        btn.layer.cornerRadius = 10
        btn.setHeight(50)
        return btn
    }()
    
    private let forgotPasswordBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setAttributedTitle(firstPart: "비밀번호를 잊으셨나요? ", secondPart: "비밀번호 재발급")
        btn.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
        return btn
    }()
    
    private let newAccount: UIButton = {
        let btn = UIButton(type: .system)
        btn.setAttributedTitle(firstPart: "계정이 없으신가요? ", secondPart: "회원가입")
        btn.addTarget(self, action: #selector(handleNewAccount), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI() {
        // view.backgroundColor = .brown
        // 그라데이션
        configureGradientLayer()
        
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(mainIcon)
        mainIcon.centerX(inView: view)
        mainIcon.setDimension(height: 60, width: 80)
        mainIcon.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginBtn, forgotPasswordBtn])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        // PaddingRight가 안먹음;;
        stackView.anchor(top: mainIcon.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 30,
                         paddingLeft: 30,
                         paddingRight: -30)
        
        view.addSubview(newAccount)
        newAccount.centerX(inView: view)
        newAccount.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    // MARK: - Actions
    @objc func handleResetPassword() {
        print("DEBUG: Tapped forgot button")
    }
    
    @objc func handleNewAccount() {
        let controller: UIViewController = SignUPViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
