//
//  RelaySettingTableViewCell.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/05.
//

import UIKit

class RelaySettingTableViewCell: UITableViewCell {
    static let identifier = "SettingTableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        
        return label
    }()
    
    private let detail: UILabel = {
        let detail = UILabel()
        detail.numberOfLines = 1
        detail.textColor = .relayGray
        
        return detail
    }()
    
    private let version: UILabel = {
        let version = UILabel()
        version.numberOfLines = 1
        version.textColor = .relayGray
        
        return version
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(detail)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayout()
    }
    
    private func setupLayout() {
        [
            label,
            detail,
            version
        ].forEach { addSubview($0) }
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview()
        }
        detail.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(35.0)
            $0.bottom.equalToSuperview()
        }
        version.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(label.snp.trailing).offset(7.0)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    public func configure(with model: SettingsOption) {
        label.text = model.title
        detail.text = model.details
        version.text = model.version
    }
}
