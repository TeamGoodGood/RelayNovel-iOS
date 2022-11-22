//
//  RelayOnboardingViewCell.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/22.
//

import UIKit
import SnapKit

class RelayOnboardingViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SwipeCell"
    
    let onboardingImageView = UIImageView()
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let descriptionStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(image: String, headline: String, subheadline: String) {
        onboardingImageView.image = UIImage(named: image)
        titleLabel.text = headline
        contentLabel.text = subheadline
    }
    
    func configure() {
        titleLabel.setFont(.display1)
        titleLabel.textColor = .black
        
        contentLabel.numberOfLines = 3
        contentLabel.setFont(.body2)
        contentLabel.textColor = .black
    }
}

extension RelayOnboardingViewCell{
    private func setupLayout(){
        [
            titleLabel,
            contentLabel,
            onboardingImageView
            
        ].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(170.0)
            $0.leading.equalToSuperview().inset(50.0)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(43.0)
            $0.leading.equalToSuperview().offset(50.0)
        }
        onboardingImageView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(105.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(116.0)
            $0.height.equalTo(125.0)
        }
    }
}
