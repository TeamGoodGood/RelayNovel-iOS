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
        label.text = "소설 제목입니다"
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var statusLabel: BasePaddingLabel = {
        let label = BasePaddingLabel()
        label.text = "달리는중"
        label.setFont(.caption2)
        label.textColor = .white
        
        label.clipsToBounds = true
        label.backgroundColor = .relayPink1
        label.layer.cornerRadius = 12.0
        
        return label
    }()
    
    private lazy var stepCountCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "9 / 10 터치 · SF "
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var playlistLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "music.note.list") ?? UIImage()
        imageAttachment.bounds = CGRect(x: 0.0, y: 0.0, width: 22.0, height: 23.0)
        
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: " " + "플레이리스트 제목"))
        
        label.attributedText = attributedString
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
