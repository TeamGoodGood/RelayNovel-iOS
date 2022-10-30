//
//  RelayLoginViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayLoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "릴레이"
        label.sizeToFit()
        label.font = .systemFont(ofSize: 57)
        label.textColor = .label
        return label
    }()
    
    private let loginImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        let myImage: UIImage = UIImage(named: "Lilla")!
        
        imageView.image = myImage
        return imageView
    }()
    
    private let noLoginLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString.init(string: "로그인 없이 둘러보기")
        
        // label에 밑줄 그을 수 있게 도와줌
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:NSRange.init(location: 0, length: attributedString.length));
        
        label.attributedText = attributedString
        label.sizeToFit()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .label
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        setupLayout()
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(202.0)
            $0.leading.equalToSuperview().inset(53.0)
            $0.trailing.equalToSuperview().inset(160.0)
            $0.bottom.equalToSuperview().inset(555.0)
        }
        loginImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(346.0)
            $0.leading.equalToSuperview().inset(55.0)
            $0.trailing.equalToSuperview().inset(55.0)
            $0.bottom.equalToSuperview().inset(288.0)
        }
        noLoginLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(737.0)
            $0.leading.equalToSuperview().inset(128.0)
            $0.trailing.equalToSuperview().inset(129.0)
            $0.bottom.equalToSuperview().inset(89.0)
        }
        
        
    }
    
    private func setupLayout() {
        [
            titleLabel,
            loginImageView,
            noLoginLabel
            
        ].forEach { view.addSubview($0) }
    }
    
    
}

