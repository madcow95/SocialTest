//
//  FeedController.swift
//  SocialApp
//
//  Created by MadCow on 2023/11/13.
//
// 게시글을 올리기 위한 Controller
// Main Tab의 하위이기 때문에 UIViewController를 상속받는다

/*
    UICollectionView는
    1. UITableView와 유사한 기능을 가진다.
 */

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class FeedController: UICollectionViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: Helpers
    func configureUI() {
        view.backgroundColor = .yellow
        
        // 23-11-15 UICollectionViewCell -> FeedCell로 수정
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        if Auth.auth().currentUser == nil {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(handleLogout))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        }
    }
    
    // MARK: - Actions
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
            let controller = LoginViewController()
            let navigation = UINavigationController(rootViewController: controller)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true, completion: nil)
        } catch {
            print("ERROR DEBUG: Login Fail")
        }
    }
    /*
    @objc func handleLogin() {
        
    }
    */
}


// MARK: UICollectionView DataSource
extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        
        return cell
    }
}

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        // 40은 FeedCell의 widthAndHeight에서 가져온 값이고, 첫번째 8은 위에 둘 공간, 두번째 8은 아래에 둘 공간..?
        var height = width + 8 + 40 + 8
        height += 50 // 이건 왜 이유를 안알려줄까?
        height += 60 // 이것도
        // 어쨌든 height에 값을 더한게 게시물 하나에 요소들이 들어갈 공간을 확보해주는 목적이
        return CGSize(width: width, height: height)
    }
}
