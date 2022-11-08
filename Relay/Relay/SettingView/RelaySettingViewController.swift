//
//  RelaySettingViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/04.
//

import UIKit
import SnapKit

struct Section {
    let title: String
    let details: String
    let version: String
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let details: String
    let version: String
    let handler: (() -> Void)
}

class RelaySettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(RelaySettingTableViewCell.self, forCellReuseIdentifier: RelaySettingTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        relaySettingViewConfigure()
        tableViewSetupLayout()
    }
    
    func relaySettingViewConfigure() {
        models.append(Section(title: "", details: "", version: "", options: [
            SettingsOption(title: "내 정보", details: "Apple", version: "") {
                //추후 RelayMyInfoViewController와 연결
            },
            SettingsOption(title: "알림 설정", details: "", version: "") {
                //추후 로컬 디바이스 알림설정과 연결
            }
        ]))
        models.append(Section(title: "", details: "", version: "", options: [
            SettingsOption(title: "릴레이에 대해서", details: "", version: "") {
                //추후 RelayAboutRelayViewController와 연결
            },
            SettingsOption(title: "이용약관", details: "", version: "") {
                //추후 이용약관 뷰 연결
            },
            SettingsOption(title: "개인정보처리방침", details: "", version: "") {
                //추후 개인정보처리방침 뷰 연결
            },
            SettingsOption(title: "버전", details: "최신 버전입니다", version: "1.1.0") {
                
            }
        ]))
        models.append(Section(title: "", details: "", version: "", options: [
            SettingsOption(title: "굳굳 계정", details: "", version: "") {
                //추후 굳굳 sns 계정과 연결
            }
        ]))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if models.count == 0 {
            tableView.sectionHeaderHeight = 2
        }
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RelaySettingTableViewCell.identifier, for: indexPath
        ) as? RelaySettingTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        if indexPath.row == 3 {
            cell.accessoryType = .none
        }
        else{
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 1.0 : 7.0
    }
}

extension RelaySettingViewController {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeader")
        
        return header
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        let view: UIView = {
            let section = UIView(frame: .zero)
            section.backgroundColor = .relayGray2
            
            return section
        }()
        
        header.textLabel?.textAlignment = .center
        header.textLabel?.textColor = .systemBlue
        header.backgroundView = view
        
    }
}

extension RelaySettingViewController {
    func tableViewSetupLayout() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.contentInset = .init(top: 120, left: 0, bottom: 0, right: 0) // 뷰 연결 시 top 값 조정필요
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = .relayGray2
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")
    }
}
