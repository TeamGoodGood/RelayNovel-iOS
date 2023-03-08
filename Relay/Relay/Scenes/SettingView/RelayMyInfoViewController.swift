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
    var userAccount = "nickname@gmail.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        relaySettingViewConfigure()
        tableViewSetupLayout()
        navigationBarCustom()
        
    }
    
    func relaySettingViewConfigure() {
        models.append(Section(title: "", details: "", version: "", options: [
            SettingsOption(title: "계정", details: "\(userAccount)", version: "") {
                
            },
            SettingsOption(title: "로그아웃", details: "", version: "") {
                //추후 로그아웃 알림창 구현
            },
            SettingsOption(title: "회원탈퇴", details: "", version: "") {
                self.deleteAccountView()
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 1.0 : 7.0
    }
}

extension RelayMyInfoViewController {
    func tableViewSetupLayout() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.sectionHeaderHeight = 7
        tableView.sectionFooterHeight = 0
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = .relayGray2
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    private func navigationBarCustom() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.tintColor = .relayBlack
        navigationController?.navigationBar.topItem?.title = ""
    }
}

extension RelayMyInfoViewController {
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

extension RelayMyInfoViewController {
    @objc private func deleteAccountView(){
        
        let vc = RelayDeleteAccountViewController()
        vc.title = "회원탈퇴"
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
