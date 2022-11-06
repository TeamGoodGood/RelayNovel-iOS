//
//  RelayWritingViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/05.
//

import UIKit

class RelayWritingViewController: UIViewController {
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "xmark", withConfiguration: config)
        
        button.setImage(image: image!)
        button.tintColor = .relayBlack
        
        return button
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton()
     
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.relayBlack, for: .normal)
        button.titleLabel?.setFont(.caption1)
        
        return button
    }()
    
    private let musicListButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "music.note.list", withConfiguration: config)
        
        button.setImage(image: image!)
        button.tintColor = .relayPink1
        
        button.setTitle("플레이리스트 선택", for: .normal)
        button.titleLabel!.setFont(.body2)
        button.setTitleColor(.relayBlack, for: .normal)
        
        button.backgroundColor = .relayGray2
        button.layer.cornerRadius = 8
        
        button.contentHorizontalAlignment = .leading
        button.semanticContentAttribute = .forceLeftToRight
        button.imageEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 0)
        button.titleEdgeInsets = .init(top: 0, left: 28, bottom: 0, right: 0)
        
        return button
    }()
    
    private let muteButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "speaker.slash.fill")
        
        button.setImage(image: image!)
        button.tintColor = .relayBlack
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "제목"
        label.setFont(.body1)
        
        return label
    }()

    private let writeScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    private let contentView: UIView = {
          let view = UIView()
    
          return view
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(writeScrollView)
        writeScrollView.addSubview(contentView)
        setupLayout()
    }
}

extension RelayWritingViewController {
    private func setupLayout() {
        [
            closeButton,
            completeButton,
            muteButton,
            musicListButton,
            titleLabel
        ].forEach { contentView.addSubview($0) }
        
        writeScrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.top.equalTo(writeScrollView.snp.top)
            $0.leading.equalTo(writeScrollView.snp.leading)
            $0.trailing.equalTo(writeScrollView.snp.trailing)
            $0.bottom.equalTo(writeScrollView.snp.bottom)
            $0.width.equalTo(writeScrollView.snp.width)
        }
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        completeButton.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.top)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        muteButton.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(39.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.width.equalTo(22.0)
        }
        musicListButton.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(28.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalTo(muteButton.snp.leading).inset(-20.0)
            $0.height.equalTo(47.0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(musicListButton.snp.bottom).offset(28.0)
            $0.leading.equalTo(musicListButton.snp.leading)
        }
        
    }
}
