//
//  RelayReadingFinishFooterView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/09.
//

import UIKit
import SnapKit
import Foundation

class RelayReadingFinishFooterView: UIView {
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        view.layer.cornerRadius = 8.0
        
        return view
    }()
    
    private lazy var participantLabel: UILabel = {
        let label = UILabel()
        label.text = "참여작가"
        label.setFont(.body1)
        label.sizeToFit()
        
        return label
    }()
    
    private lazy var penNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.sizeToFit()
        
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "heart.fill")
        
        button.tintColor = .relayPink1
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .bold)
        button.setTitleColor(.relayBlack, for: .normal)
        
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .center
        button.semanticContentAttribute = .forceLeftToRight
        button.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 8.0)
        
        button.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayReadingFinishFooterView {
    func configure(likeCount: Int, isLikedUser: Bool, relays: [Relay]) {
        if isLikedUser {
            likeButton.tintColor = .relayPink1
        } else {
            let image = UIImage(systemName: "heart")
            likeButton.setImage(image, for: .normal)
        }
        
        likeButton.setTitle("\(likeCount)", for: .normal)
        
        var contributerText = ""
        for i in 0..<relays.count {
            if i == 0 {
                contributerText += relays[i].contributer.penname ?? "필명호출오류"
            } else {
                contributerText += (" · " + (relays[i].contributer.penname ?? "필명호출오류"))
            }
        }
        let contributerArray = contributerText.split(separator: " · ")
        let removeDuplicates = uniqueElementsFrom(array:contributerArray)
        let returnContributerText = removeDuplicates.joined(separator: " · ")
        
        penNameLabel.text = returnContributerText
    }
    
    private func setupLayout() {
        [
            backgroundView,
            participantLabel,
            penNameLabel,
            likeButton
        ].forEach { addSubview($0) }
        
        let backgroundViewHeight = participantLabel.bounds.height + penNameLabel.bounds.height + 53.0
        
        backgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(backgroundViewHeight)
        }
        
        participantLabel.snp.makeConstraints {
            $0.top.equalTo(backgroundView.snp.top).inset(22.0)
            $0.centerX.equalToSuperview()
        }
        
        penNameLabel.snp.makeConstraints {
            $0.top.equalTo(participantLabel.snp.bottom).offset(10.0)
            $0.centerX.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(backgroundView.snp.bottom).offset(44.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(81.0)
            $0.height.equalTo(56.0)
        }
    }
}

extension RelayReadingFinishFooterView{
    func uniqueElementsFrom<T: Hashable>(array: [T]) -> [T] {
      var set = Set<T>()
      let result = array.filter {
        guard !set.contains($0) else {
          return false
        }
        set.insert($0)
        return true
      }
      return result
    }
}
