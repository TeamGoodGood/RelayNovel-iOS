//
//  RelayBrowsingViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/03.
//

import UIKit
import SnapKit

class RelayBrowsingViewController: UIViewController {
    private lazy var relayBrowsingHeaderView = RelayBrowsingHeaderView(frame: .zero)
    private lazy var relayListView = RelayListView(frame: .zero, type: .browse)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.backgroundColor = .relayBlack
        setupLayout()
    }
}

extension RelayBrowsingViewController {
    private func setupLayout() {
        [
            relayBrowsingHeaderView,
            relayListView
        ].forEach { view.addSubview($0) }
        
        relayBrowsingHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(57.0)
        }
        
        relayListView.snp.makeConstraints {
            $0.top.equalTo(relayBrowsingHeaderView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
