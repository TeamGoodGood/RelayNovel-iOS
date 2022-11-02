//
//  RelayUserActivityCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

final class RelayUserActivityCollectionViewCell: UICollectionViewCell {
    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .brown
        
        return imageView
    }()
    
    private lazy var relayActivityLabel: UILabel = {
        let label = UILabel()
        label.setFont(.body1)
        
        return label
    }()
    
    private lazy var relayActivityNumberLabel = UILabel()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .black
        
        return imageView
    }()
}

extension RelayUserActivityCollectionViewCell {
    func configure(_ index: Int, _ relayCount: Int) {
        setRelayActivityLabel(index)
        setRelayActivityNumberLabel(relayCount)
        setupLayout()
    }
    
    private func setupLayout() {
        layer.cornerRadius = 16.0
        backgroundColor = .systemGray6
        
        [
            imageView,
            relayActivityLabel,
            relayActivityNumberLabel,
            arrowImageView
        ].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(40)
            $0.height.equalTo(43.1)
        }
        
        relayActivityLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(20.0)
            $0.top.equalTo(imageView.snp.top)
        }
        
        relayActivityNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(relayActivityLabel.snp.leading)
            $0.top.equalTo(relayActivityLabel.snp.bottom).offset(4.0)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(16.0)
            $0.height.equalTo(26.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
    }
    
    private func setRelayActivityNumberLabel(_ relayCount: Int) {
        let numberAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.magenta]
        
        let countStr = "\(relayCount)"
        let postPosition = "개"
        
        let joinText = [countStr, postPosition].joined(separator: "")
        let attributedString = NSMutableAttributedString(string: joinText)
        let countRange = attributedString.mutableString.range(of: countStr)
        
        attributedString.addAttributes(numberAttributes, range: countRange)
        
        relayActivityNumberLabel.attributedText = attributedString
        relayActivityNumberLabel.setFont(.caption1)
    }
    
    private func setRelayActivityLabel(_ index: Int) {
        if index == 0 {
            relayActivityLabel.text = "내가 시작한 릴레이"
        } else if index == 1{
            relayActivityLabel.text = "내가 참여한 릴레이"
        } else {
            relayActivityLabel.text = "좋아요한 릴레이"
        }
    }
}
