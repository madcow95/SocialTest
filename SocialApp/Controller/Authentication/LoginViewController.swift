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
        et.textColor = .black
        et.keyboardAppearance = .dark // 바로 키보드를 나오게 함.
        et.keyboardType = .emailAddress // 보여지는 키보드의 형식
        et.backgroundColor = UIColor(white: 1, alpha: 0.1) // 희미도 표시?
        et.setHeight(50)
        et.placeholder = "Email"
        return et
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        configureUI()
//        view.addSubview(emailTextField)
//        emailTextField.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 30)
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .brown
        
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(mainIcon)
        mainIcon.centerX(inView: view)
        mainIcon.setDimension(height: 60, width: 80)
        mainIcon.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
    }
}
