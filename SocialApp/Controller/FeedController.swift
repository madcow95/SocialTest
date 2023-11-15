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
    }
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
        let height = width
        return CGSize(width: width, height: height)
    }
}
