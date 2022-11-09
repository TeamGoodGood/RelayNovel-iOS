//
//  RelayTermsAndConditionsViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/10.
//

import UIKit
import SnapKit

class RelayTermsAndConditionsViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        
        return scrollView
    }()
    
    private var termsAndConditions: UILabel = {
        let label = UILabel()
        let content = ""
//        label.numberOfLines = 2
        label.setLineHeight(text: content, lineHeight: 24.0)
        label.textAlignment = .left
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.backgroundColor = .blue
        setupLayout()
        
    }
}

extension RelayTermsAndConditionsViewController {
    private func setupLayout() {
        [
            scrollView
        ].forEach { view.addSubview($0) }
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview().inset(20.0)
        }
    }
}
