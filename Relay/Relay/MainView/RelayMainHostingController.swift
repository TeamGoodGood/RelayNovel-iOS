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
    
    private let bellImageView: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "bell", withConfiguration: config)
        
        imageView.image = image
        imageView.tintColor = UIColor.relayBlack
        
        return imageView
    }()

    private let animationView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 50, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        
        button.backgroundColor = UIColor.relayBlack
        
        button.layer.cornerRadius = 8
        
        button.isEnabled = false
        
        return button
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
            bellImageView,
            animationView

        ].forEach { view.addSubview($0) }
        
        animationView.addSubview(submitButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        bellImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        animationView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30.0)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        submitButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34.44)
            $0.height.equalTo(52.56)
            $0.leading.equalToSuperview().inset(15.0)
            $0.trailing.equalToSuperview().inset(15.0)
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