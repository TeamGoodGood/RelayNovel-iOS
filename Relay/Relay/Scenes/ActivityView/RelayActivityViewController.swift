//
//  RelayActivityViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/21.
//

import UIKit
import SnapKit

class RelayActivityViewController: UIViewController {
    var type: ViewType
    
    private lazy var relayListView = RelayListView(frame: .zero, type: type)
    
    init(type: ViewType) {
        self.type = type
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
