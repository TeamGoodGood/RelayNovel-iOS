//
//  RelayMainHostingController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/03.
//

import SwiftUI
import UIKit
import SnapKit

class RelayMainViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "릴레이"
        label.textColor = UIColor.relayPink1
        label.font = UIFont(name: "CWDangamAsac-Bold", size: 20.0)
        
        return label
    }()
    
    private let bellButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "bell", withConfiguration: config)
        
        button.setImage(image, for: .normal)
        button.tintColor = .relayBlack
        
        return button
    }()
    
    private let animationView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 50, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("릴레이 시작하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        
        button.backgroundColor = UIColor.relayBlack
        
        button.layer.cornerRadius = 8
        
        button.isEnabled = true
        
        button.addTarget(self, action: #selector(goToWritingView), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.addAnimationView()
        
        setupLayout()
    }
}

extension RelayMainViewController {
    
    @objc
    func goToWritingView(_ sender: UIButton!) {
        let vc = RelayWritingViewController()
        
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func setupLayout() {
        [
            titleLabel,
            bellButton,
            animationView
            
        ].forEach { view.addSubview($0) }
        
        animationView.addSubview(submitButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        bellButton.snp.makeConstraints {
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
