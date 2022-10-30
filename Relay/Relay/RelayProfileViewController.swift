//
//  RelayProfileViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayProfileViewController: UIViewController {
    private lazy var profileUserInfoView = RelayProfileUserInfoView(frame: .zero)
    private lazy var profileUserActivityView = RelayProfileUserActivityView(frame: .zero)
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    private lazy var profileSettingButton: UIButton = {
        let button = UIButton()
        var configure = button.configuration
        
        var titleAttribute = AttributedString("프로필 수정")
        titleAttribute.font = .systemFont(ofSize: 12.0)
        titleAttribute.foregroundColor = .gray
        
        configure?.attributedTitle = titleAttribute
        configure?.baseBackgroundColor = .systemBackground
        configure?.titleAlignment = .center
        configure?.contentInsets = NSDirectionalEdgeInsets(top: 8.0, leading: 12.0, bottom: 8.0, trailing: 12.0)
        configure?.cornerStyle = .capsule
        
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1.0
        
        return button
    }()
    
    private lazy var environmentSettingButton: UIButton = {
        let button = UIButton()
        button.setTitle("􀣋", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
