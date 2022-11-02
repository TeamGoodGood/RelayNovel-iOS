//
//  RelayListCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/02.
//

import UIKit
import SnapKit

class RelayListCollectionViewCell: UICollectionViewCell {
    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    private lazy var statusLabel: BasePaddingLabel = {
        let label = BasePaddingLabel()
        label.font = .systemFont(ofSize: 13.0)
        label.textColor = .white
        
        
        label.clipsToBounds = true
        label.backgroundColor = .systemPink
        label.layer.cornerRadius = 12.0
        
        return label
    }()
    
    private lazy var stepCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private lazy var relayTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        
        return label
    }()
    
    private lazy var bgmTagLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        label.sizeToFit()
        
        return label
    }()
    
    private lazy var creationTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private lazy var heartCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        label.textColor = .systemPink
        label.sizeToFit()
        
        return label
    }()
}

extension RelayListCollectionViewCell {
    func configure(_ index: Int) {
        statusLabel.text = "달리는중"
        stepCountLabel.text = "8/20 터치"
        relayTitleLabel.text = "릴레이 소설 제목입니다"
        bgmTagLabel.attributedText = setLabelwithNoteImage("#판타지 #모험 #대항해시대 #해적 #극적인")
        creationTimeLabel.text = "1일 전"
        heartCountLabel.attributedText = setLabelwithHeartImage("17")
        
        setupComponent(index)
        setupLayout()
    }
    
    private func setLabelwithNoteImage(_ text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "music.note") ?? UIImage()
        imageAttachment.bounds = CGRect(x: 0.0, y: -3.0, width: 11.0, height: 15.0)
        
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: " " + text))
        
        return attributedString
    }
    
    private func setLabelwithHeartImage(_ text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "heart.fill") ?? UIImage()
        imageAttachment.image = imageAttachment.image?.withTintColor(.systemPink)
        imageAttachment.bounds = CGRect(x: 0.0, y: -3.0, width: 17.0, height: 14.0)
        
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: " " + text))
        
        return attributedString
    }
    
    private func setupComponent(_ index: Int) {
        heartCountLabel.sizeToFit()
        bgmTagLabel.sizeToFit()
        
        if index == 0 {
            layer.addBorder([.top, .bottom], color: .systemGray6, width: 1.0)
        } else {
            layer.addBorder([.bottom], color: .systemGray6, width: 1.0)
        }
    }
    
    private func setupLayout() {
        [
            statusLabel,
            stepCountLabel,
            relayTitleLabel,
            bgmTagLabel,
            creationTimeLabel,
            heartCountLabel
        ].forEach { addSubview($0) }
        
        statusLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        stepCountLabel.snp.makeConstraints {
            $0.leading.equalTo(statusLabel.snp.trailing).offset(5.0)
            $0.centerY.equalTo(statusLabel.snp.centerY)
        }
        
        relayTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(statusLabel.snp.leading)
            $0.top.equalTo(statusLabel.snp.bottom).offset(8.0)
        }
        
        bgmTagLabel.snp.makeConstraints {
            $0.leading.equalTo(statusLabel.snp.leading)
            $0.top.equalTo(relayTitleLabel.snp.bottom).offset(10.0)
            
        }
        
        creationTimeLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20.0)
            $0.centerY.equalTo(statusLabel.snp.centerY)
        }
        
        heartCountLabel.snp.makeConstraints {
            $0.trailing.equalTo(creationTimeLabel.snp.trailing)
            $0.centerY.equalTo(bgmTagLabel.snp.centerY)
        }
    }
}
