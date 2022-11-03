//
//  RelayBrowsingViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/03.
//

import UIKit
import SnapKit

class RelayBrowsingViewController: UIViewController {
    private var currentHighlightedButton: ButtonName? {
        didSet {
            changeButtonsHighlight()
        }
    }
    
    private lazy var relayBrowsingHeaderView = RelayBrowsingHeaderView(frame: .zero)
    private lazy var relayListView = RelayListView(frame: .zero, type: .browse)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.backgroundColor = .relayBlack
        
        currentHighlightedButton = .entire

        setupButtonMethod()
        setupLayout()
    }
}

extension RelayBrowsingViewController {
    enum ButtonName: String {
        case entire = "전체"
        case running = "달리는중"
        case completed = "완주"
    }
    
    private func setupLayout() {
        [
            relayBrowsingHeaderView,
            relayListView
        ].forEach { view.addSubview($0) }
        
        relayBrowsingHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(57.0)
        }
        
        relayListView.snp.makeConstraints {
            $0.top.equalTo(relayBrowsingHeaderView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setupButtonMethod() {
        relayBrowsingHeaderView.entireTitleView.titleButton.tag = 0
        relayBrowsingHeaderView.completedTitleView.titleButton.tag = 1
        relayBrowsingHeaderView.runningTitleView.titleButton.tag = 2
        
        relayBrowsingHeaderView.entireTitleView.titleButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        relayBrowsingHeaderView.completedTitleView.titleButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        relayBrowsingHeaderView.runningTitleView.titleButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        
        relayListView.listHeaderView?.listFilterButton.addTarget(self, action: #selector(touchListViewFilterButton), for: .touchUpInside)
    }
    
    private func changeButtonsHighlight() {
        switch currentHighlightedButton {
        case .entire:
            onButtonHighlight(.entire)
            offButtonHighlight(.running)
            offButtonHighlight(.completed)
        case .running:
            offButtonHighlight(.entire)
            onButtonHighlight(.running)
            offButtonHighlight(.completed)
        case .completed:
            offButtonHighlight(.entire)
            offButtonHighlight(.running)
            onButtonHighlight(.completed)
        default:
            break
        }
    }
    
    private func onButtonHighlight(_ buttonName: ButtonName) {
        let title = buttonName.rawValue
        let underlineView: UIView
        let button: UIButton
        
        var titleAttribute = AttributedString(title)
        titleAttribute.font = .systemFont(ofSize: 24.0, weight: .bold)
        
        switch buttonName {
        case .entire:
            underlineView = relayBrowsingHeaderView.entireTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.entireTitleView.titleButton
            

        case .running:
            underlineView = relayBrowsingHeaderView.runningTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.runningTitleView.titleButton

        case .completed:
            underlineView = relayBrowsingHeaderView.completedTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.completedTitleView.titleButton
        }
        
        titleAttribute.foregroundColor = .relayBlack
        underlineView.isHidden = false
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
    }
    
    private func offButtonHighlight(_ buttonName: ButtonName) {
        let title = buttonName.rawValue
        let underlineView: UIView
        let button: UIButton
        
        var titleAttribute = AttributedString(title)
        titleAttribute.font = .systemFont(ofSize: 24.0, weight: .bold)
        
        switch buttonName {
        case .entire:
            underlineView = relayBrowsingHeaderView.entireTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.entireTitleView.titleButton

        case .running:
            underlineView = relayBrowsingHeaderView.runningTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.runningTitleView.titleButton

        case .completed:
            underlineView = relayBrowsingHeaderView.completedTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.completedTitleView.titleButton
        }
        
        titleAttribute.foregroundColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1.0)
        underlineView.isHidden = true
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
    }
    
    @objc private func touchButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            currentHighlightedButton = .entire
        case 1:
            currentHighlightedButton = .completed
        case 2:
            currentHighlightedButton = .running
        default:
            break
        }
    }
    
    @objc private func touchListViewFilterButton() {
        print("리스트필터 버튼 터치됨")
        
        let vc = ViewController()
        
        vc.modalPresentationStyle = .popover
        present(vc, animated: true)
    }
}
