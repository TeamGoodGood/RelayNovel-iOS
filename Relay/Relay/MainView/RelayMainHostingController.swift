//
//  RelayMainHostingController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/03.
//

import SwiftUI
import UIKit
import SnapKit

class RelayMainHostingController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "릴레이"
        label.textColor = UIColor.relayPink1
        label.font = UIFont(name: "CWDangamAsac-Bold", size: 20.0)
        
        return label
    }()

    private let animationView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 50, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = .white
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.addAnimationView()
        
        setupLayout()
    }
    
    private func setupLayout() {
        [
            titleLabel,
            animationView

        ].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        animationView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30.0)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    func addAnimationView() {
        let hostingController = UIHostingController(rootView: PageAnimationView())
        
        hostingController.view.frame = animationView.bounds
        hostingController.didMove(toParent: self)
        
        addChild(hostingController)
        animationView.addSubview(hostingController.view)
    }
}
