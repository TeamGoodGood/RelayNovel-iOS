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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
