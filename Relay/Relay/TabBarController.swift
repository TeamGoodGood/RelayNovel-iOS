//
//  TabBarController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/02.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    private lazy var relayMainViewController: UIViewController = {
        //TODO: RelayMainViewController 구현 후 변경
        let viewController = UINavigationController(rootViewController: UIViewController())
        let tabBarItems = UITabBarItem(
            title: "워밍업",
            image: nil,
            tag: 0
        )
        
        viewController.tabBarItem = tabBarItems
        
        return viewController
    }()
    
    private lazy var relayBrowsingViewController: UIViewController = {
        //TODO: RelayBrowsingViewController 구현 후 변경
        let viewController = UINavigationController(rootViewController: UIViewController())
        let tabBarItems = UITabBarItem(
            title: "릴레이",
            image: nil,
            tag: 2
        )
        
        viewController.tabBarItem = tabBarItems
        
        return viewController
    }()
    
    private lazy var relayProfileViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: RelayProfileViewController())
        let tabBarItems = UITabBarItem(
            title: "내 기록",
            image: nil,
            tag: 2
        )
        
        viewController.tabBarItem = tabBarItems
        
        return viewController
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
