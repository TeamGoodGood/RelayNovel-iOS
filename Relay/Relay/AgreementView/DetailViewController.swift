//
//  DetailViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/02.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        
        label.text = "약관"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        [
            detailLabel
            
        ].forEach { view.addSubview($0) }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(59.0)
            $0.leading.equalToSuperview().inset(18.0)
            $0.width.height.equalTo(26.0)
        }
    }
}
