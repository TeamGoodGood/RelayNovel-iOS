//
//  RelayNoticeViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/09.
//

import UIKit
import SnapKit

class RelayNoticeViewController: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "arrow.left", withConfiguration: config)
        
        button.setImage(image: image!)
        button.tintColor = .relayBlack
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "알림"
        label.setFont(.caption1)
        
        return label
    }()
    
    private let trashButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "trash", withConfiguration: config)
        
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    private let dividerTop: UIView = {
        let view = UIView()
        view.backgroundColor = .relayGray2
        
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupLayout()
        
    }
}

extension RelayNoticeViewController {
    private func setupTableView() {
        tableView.register(TableCellCustomCell.self, forCellReuseIdentifier: TableCellCustomCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupLayout() {
        [
            backButton,
            titleLabel,
            trashButton,
            tableView,
            dividerTop
        ].forEach { view.addSubview($0) }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60.0)
            $0.leading.equalToSuperview().inset(18.0)
            $0.width.height.equalTo(26.0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64.0)
            $0.centerX.equalTo(view.snp.centerX)
        }
        trashButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        dividerTop.snp.makeConstraints {
            $0.bottom.equalTo(tableView.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1.0)
        }
    }
}

extension RelayNoticeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCellCustomCell.reuseIdentifier, for: indexPath) as! TableCellCustomCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
}
