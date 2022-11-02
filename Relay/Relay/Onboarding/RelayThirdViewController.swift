//
//  RelayThirdViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/02.
//

import UIKit
import SnapKit

class RelayThirdViewController: UIViewController {
    
    // MARK: - Property
    weak var label: UILabel?
    let index = 2
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        
        title.text = "릴레이 설명3"
        title.font = .boldSystemFont(ofSize: 36)
        
        return title
    }()
    
    private let contentLabel: UILabel = {
        let content = UILabel()
        
        content.text = "어플을 설명하는 문장입니다\n어플을 설명하는 문장입니다\n어플을 설명하는 문장입니다"
        content.numberOfLines = 3
        content.font = .systemFont(ofSize: 17)
        
        return content
    }()
    
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        let myImage: UIImage = UIImage(named: "onboardingImage")!
        imageView.image = myImage
        
        return imageView
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout(){
        [
            titleLabel,
            contentLabel,
            onboardingImageView
          
        ].forEach { view.addSubview($0) }
        
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
