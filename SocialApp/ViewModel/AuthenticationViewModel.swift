//
//  AuthenticationViewModel.swift
//  SocialApp
//
//  Created by MadCow on 2023/12/6.
//

import UIKit

protocol FormViewModel {
    func updateForm()
}

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
    var buttonBackgoundColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    // protocol Variation
    var formIsValid: Bool {
        return self.email?.isEmpty == false && self.password?.isEmpty == false
    }
    var buttonBackgoundColor: UIColor {
        return self.formIsValid ? .systemBlue : .lightGray.withAlphaComponent(0.5)
    }
    var buttonTitleColor: UIColor {
        return self.formIsValid ? .white : UIColor(white: 1, alpha: 0.7)
    }
}

struct SignupViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    var fullName: String?
    var nickName: String?
    
    // protocol Variation
    var formIsValid: Bool {
        return self.email?.isEmpty == false && self.password?.isEmpty == false && self.fullName?.isEmpty == false && self.nickName?.isEmpty == false
    }
    var buttonBackgoundColor: UIColor {
        return self.formIsValid ? .systemBlue : .lightGray.withAlphaComponent(0.5)
    }
    var buttonTitleColor: UIColor {
        return self.formIsValid ? .white : UIColor(white: 1, alpha: 0.7)
    }
}

struct ResetPasswordViewModel: AuthenticationViewModel {
    var email: String?
    
    // Protocol Properties
    var formIsValid: Bool { return email?.isEmpty == false }
    var buttonBackgoundColor: UIColor {
        return self.formIsValid ? .systemBlue : .lightGray.withAlphaComponent(0.5)
    }
    var buttonTitleColor: UIColor {
        return self.formIsValid ? .white : UIColor(white: 1, alpha: 0.7)
    }
}
