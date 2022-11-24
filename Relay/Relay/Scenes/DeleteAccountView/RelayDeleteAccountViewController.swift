//
//  RelayDeleteAccountViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/08.
//

import UIKit
import SnapKit


class RelayDeleteAccountViewController: UIViewController {
    
    private let tableView: UIView = {
        let table = UIView()
        table.backgroundColor = .white
        return table
    }()
    
    private var userActivityView = RelayDeleteAccountUserActivityView(frame: .zero)
    private var agreementView = RelayDeleteAccountAgreementView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLayout()
        navigationBarCustom()
    }
}

extension RelayDeleteAccountViewController {
    private func setupLayout() {
        [
            userActivityView,
            agreementView
        ].forEach { view.addSubview($0) }
        
        userActivityView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(510)
        }
        agreementView.snp.makeConstraints {
            $0.top.equalTo(userActivityView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func navigationBarCustom() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.tintColor = .relayBlack
        navigationController?.navigationBar.topItem?.title = ""
    }
}
