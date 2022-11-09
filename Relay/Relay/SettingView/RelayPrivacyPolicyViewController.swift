//
//  RelayPrivacyPolicyViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/10.
//

import UIKit
import SnapKit

class RelayPrivacyPolicyViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private let privacyPolicyLabel: UILabel = {
        let label = UILabel()
        let content = """

"""
        label.numberOfLines = 0
        label.sizeToFit()
        label.setLineHeight(text: content, lineHeight: 24.0)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        view.backgroundColor = .white
        setupLayout()
        scrollView.addSubview(privacyPolicyLabel)
    }
}

extension RelayPrivacyPolicyViewController {
    private func setupLayout() {
        [
            scrollView,
            privacyPolicyLabel
        ].forEach { view.addSubview($0) }
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview().inset(20.0)
        }
        privacyPolicyLabel.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.height.equalTo(privacyPolicyLabel)
        }
    }
}
