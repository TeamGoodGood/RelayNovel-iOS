//
//  RelayReadingViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/07.
//

import UIKit
import SnapKit

class RelayReadingViewController: UIViewController {
    
    private lazy var readingCoverView = RelayReadingCoverView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupLayout()
    }
}

extension RelayReadingViewController {
    private func setupLayout() {
        view.addSubview(readingCoverView)
        
        readingCoverView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(420.0)
        }
    }
}
