//
//  User.swift
//  SocialApp
//
//  Created by MadCow on 2023/12/13.
//

import Foundation
import Firebase

struct User {
    let email: String
    var fullName: String
    var profileImageUrl: String
    var nickName: String
    let uid: String
    
    var stats: UserStats
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.nickName = dictionary["nickName"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        // self.fcmToken = dictionary["fcmToken"] as? String ?? ""
        
        self.stats = UserStats(followers: 0, followings: 0, postCount: 0)
    }
}

struct UserStats {
    let followers: Int
    let followings: Int
    let postCount: Int
}
