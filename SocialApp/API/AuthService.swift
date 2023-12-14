//
//  AuthService.swift
//  SocialApp
//
//  Created by MadCow on 2023/12/14.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let nickName: String
    let profileImage: UIImage
}

struct AuthService {
    static func registerUser(with credential: AuthCredentials, completion: @escaping(Error) -> Void) {
        ImageUploader.uploadImage(image: credential.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credential.email, password: credential.password) { createResult, error in
                if let error = error {
                    print("DEBUG: createUser Error: \(error.localizedDescription)")
                    return
                }
                
                guard let uid = createResult?.user.uid else { return }
                
                var data: [String: Any] = ["email": credential.email,
                                           "fullName": credential.fullName,
                                           "nickName": credential.nickName,
                                           "profileImage": credential.profileImage]
                
                Firestore.firestore().collection("users").document(uid).setData(data) { error in
                    if let error = error {
                        print("ERROR DEBUG: save data error >> \(error.localizedDescription)")
                        return
                    }
                }
            }
        }
    }
}
