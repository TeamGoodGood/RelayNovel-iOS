//
//  ReusableTitleView.swift
//  Relay
//
//  Created by 이창형 on 2022/11/07.
//

import UIKit
import SnapKit

class ReusableTitleView: UIView, UISheetPresentationControllerDelegate {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.setFont(.body1)
        
        return label
    }()
    
    lazy var questionButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 17)
        let tag = 0
        
        button.setImage(UIImage(systemName: "questionmark.circle.fill", withConfiguration: config), for: .normal)
        button.tintColor = .relayGray2
        
        button.addTarget(self, action: #selector(goToDetailView(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goToDetailView(sender: UIButton) {
        print("하이")
    }
    
    private func setupLayout() {
        [
            titleLabel,
            questionButton
        ].forEach { addSubview($0) }

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        questionButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(4.0)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(20)
            $0.width.equalTo(20)
        }
    }
}
