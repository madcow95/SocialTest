//
//  MainTabBarContoller.swift
//  SocialApp
//
//  Created by MadCow on 2023/11/12.
//

import UIKit

/*
     앱을 켰을 때 가장 먼저 보이는 화면
     23/11/13
     생성한 Tab Bar Controller를 연결시켜줌.
 */
class MainTabBarContoller: UITabBarController {
    
    // MARK: - LifeCycle(생명주기)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tab Bar의 배경색 설정
        tabBar.backgroundColor = .white
        
        configureViewController()
    }
    
    // MARK: - Helpers(기능구현할 함수)
    func configureViewController() {
        view.backgroundColor = .brown
        
        // #imageLiteral()하면 더블 클릭으로 이미지를 선택할 수 있음
        let feed = tabBarNavigationController(unSelected: #imageLiteral(resourceName: "home_unselected"), selected: #imageLiteral(resourceName: "home_selected"), view: FeedController(), title: "Home")
        let noty = tabBarNavigationController(unSelected: #imageLiteral(resourceName: "love"), selected: #imageLiteral(resourceName: "like_selected"), view: NotificationController(), title: "Notification")
        let imageSelector = tabBarNavigationController(unSelected: #imageLiteral(resourceName: "plus_unselected"), selected: #imageLiteral(resourceName: "add2"), view: ImageSelectionController(), title: "Image")
        let search = tabBarNavigationController(unSelected: #imageLiteral(resourceName: "search_unselected"), selected: #imageLiteral(resourceName: "search_selected"), view: SearchController(), title: "Search")
        let profile = tabBarNavigationController(unSelected: #imageLiteral(resourceName: "profile_unselected"), selected: #imageLiteral(resourceName: "profile_selected"), view: ProfileController(), title: "Profile")
        
        viewControllers = [feed, noty, imageSelector, search, profile]
    }
    
    func tabBarNavigationController(unSelected: UIImage, selected: UIImage, view: UIViewController, title: String) -> UINavigationController {
        let nav = UINavigationController(rootViewController: view)
        
        nav.tabBarItem.image = unSelected
        nav.tabBarItem.selectedImage = selected
        nav.navigationBar.tintColor = .black
        nav.tabBarItem.title = title
        
        return nav
    }
}
