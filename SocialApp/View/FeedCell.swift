//
//  FeedCell.swift
//  SocialApp
//
//  Created by MadCow on 2023/11/15.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: Properties
    
    private let profileImageView: UIImageView = {
        let pf = UIImageView()
        pf.contentMode = .scaleAspectFill // 이미지가 화면에 가득차게 할지 ...할지 결정
        pf.clipsToBounds = true
        pf.isUserInteractionEnabled = true // 버튼 눌렀을 때 작동할지 말지
        pf.image = #imageLiteral(resourceName: "boston-feat")
        return pf
    }()
    
    // 이미지를 터치했을 때 interaction이 있어아 하기 때문에 UILabel -> UIButton으로 수정
    private lazy var userName: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("MadCow", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(tabbed), for: .touchUpInside) // Button을 터치했을 때
        return btn
    }()
    
    private let feedImage: UIImageView = {
        let fd = UIImageView()
        fd.contentMode = .scaleAspectFill
        fd.clipsToBounds = true
        fd.isUserInteractionEnabled = true
        fd.image = #imageLiteral(resourceName: "boston-feat")
        return fd
    }()
    
    private lazy var likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "love"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private lazy var captionButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "speech-bubble"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private lazy var shareButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "send"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private let likesLabel: UILabel = {
        let lb = UILabel()
        lb.text = "7 Likes"
        lb.font = UIFont.boldSystemFont(ofSize: 13)
        lb.textColor = .black
        return lb
    }()
    
    private let captionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "빨리 퇴사하고싶다."
        lb.font = UIFont.boldSystemFont(ofSize: 13)
        lb.textColor = .black
        return lb
    }()
    
    private let timeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "2 months later"
        lb.font = UIFont.boldSystemFont(ofSize: 13)
        lb.textColor = .black
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        // Profile Image
        addSubview(profileImageView) // addSubView 이후에는 layout을 '반드시' 잡아줘야한다.
        let widthAndHeight = 40.0
        profileImageView.setDimension(height: widthAndHeight, width: widthAndHeight)
        profileImageView.layer.cornerRadius = widthAndHeight / 2 // 정사각형 / 2는 원이다.
        
        // User Name Label
        addSubview(userName)
        userName.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 10)
        
        // Feed Image
        addSubview(feedImage)
        feedImage.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        feedImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        // Like Button, Caption Button, Share Button
        configureButtons()
        
        // Likes Count Label
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        
        // Caption Label
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        // Upload Date Label
        addSubview(timeLabel)
        timeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
    
    // 아직까지는 굳이 알아둘 필요는 없다..?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helpers
    @objc func tabbed() {
        // TODO: 해당 user의 홈 피드로 이동
        print("tabbed!!")
    }
    
    func configureButtons() {
        let stackView = UIStackView(arrangedSubviews: [likeButton, captionButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: feedImage.bottomAnchor, width: 120, height: 50)
    }
}
