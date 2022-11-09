//
//  RelayReadingFinishFooterView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/09.
//

import UIKit
import SnapKit

class RelayReadingFinishFooterView: UIView {
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        
        return view
    }()
    
    private lazy var participantLabel: UILabel = {
        let label = UILabel()
        label.text = "참여작가"
        label.setFont(.body1)
        
        return label
    }()
    
    private lazy var penNameLabel: UILabel = {
        let label = UILabel()
        label.text = "초이 · 레티샤"
        label.font = .systemFont(ofSize: 16.0)
        
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "heart.fill")
        
        button.tintColor = .relayPink1
        button.setTitle("13", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .bold)
        button.setTitleColor(.relayBlack, for: .normal)
        
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .center
        button.semanticContentAttribute = .forceLeftToRight
        button.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 8.0)
        
        button.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
