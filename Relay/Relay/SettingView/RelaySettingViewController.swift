//
//  RelaySettingViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/04.
//

import UIKit
import SnapKit

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
    
    var models = [SettingsOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        self.models = Array(0...100).compactMap({
            SettingsOption(title: "Item \($0)"){
                
            }
        })
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
