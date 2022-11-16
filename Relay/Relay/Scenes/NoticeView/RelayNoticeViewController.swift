//
//  RelayNoticeViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/09.
//

import UIKit
import SnapKit

class RelayNoticeViewController: UIViewController {
    
    //    private lazy var noticeButton = UIBarButtonItem(
    //        image: UIImage(systemName: "bell"),
    //        style: .plain,
    //        target: self,
    //        action: #selector(goToNoticeView)
    //    )
    //
    //    //TODO: 이미지 크기 변경 필요
    //    private lazy var logoButton = UIBarButtonItem(
    //        image: UIImage(named: "RelayLogo"),
    //        style: .plain,
    //        target: self,
    //        action: nil
    //    )
    
    private lazy var backBarButtonItem = UIBarButtonItem(
        title: "",
        style: .plain,
        target: self,
        action: nil
    )
    
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
        setNavigationBar()
    }
}

extension RelayNoticeViewController {
    
    private func setNavigationBar() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.tintColor = .relayBlack
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func setupTableView() {
        tableView.register(TableCellCustomCell.self, forCellReuseIdentifier: TableCellCustomCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupLayout() {
        [
            tableView,
            dividerTop
        ].forEach { view.addSubview($0) }
        
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
