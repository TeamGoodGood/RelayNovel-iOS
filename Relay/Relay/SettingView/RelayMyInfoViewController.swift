//
//  RelayMyInfoViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/07.
//


import UIKit
import SnapKit

struct MyInfoSection {
    let title: String
    let options: [SettingsOption]
}

struct MyInfoSettingsOption {
    let title: String
    let handler: (() -> Void)
}

class RelayMyInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(RelaySettingTableViewCell.self, forCellReuseIdentifier: RelaySettingTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        relaySettingViewConfigure()
//        title = "내 정보"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.contentInset = .init(top: 120, left: 0, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.sectionHeaderHeight = 7
        tableView.sectionFooterHeight = 0
        tableView.backgroundColor = .relayGray2
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = self.tableView.backgroundColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func relaySettingViewConfigure() {
        models.append(Section(title: "", options: [
            SettingsOption(title: "계정") {
                print("Tapped 계정")
            },
            SettingsOption(title: "로그아웃") {
                
            },
            SettingsOption(title: "회원탈퇴") {
                
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
        if indexPath.row == 0 {
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
}


