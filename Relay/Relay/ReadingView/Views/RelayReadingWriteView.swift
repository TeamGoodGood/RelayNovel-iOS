//
//  RelayReadingWriteView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/09.
//

import UIKit
import SnapKit

class RelayReadingWriteView: UIView {
    private let textViewPlaceHolder = "내용을 작성해주세요."
    
    private lazy var touchCountLabel: UILabel = {
        let label = UILabel()
        label.text = "4 터치"
        
        label.textColor = .relayPink1
        label.setFont(.caption2)
        
        return label
    }()
    
    private lazy var textCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0/500자"
        label.textColor = UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1.0)
        label.setFont(.caption2)
        
        return label
    }()
    
    private lazy var bodyLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .relayPink2
        
        return view
    }()
    
    lazy var writingTextView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 8.0
        textView.backgroundColor = .relayGray2
        
        textView.text = textViewPlaceHolder
        textView.font = .systemFont(ofSize: 17)
        textView.textColor = .relayGray
        
        textView.textContainerInset = UIEdgeInsets(top: 12.0, left: 18.0, bottom: 12.0, right: 18.0)
        
        return textView
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "checkmark")
        
        button.tintColor = .relayPink1
        button.setTitle("등록하기", for: .normal)
        button.titleLabel?.setFont(.caption1)
        button.setTitleColor(.relayBlack, for: .normal)
        
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .center
        button.semanticContentAttribute = .forceLeftToRight
        button.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
