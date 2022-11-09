//
//  TableCellCustomCell.swift
//  Relay
//
//  Created by 이창형 on 2022/11/09.
//

import UIKit
import SnapKit

class TableCellCustomCell: UITableViewCell {
    private let lillaImageView: UIImageView = {
       let imageView = UIImageView()
       let image = UIImage(named: "onboardingImage")
        
       imageView.image = image
        
       return imageView
    }()
    
    private let noticeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "dk"
        label.setFont(.caption1)
        label.textColor = .relayBlack
        
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "아"
        label.setFont(.caption2)
        label.textColor = .relayGray
        
        return label
    }()
    
    
    
}
