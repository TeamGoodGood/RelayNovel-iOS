//
//  RelayListHeaderView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/01.
//

import UIKit
import SnapKit

class RelayListHeaderView: UIView {
    private lazy var menuItems: [UIAction] = {
        let latest = UIAction(title: "최신순", state: .on) { [weak self] _ in
            self?.checkMenu(.latest)
        }
        let oldest = UIAction(title: "오래된순") { [weak self] _ in
            self?.checkMenu(.oldest)
        }
        let popularity = UIAction(title: "인기순") { [weak self] _ in
            self?.checkMenu(.popularity)
        }
        
        return [latest, oldest, popularity]
    }()
    
    private lazy var listTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.text = "내가 시작한 릴레이"
        
        return label
    }()
    
    private lazy var listMenuButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.down")
        
        button.tintColor = .black
        button.setTitle("최신순", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .center
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 4.0, bottom: 0.0, right: 0.0)
        
        let menu = UIMenu(
            title: "",
            options: [],
            children: menuItems
        )
        
        button.showsMenuAsPrimaryAction = true
        button.menu = menu
        
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

extension RelayListHeaderView {
    /// 정렬메뉴의 터치 구분하기 위한 enum문
    enum SortingType: Int {
        case latest = 0
        case oldest = 1
        case popularity = 2
    }
    
    private func setupLayout() {
        [
            listTitleLabel,
            listMenuButton
        ].forEach { addSubview($0) }
        
        listTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview().inset(21.0)
        }
        
        listMenuButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20.0)
            $0.centerY.equalTo(listTitleLabel.snp.centerY)
        }
    }
    
    /// 터치를 한 메뉴를 체크하는 메소드
    private func checkMenu(_ type: SortingType) {
        var state = (
            latest: UIMenuElement.State.off,
            oldest: UIMenuElement.State.off,
            popularity: UIMenuElement.State.off
        )
        
        switch type {
        case .latest:
            state.latest = .on
        case .oldest:
            state.oldest = .on
        case .popularity:
            state.popularity = .on
        }
        
        let menuItems: [UIAction] = {
            let latest = UIAction(title: "최신순", state: state.latest) { [weak self] _ in
                self?.checkMenu(.latest)
            }
            let oldest = UIAction(title: "오래된순", state: state.oldest) { [weak self] _ in
                self?.checkMenu(.oldest)
            }
            let popularity = UIAction(title: "인기순", state: state.popularity) { [weak self] _ in
                self?.checkMenu(.popularity)
            }
            
            return [latest, oldest, popularity]
        }()
        
        listMenuButton.menu = UIMenu(children: menuItems)
    }

}

