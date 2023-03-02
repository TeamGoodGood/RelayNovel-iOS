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
        navigationBarCustom()
    }
    
    func relaySettingViewConfigure() {
        models.append(Section(title: "", details: "", version: "", options: [
            SettingsOption(title: "내 정보", details: "Apple", version: "") {
                self.toMyInfoView()
            },
            SettingsOption(title: "알림 설정", details: "", version: "") {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }
        ]))
        models.append(Section(title: "", details: "", version: "", options: [
            SettingsOption(title: "릴레이에 대해서", details: "", version: "") {
                self.toAboutRelayView()
            },
            SettingsOption(title: "이용약관", details: "", version: "") {
                self.toTermsAndConditionsView()
            },
            SettingsOption(title: "개인정보처리방침", details: "", version: "") {
                self.toPrivacyPolicyView()
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
        header.backgroundView = view
        
    }
}

extension RelaySettingViewController {
    func tableViewSetupLayout() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.contentInset = .init(top: 20, left: 0, bottom: 0, right: 0) 
        tableView.isScrollEnabled = false
        tableView.sectionHeaderHeight = 7
        tableView.sectionFooterHeight = 0
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = .relayGray2
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")
    }
    private func navigationBarCustom() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.tintColor = .relayBlack
        navigationController?.navigationBar.topItem?.title = ""
    }
}

extension RelaySettingViewController {
    @objc private func toMyInfoView(){
        let vc = RelayMyInfoViewController()
        vc.title = "내 정보"
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func toAboutRelayView(){
        let vc = RelayAboutRelayViewController()
        vc.title = "릴레이에 대해서"
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func toTermsAndConditionsView(){
        let vc = RelayTermsAndConditionsViewController()
        vc.title = "이용약관"
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func toPrivacyPolicyView(){
        let vc = RelayPrivacyPolicyViewController()
        vc.title = "개인정보 처리방침"
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
