//
//  RelayReadingViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/07.
//

import UIKit
import SnapKit

class RelayReadingViewController: UIViewController {
    
    private lazy var readingCoverView = RelayReadingCoverView()
    private lazy var readingNoticeView = ReadingNoticeView()
    private lazy var readingBodyView = ReadingBodyView()
    private lazy var readingFooterView = RelayReadingFooterView()
    private lazy var scrollView = UIScrollView()
    
    private lazy var spacerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let width = UIScreen.main.bounds.width
        
        readingCoverView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(373.0)
        }
        
        readingFooterView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(86.0)
        }
        
        spacerView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(47.0)
        }
        
        [
            spacerView,
            readingCoverView,
            readingNoticeView,
            readingBodyView,
            readingFooterView
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private let contentView = UIView()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .relayBlack
        button.layer.cornerRadius = 20.0
        
        button.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var readingModeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "clock"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .relayBlack
        button.layer.cornerRadius = 20.0
        
        return button
    }()
    
    private lazy var musicButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "speaker.wave.2"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .relayBlack
        button.layer.cornerRadius = 20.0
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupNavigationController()
        setupLayout()
        setupCustomNavigationButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        readingBodyView.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(readingBodyView.bodyCollectionView.collectionViewLayout.collectionViewContentSize.height)
        }
    }
}

extension RelayReadingViewController {
    private func setupNavigationController() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupCustomNavigationButton() {
        [
            backButton,
            musicButton,
            readingModeButton
        ].forEach { view.addSubview($0) }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(57.0)
            $0.leading.equalToSuperview().inset(12.0)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }
        
        musicButton.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.top)
            $0.trailing.equalToSuperview().inset(12.0)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }
        
        readingModeButton.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.top)
            $0.trailing.equalTo(musicButton.snp.leading).offset(-16.0)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(-44.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }

    }
    
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}
