//
//  RelayLaunchScreenViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/16.
//

import UIKit
import SnapKit

class RelayLaunchScreenViewController: UIViewController {
    private let gradient = CAGradientLayer()
    
    private let launchScreenLabel: UILabel = {
        let label = UILabel()
        
        label.text = "릴레이"
        label.font = UIFont(name: "CWDangamAsac-Bold", size: 64.0)
        label.textColor = UIColor.white
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundGradient()
        setupLayout()
    }
}

extension RelayLaunchScreenViewController{
    private func backGroundGradient() {
        gradient.frame = view.bounds
        gradient.colors = [UIColor.relayPink3.cgColor, UIColor.relayPink1.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    private func setupLayout() {
        [
            launchScreenLabel
        ].forEach { view.addSubview($0) }
        
        launchScreenLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
