//
//  BrowsingTitleView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/03.
//

import UIKit
import SnapKit

class BrowsingTitleView: UIView {
    var title: String
    
    private lazy var titleButton: UIButton = {
        let button = UIButton()
        
        var titleAttribute = AttributedString(title)
        titleAttribute.font = .systemFont(ofSize: 24.0, weight: .bold)
        titleAttribute.foregroundColor = .relayBlack
        
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
        
        return button
    }()
    
    private lazy var titleUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .relayPink1
        
        return view
    }()
    
    init(frame: CGRect, title: String) {
        self.title = title
        super.init(frame: frame)
        
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BrowsingTitleView {
    private func setupLayout() {
        [
            titleButton,
            titleUnderlineView
        ].forEach { addSubview($0) }
        
        titleButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        titleUnderlineView.snp.makeConstraints {
            $0.top.equalTo(titleButton.snp.bottom).offset(6.0)
            $0.leading.equalTo(titleButton.snp.leading)
            $0.trailing.equalTo(titleButton.snp.trailing)
            $0.height.equalTo(3.0)
        }
    }
}
