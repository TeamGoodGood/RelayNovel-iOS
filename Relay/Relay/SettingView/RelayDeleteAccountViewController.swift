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
        table.backgroundColor = .blue
        return table
    }()
    
    private var deleteAccountUserActivityView = RelayDeleteAccountUserActivityView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLayout()
    }
}

extension RelayDeleteAccountViewController {
    private func setupLayout() {
        [
            deleteAccountUserActivityView,
            tableView
        ].forEach { view.addSubview($0) }

        deleteAccountUserActivityView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(420)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(deleteAccountUserActivityView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
