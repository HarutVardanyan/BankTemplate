//
//  TabBarController.swift
//  BankTemplate
//
//  Created by MacBook Pro on 6/5/24.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Constants

    enum Constans {
        enum Texts{
            static let homeTitle = "Home"
            static let creditTitle = "Credit"
            static let profileTitle = "Profile"
        }
        enum Images {
            static let homeImage = "Home"
            static let creditImage = "Credit"
            static let profileImage = "Profile"
        }
        enum Colors {
            static let tabBarBackColor = "TabBarBackColor"
        }
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNavVC = UINavigationController(
            rootViewController: HomeScreenViewController(id: "1")
        )
        
        let profileEditingNavVC = UINavigationController(
            rootViewController: ProfileEditingController(id: "1")
        )
        
        let creditNavVC = UINavigationController(
            rootViewController: MyCreditsController(id: "1")
        )
        
        homeNavVC.tabBarItem = UITabBarItem(
            title: Constans.Texts.homeTitle,
            image: UIImage(named: Constans.Images.homeImage),
         tag: 0
        )
        
        profileEditingNavVC.tabBarItem = UITabBarItem(
            title: Constans.Texts.profileTitle,
            image: UIImage(named: Constans.Images.profileImage),
            tag: 0
        )
        
        creditNavVC.tabBarItem = UITabBarItem(
            title: Constans.Texts.creditTitle,
            image: UIImage(named: Constans.Images.creditImage),
            tag: 0
        )
        
        viewControllers = [homeNavVC, creditNavVC, profileEditingNavVC]
    }
}
