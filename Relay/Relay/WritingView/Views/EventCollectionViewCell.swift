//
//  EventCollectionViewCell.swift
//  Relay
//
//  Created by 이창형 on 2022/11/08.
//

import UIKit
import SnapKit

class EventCollectionViewCell: UICollectionViewCell {
    
    let eventLabel: UILabel = {
        let label = UILabel()
        
        label.text = "asdf"
        label.setFont(.caption1)
        label.textColor = .relayBlack
        
        return label
    }()
    
    let circleView: UIView = {
        let view = UIView()
        
        view.layer.borderColor = UIColor.relayBlack.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                print("selected in \(isSelected)")
                circleView.layer.borderColor = UIColor.relayPink1.cgColor
                circleView.backgroundColor = .relayPink1
            } else {
                print("else in")
                circleView.layer.borderColor = UIColor.relayBlack.cgColor
                circleView.backgroundColor = .white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [
            circleView
        ].forEach { contentView.addSubview($0) }
        circleView.addSubview(eventLabel)
        
        circleView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        eventLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7.0)
            $0.leading.equalToSuperview().inset(12.0)
            $0.trailing.equalToSuperview().inset(12.0)
            $0.bottom.equalToSuperview().inset(7.0)
        }
    }
}

