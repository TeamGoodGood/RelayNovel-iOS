//
//  RelayLaunchScreenViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/16.
//

import UIKit
import SnapKit

class RelayLaunchScreenViewController: UIViewController {
    let gradient = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundGradient()
    }
}

extension RelayLaunchScreenViewController{
    private func backGroundGradient() {
        gradient.frame = view.bounds
        gradient.colors = [UIColor.relayPink3.cgColor, UIColor.relayPink1.cgColor]

        view.layer.insertSublayer(gradient, at: 0)
    }
}
