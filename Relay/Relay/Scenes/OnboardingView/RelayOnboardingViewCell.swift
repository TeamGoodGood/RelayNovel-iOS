//
//  RelayOnboardingViewCell.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/22.
//

import UIKit
import SnapKit

class SwipeCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SwipeCell"
    
    let onboardingImageView = UIImageView()
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let descriptionStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
//    func configure() {
//        backgroundColor = .systemBackground
//
//        peopleImageView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(peopleImageView)
//
//        headlineLabel.textAlignment = .center
//        headlineLabel.font = UIFont.preferredFont(forTextStyle: .headline)
//        headlineLabel.textColor = .label
//        headlineLabel.numberOfLines = 0
//
//        subheadlineLabel.textAlignment = .center
//        subheadlineLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
//        subheadlineLabel.textColor = .secondaryLabel
//        subheadlineLabel.numberOfLines = 0
//
//        descriptionStackView.addArrangedSubview(headlineLabel)
//        descriptionStackView.addArrangedSubview(subheadlineLabel)
//
//        descriptionStackView.axis = .vertical
//        descriptionStackView.spacing = 10
//        descriptionStackView.alignment = .center
//        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        addSubview(descriptionStackView)
//
//        NSLayoutConstraint.activate([
//            peopleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
//            peopleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            peopleImageView.widthAnchor.constraint(equalToConstant: 333),
//            peopleImageView.heightAnchor.constraint(equalToConstant: 229),
//
//            descriptionStackView.topAnchor.constraint(equalTo: peopleImageView.bottomAnchor, constant: 100),
//            descriptionStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            descriptionStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            descriptionStackView.heightAnchor.constraint(equalToConstant: 80)
//        ])
//    }
    
}

extension SwipeCell{
    private func setupLayout(){
        [
            titleLabel,
            contentLabel,
            onboardingImageView
            
        ].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(160.0)
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

