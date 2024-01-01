//
//  ProfileHeader.swift
//  SocialApp
//
//  Created by MadCow on 2023/12/26.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    private let profileImageView: UIImageView = {
        let pi = UIImageView()
        pi.image = #imageLiteral(resourceName: "boston-feat")
        pi.contentMode = .scaleAspectFill
        pi.clipsToBounds = true
        return pi
    }()
    
    private let userNameLabel: UILabel = {
        let ul = UILabel()
        ul.text = "MadCow"
        ul.font = .systemFont(ofSize: 12, weight: .bold)
        ul.textColor = .black
        return ul
    }()
    
    private let profileEditButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 편집", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 3
        btn.layer.borderColor = UIColor.green.cgColor
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        btn.addTarget(self, action: #selector(activateEditMode), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        let heightAndWidth: CGFloat = 70
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 13, paddingLeft: 13)
        profileImageView.setDimension(height: heightAndWidth, width: heightAndWidth)
        profileImageView.layer.cornerRadius = heightAndWidth / 2
        
        addSubview(userNameLabel)
        userNameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        
        addSubview(profileEditButton)
        profileEditButton.anchor(top: userNameLabel.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func activateEditMode() {
        print("DEBUG: Activate Button Tapped!!!")
    }
}
