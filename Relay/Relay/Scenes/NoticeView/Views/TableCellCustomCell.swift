//
//  TableCellCustomCell.swift
//  Relay
//
//  Created by 이창형 on 2022/11/09.
//

import UIKit
import SnapKit

class TableCellCustomCell: UITableViewCell {
    
    var notice: Notice?
    
    static let reuseIdentifier: String = "MainTableViewCell"
    
    private let dividerBottom: UIView = {
        let view = UIView()
        view.backgroundColor = .relayGray2
        
        return view
    }()
    
    private let noticeImageView: UIImageView = {
       let imageView = UIImageView()
        
        imageView.tintColor = .relayPink1
        
       return imageView
    }()
    
    private let noticeLabel: UILabel = {
        let label = UILabel()
        
        label.setFont(.caption1)
        label.numberOfLines = 0
        label.textColor = .relayBlack
        label.lineBreakMode = .byCharWrapping

        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        
        label.setFont(.caption2)
        label.textColor = .relayGray
        
        return label
    }()
    
    func configure(_ notice: Notice) {
        self.notice = notice
        
        noticeLabel.text = setNoticeText(noticeType: notice.noti_type)
        timeLabel.text = String(notice.created_time)
        
        noticeImageView.image = setNoticeImage(noticeType: notice.noti_type)
        noticeImageView.image?.withTintColor(.relayPink1)
        
        setupLayout()
    }

    private func setupLayout() {
        [
            noticeImageView,
            noticeLabel,
            timeLabel,
            dividerBottom
        ].forEach { addSubview($0) }
        
        noticeImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(35.0)
            $0.leading.equalToSuperview().inset(30.0)
            $0.width.equalTo(27.0)
            $0.height.equalTo(26.0)
        }
        noticeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30.0)
            $0.leading.equalTo(noticeImageView.snp.trailing).offset(21.0)
            $0.trailing.equalToSuperview().inset(30.0)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(4.0)
            $0.leading.equalTo(noticeImageView.snp.trailing).offset(21.0)
        }
        dividerBottom.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1.0)
        }
    }
}

extension TableCellCustomCell {
    func setNoticeText(noticeType: Int) -> String{
        switch noticeType {
        case 0:
            return "내가 시작한 릴레이에 좋아요를 남겼어요"
        case 1:
            return "내가 시작한 릴레이에 새로운 터치가 추가되었어요"
        case 2:
            return "내가 시작한 릴레이가 완주되었어요"
        case 3:
            return "내가 참여한 릴레이에 좋아요를 남겼어요"
        case 4:
            return "내가 참여한 릴레이에 새로운 터치가 추가되었어요"
        case 5:
            return "내가 참여한 릴레이가 완주되었어요"
        default:
            return "error"
        }
    }
    
    func setNoticeImage(noticeType: Int) -> UIImage{
        switch noticeType {
        case 0,3:
            return (UIImage(systemName: "heart"))!
        case 1,4:
            return (UIImage(systemName: "hands.clap"))!
        case 2,5:
            return (UIImage(systemName: "flag"))!
        default:
            return (UIImage(systemName: "exclamationmark"))!
        }
    }
}
