//
//  RelayAppDescriptionView.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/08.
//

import UIKit
import SnapKit

class RelayAboutRelayDescriptionView: UIView {
    
    private var descriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RelayLilla")
        
        return imageView
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        let content = "릴레이는 플레이리스트를 들으며 사람들과 함께 소설을 완성하는 앱입니다."
        label.numberOfLines = 2
        label.setLineHeight(text: content, lineHeight: 24.0)
        label.textAlignment = .left
        
        return label
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
            descriptionImageView,
            descriptionLabel
        ].forEach { addSubview($0) }
        
        descriptionImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(170.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(248.0)
            $0.height.equalTo(81.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionImageView.snp.bottom).offset(50.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
    }
}
