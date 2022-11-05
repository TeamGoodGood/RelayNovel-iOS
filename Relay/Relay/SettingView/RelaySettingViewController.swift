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
    let options: [SettingsOption]
}
struct SettingsOption {
    let title: String
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
        title = "settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func relaySettingViewConfigure() {
        models.append(Section(title: "General", options: [
            SettingsOption(title: "내 정보") {
            
            },
            SettingsOption(title: "알림 설정") {
                
            }
        ]))
        models.append(Section(title: "", options: [
            SettingsOption(title: "릴레이에 대해서") {
            
            },
            SettingsOption(title: "이용약관") {
                
            },
            SettingsOption(title: "개인정보처리방침") {
                
            },
            SettingsOption(title: "버전") {
                
            }
        ]))
        models.append(Section(title: "", options: [
            SettingsOption(title: "굳굳 계정") {
            
            }
        ]))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RelaySettingTableViewCell.identifier, for: indexPath
        ) as? RelaySettingTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: model)
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped")
    }
}
