//
//  TabBarController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/02.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    private lazy var mainViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: RelayMainViewController())
        let image = UIImage(systemName: "flag")?.resize(newWidth: 19.0)
        let selectedImage = UIImage(systemName: "flag.fill")?.resize(newWidth: 19.0)
        let tabBarItem = UITabBarItem(
            title: "워밍업",
            image: image ?? UIImage(systemName: "flag"),
            tag: 0
        )
        
        tabBarItem.selectedImage = selectedImage
        
        viewController.view.backgroundColor = .systemBackground
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var browsingViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: RelayBrowsingViewController())
        let image = UIImage(systemName: "book")?.resize(newWidth: 23.0)
        let selectedImage = UIImage(systemName: "book.fill")?.resize(newWidth: 19.0)
        let tabBarItem = UITabBarItem(
            title: "릴레이",
            image: image ?? UIImage(systemName: "book"),
            tag: 2
        )
        
        tabBarItem.selectedImage = selectedImage
        
        viewController.view.backgroundColor = .systemBackground
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var profileViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: RelayProfileViewController())
        let image = UIImage(systemName: "person")?.resize(newWidth: 18.0)
        let selectedImage = UIImage(systemName: "person.fill")?.resize(newWidth: 19.0)
        let tabBarItem = UITabBarItem(
            title: "내 기록",
            image: image ?? UIImage(systemName: "person"),
            tag: 2
        )
        
        tabBarItem.selectedImage = selectedImage
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .systemBackground
        setupTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isFirst = checkIsFirst()
        let isLogin = !checkIsLoggedIn()
        DispatchQueue.main.asyncAfter(deadline: .now().advanced(by: .seconds(0))) { [weak self] in
            self?.changeView(isFirst: isFirst, isLogin: isLogin)
        }
    }
}

extension TabBarController {
    private func setupTabBar() {
        viewControllers = [
            mainViewController,
            browsingViewController,
            profileViewController
        ]
        
        let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11.0, weight: .bold)]
        UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .systemPink
        tabBar.layer.borderWidth = 1.0
        tabBar.layer.borderColor = UIColor.systemGray6.cgColor
    }
}

extension TabBarController {
    func changeView(isFirst: Bool, isLogin: Bool) {
        if isFirst {
            print("isfirst")
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let toRelayOnboardingView = RelayOnboardingViewController(collectionViewLayout: layout)
            toRelayOnboardingView.modalPresentationStyle = .fullScreen
            present(toRelayOnboardingView, animated: false, completion: nil)
        }
        else if isLogin {
            print("notfirst && isLogin")
        }
        else {
            print("notfirst && notLogin")
            let toRelayLoginView = RelayLoginViewController()
            toRelayLoginView.modalPresentationStyle = .fullScreen
            present(toRelayLoginView, animated: false, completion: nil)
        }
    }
    
    func checkIsFirst() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTime") == nil {
            defaults.set("No", forKey:"isFirstTime")
            return true
        } else {
            return false
        }
    }
    
    func checkIsLoggedIn() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isAutoLogin") == nil {
            defaults.set("No", forKey:"isAutoLogin")
            return true
        } else {
            return false
        }
    }
}
