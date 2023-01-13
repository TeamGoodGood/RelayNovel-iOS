//
//  SelfLoginVIewController.swift
//  Relay
//
//  Created by 이창형 on 2023/01/13.
//

import UIKit
import SnapKit

class RelaySelfLoginViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.tintColor = .relayBlack
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func setupLayout() {
        [
         
        ].forEach { view.addSubview($0) }
        
//        closeButton.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(59.0)
//            $0.leading.equalToSuperview().inset(18.0)
//            $0.width.height.equalTo(26.0)
//        }
    }
}
