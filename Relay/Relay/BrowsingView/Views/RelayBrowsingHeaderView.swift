//
//  RelayBrowsingHeaderView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/03.
//

import UIKit
import SnapKit

class RelayBrowsingHeaderView: UIView {
    lazy var entireTitleView = BrowsingTitleView(frame: .zero, title: "전체")
    lazy var runningTitleView = BrowsingTitleView(frame: .zero, title: "달리는중")
    lazy var completedTitleView = BrowsingTitleView(frame: .zero, title: "완주")
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 16.0
        
        [
            entireTitleView,
            runningTitleView,
            completedTitleView
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayBrowsingHeaderView {
    private func setupLayout() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview()
        }
    }
}
