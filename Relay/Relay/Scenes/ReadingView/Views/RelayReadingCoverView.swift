//
//  RelayReadingCoverView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/07.
//

import UIKit
import SnapKit

class RelayReadingCoverView: UIView {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .relayBlack
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var statusLabel: BasePaddingLabel = {
        let label = BasePaddingLabel()
        label.padding = UIEdgeInsets(top: 4.0, left: 10.0, bottom: 4.0, right: 10.0)
        label.font = .systemFont(ofSize: 12.0, weight: .bold)
        label.textColor = .white
        
        label.clipsToBounds = true
        label.backgroundColor = .relayPink1
        label.layer.cornerRadius = 12.0
        
        return label
    }()
    
    private lazy var stepCountCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var playlistLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayReadingCoverView {
    func configure(title: String, currentStep: Int, stepLimit: Int, genre: String, bgmTitle: String,isFinished: Bool) {
        titleLabel.text = title
        stepCountCategoryLabel.text = "\(currentStep) / \(stepLimit) 터치 · \(genre) "
        setupPlaylistLabel(bgmTitle)

        if isFinished {
            statusLabel.text = "완주"
            statusLabel.textColor = .relayPink1
            statusLabel.layer.borderColor = UIColor.relayPink1.cgColor
            statusLabel.layer.borderWidth = 1.0
            statusLabel.backgroundColor = .systemBackground
        } else {
            statusLabel.text = "달리는중"
        }
    }
    
    private func setupPlaylistLabel(_ bgmTitle: String) {
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "music.note.list")?.withTintColor(.white) ?? UIImage()
        imageAttachment.bounds = CGRect(x: 0.0, y: -5.0, width: 22.0, height: 23.0)
        
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: " " + bgmTitle))
        
        playlistLabel.attributedText = attributedString
        playlistLabel.textColor = .white
        playlistLabel.font = .systemFont(ofSize: 16.0, weight: .bold)
    }
    
    private func setupLayout() {
        [
            imageView,
            titleLabel,
            statusLabel,
            stepCountCategoryLabel,
            playlistLabel
        ].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(244.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(11.0)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        stepCountCategoryLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12.0)
            $0.leading.equalTo(statusLabel.snp.trailing).offset(8.0)
        }
        
        playlistLabel.snp.makeConstraints {
            $0.top.equalTo(statusLabel.snp.bottom).offset(13.0)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
    }
}
