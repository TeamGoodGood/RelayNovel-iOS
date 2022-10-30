//
//  RelayLoginViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayLoginViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "릴레이"
        label.sizeToFit()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .label
        return label
    }()
    
    let loginImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        let myImage: UIImage = UIImage(named: "Lilla")!
        imageView.image = myImage
        return imageView
    }()
    
    let button = UIButton(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(202.0)
            $0.leading.equalToSuperview().inset(53.0)
            $0.trailing.equalToSuperview().inset(160.0)
            $0.bottom.equalToSuperview().inset(555.0)
        }
        
        
        
        
        
        
    }
    
}


