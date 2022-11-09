//
//  RelayReadingWriteView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/09.
//

import UIKit
import SnapKit

class RelayReadingWriteView: UIView {
    private lazy var touchCountLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var textCountLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var bodyLineView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var writingTextView: UITextView = {
        let textView = UITextView()
        
        return textView
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
