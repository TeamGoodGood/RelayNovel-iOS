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
    
    private lazy var scrollView = UIScrollView()
    
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
        
        [
            readingCoverView,
            readingNoticeView,
            readingBodyView
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupLayout()
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
}
