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
    
    private let emailTextField: UITextField = {
        let et = UITextField()
        et.layer.cornerRadius = 10
        et.borderStyle = .none
        et.textColor = .white
        et.keyboardAppearance = .dark // 바로 키보드를 나오게 함.
        et.keyboardType = .emailAddress // 보여지는 키보드의 형식
        et.backgroundColor = UIColor(white: 1, alpha: 0.1) // 투명도 표시?
        et.setHeight(50)
        et.attributedPlaceholder = NSAttributedString(string: "\t이메일", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.8)])
        return et
    }()
    
    private let passwordTextField: UITextField = {
        let pt = UITextField()
        pt.layer.cornerRadius = 10
        pt.borderStyle = .none
        pt.textColor = .white
        pt.keyboardAppearance = .dark
        pt.backgroundColor = UIColor(white: 1, alpha: 0.1)
        pt.setHeight(50)
        pt.isSecureTextEntry = true // 비밀번호 설정, 복사/붙여넣기 등등 막힘
        pt.attributedPlaceholder = NSAttributedString(string: "\t비밀번호", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.8)])
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
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(mainIcon)
        mainIcon.centerX(inView: view)
        mainIcon.setDimension(height: 60, width: 80)
        mainIcon.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginBtn])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        // PaddingRight가 안먹음;;
        stackView.anchor(top: mainIcon.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 30)
    }
}
