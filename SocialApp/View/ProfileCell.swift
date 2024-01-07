//
//  ProfileCell.swift
//  SocialApp
//
//  Created by MadCow on 2023/12/26.
// .

import UIKit

class ProfileCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let postImagesView: UIImageView = {
        let pi = UIImageView()
        pi.image = #imageLiteral(resourceName: "boston-feat")
        pi.contentMode = .scaleAspectFill
        pi.clipsToBounds = true // NOTE: clipsToBounds?
        return pi
    }()
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        
        addSubview(postImagesView)
        postImagesView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

