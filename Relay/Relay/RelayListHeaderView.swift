//
//  RelayListHeaderView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/01.
//

import UIKit
import SnapKit

class RelayListHeaderView: UIView {
    private lazy var listTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.text = "내가 시작한 릴레이"
        
        return label
    }()
    
    private lazy var listMenuButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.down")
        
        button.tintColor = .black
        button.setTitle("최신순", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .center
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 4.0, bottom: 0.0, right: 0.0)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayListHeaderView {
    private func setupLayout() {
        [
            listTitleLabel,
            listMenuButton
        ].forEach { addSubview($0) }
        
        listTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview().inset(21.0)
        }
        
        listMenuButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20.0)
            $0.centerY.equalTo(listTitleLabel.snp.centerY)
        }
    }
}

