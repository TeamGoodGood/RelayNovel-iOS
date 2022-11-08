//
//  RelayDeleteAccountUserActivityView.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/08.
//

import UIKit
import SnapKit

class RelayDeleteAccountUserActivityView: UIView {

    private var deleteAccountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RelayLilla")

        return imageView
    }()

    private var deleteAccountLabel: UILabel = {
        let label = UILabel()
        let content = "시작한 릴레이 3개 \n참여한 릴레이 13개"
        label.numberOfLines = 2
        label.setLineHeight(text: content, lineHeight: 30.0)
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 24.0)

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        [
            deleteAccountLabel,
            deleteAccountImageView
        ].forEach { addSubview($0) }

        deleteAccountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(170.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        deleteAccountImageView.snp.makeConstraints {
            $0.top.equalTo(deleteAccountLabel.snp.bottom).offset(50.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(248.0)
            $0.height.equalTo(81.0)
        }


    }
}
