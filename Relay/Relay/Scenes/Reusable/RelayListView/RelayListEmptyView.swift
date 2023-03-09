//
//  RelayListEmptyView.swift
//  Relay
//
//  Created by seungyeon oh on 2023/01/25.
//

import UIKit
import SnapKit

extension UICollectionView {
    
    func setEmptyView(message: String) {
        let emptyView: UIView = {
            let view = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.width, height: self.bounds.height))
            view.backgroundColor = .blue
            
            return view
        }()
        
        var emptyViewImage: UIImageView {
            let image = UIImageView()
            image.image = UIImage(systemName: "tray")?.resize(newWidth: 30.0).imageWithColor(color: .relayPink1)
            image.sizeToFit()
            
            return image
        }
        
        let emptyViewLabel: UILabel = {
            let label = UILabel()
            label.text = message
            label.setFont(.body1)
            label.textColor = .relayGray
            
            return label
        }()
        
        emptyView.addSubview(emptyViewImage)
        emptyView.addSubview(emptyViewLabel)
        
        emptyViewImage.snp.makeConstraints {
            $0.centerX.equalTo(emptyView.snp.centerX)
            $0.centerY.equalTo(emptyView.snp.centerY)
//            $0.bottom.equalTo(emptyViewLabel.snp.top).offset(30)
        }
//        emptyViewLabel.snp.makeConstraints {
//            $0.centerX.equalTo(emptyView.snp.centerX)
//            $0.centerY.equalTo(emptyView.snp.centerY)
////            $0.top.equalTo(emptyViewImage.snp.bottom).offset(30)
//        }
        
        self.backgroundView = emptyView
        
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
