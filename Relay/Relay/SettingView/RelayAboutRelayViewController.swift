//
//  RelayAboutRelayViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/07.
//

import UIKit
import SnapKit

struct aboutRelaySection {
    let title: String
    let options: [SettingsOption]
}

struct aboutRelaySettingsOption {
    let title: String
    let handler: (() -> Void)
}

class RelayAboutRelayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(RelaySettingTableViewCell.self, forCellReuseIdentifier: RelaySettingTableViewCell.identifier)
        
        return table
    }()
    
    private var aboutRelayDescriptionView = RelayAboutRelayDescriptionView(frame: .zero)
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        relaySettingViewConfigure()
        setupLayout()
        tableViewSetupLayout()
    }
    
    func relaySettingViewConfigure() {
        models.append(Section(title: "", details: "", version: "", options: [
            SettingsOption(title: "튜토리얼 다시보기", details: "", version: "") {
                // 온보딩 뷰 연결
            },
            SettingsOption(title: "오픈소스 라이선스", details: "", version: "") {
                // 오픈소스 라이선스 뷰 연결
            }
        ]))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RelaySettingTableViewCell.identifier, for: indexPath
        ) as? RelaySettingTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
}

extension RelayAboutRelayViewController {
    private func setupLayout() {
        [
            aboutRelayDescriptionView,
            tableView
        ].forEach { view.addSubview($0) }
        
        aboutRelayDescriptionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(420)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(aboutRelayDescriptionView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func tableViewSetupLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.contentInset = .init(top: 8, left: 0, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.sectionHeaderHeight = 7
        tableView.sectionFooterHeight = 0
        tableView.backgroundColor = .relayGray2
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = self.tableView.backgroundColor
    }
}
