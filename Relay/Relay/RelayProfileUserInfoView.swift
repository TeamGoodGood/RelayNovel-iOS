//
//  RelayProfileUserInfoView.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayProfileUserInfoView: UIView {
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .brown
        
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0)
        label.text = "이름님"
        
        return label
    }()
    
    private lazy var startedNovelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0)
        label.text = "시작한 소설"
        
        return label
    }()
    
    private lazy var participatedNovelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0)
        label.text = "참여한 소설"
        
        return label
    }()
    
    private lazy var startedNovelCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        label.text = "10"
        
        return label
    }()
    
    private lazy var participatedNovelCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        label.text = "4"
        
        return label
    }()
    
    private lazy var novelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8.0
        
        [
            startedNovelLabel,
            startedNovelCountLabel,
            participatedNovelLabel,
            participatedNovelCountLabel
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
