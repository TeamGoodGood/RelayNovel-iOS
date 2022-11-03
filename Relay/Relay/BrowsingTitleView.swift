//
//  BrowsingTitleView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/03.
//

import UIKit
import SnapKit

class BrowsingTitleView: UIView {
    var title: String
    
    private lazy var titleButton: UIButton = {
        let button = UIButton()
        
        var titleAttribute = AttributedString(title)
        titleAttribute.font = .systemFont(ofSize: 24.0, weight: .bold)
        titleAttribute.foregroundColor = .relayBlack
        
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
        
        return button
    }()
    
    private lazy var titleUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .relayPink1
        
        return view
    }()
    
    init(frame: CGRect, title: String) {
        self.title = title
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
