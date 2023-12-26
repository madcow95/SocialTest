//
//  ProfileController.swift
//  SocialApp
//
//  Created by MadCow on 2023/11/13.
//
// 내 정보를 관리하기 위한 Controller

import UIKit

private let cellIdentifier = "ProfileCell"
private let headerIdentifier = "ProfileHeader"

class ProfileController: UICollectionViewController {
    // MARK: - Properties
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        collectionView.backgroundColor = .blue
//        collectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers(Functions)
}
