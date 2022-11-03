//
//  RelayMainHostingController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/03.
//

import UIKit
import SwiftUI
import SwiftUIPager
import SnapKit

class RelayMainHostingController: UIViewController {
    private let animationView: UIView = {
        let view = UIView()
        view.frame.size.height = 300
        view.frame.size.width = 200
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnimationView()
        setupLayout()
    }
    
    private func addAnimationView() {
        let hostingController = UIHostingController(rootView: PageAnimationView())
        
        hostingController.view.frame = animationView.bounds
        hostingController.didMove(toParent: self)
        
        addChild(hostingController)
        animationView.addSubview(hostingController.view)
    }
    
    private func setupLayout() {
        [
            animationView
            
        ].forEach { view.addSubview($0) }
        
        animationView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            
        }
        
    }
}
