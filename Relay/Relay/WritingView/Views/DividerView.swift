//
//  DividerView.swift
//  Relay
//
//  Created by 이창형 on 2022/11/08.
//

import UIKit
import SnapKit

class DividerView: UIView {
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [
            divider
        ].forEach { addSubview($0) }
        
        divider.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
