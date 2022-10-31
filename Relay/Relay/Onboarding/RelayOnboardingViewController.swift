//
//  RelayOnboardingViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/10/31.
//

import UIKit
import SnapKit

class RelayOnboardingViewController: UIViewController {
    private let titleLabel: UILabel = {
        let title = UILabel()
        
        title.text = "릴레이 설명"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout(){
        [
            titleLabel,
            contentLabel,
        ].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(160.0)
            $0.leading.equalToSuperview().inset(50.0)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(233.0)
            $0.leading.equalToSuperview().inset(50.0)
        }
    }
}
