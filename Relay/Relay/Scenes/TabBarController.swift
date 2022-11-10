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
        let viewController = UINavigationController(rootViewController: RelayMainHostingController())
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

//TODO: extension 파일로 분리
extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale

        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }

        return renderImage
    }
}
