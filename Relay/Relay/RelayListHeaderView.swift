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
        
        return label
    }()
    
    private lazy var listFilterButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "slider.horizontal.3")
        
        button.tintColor = .black
        button.setTitle("카테고리 전체", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .center
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 0.0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        button.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 12.0, bottom: 5.0, right: 18.0)
        
        
        button.layer.cornerRadius = 14.0
        button.layer.borderWidth = 1.0
        
        return button
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
    
    init(frame: CGRect, type: ViewType) {
        super.init(frame: frame)
        
        setupLayout(type)
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
    
    enum ViewType: String {
        case browse
        case started = "내가 시작한 릴레이"
        case participated = "내가 참여한 릴레이"
        case like = "좋아요한 릴레이"
    }
    
    private func setupLayout(_ viewType: ViewType) {
        setupListTitleLayout(viewType)
        
        addSubview(listMenuButton)
        
        listMenuButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20.0)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func setupListTitleLayout(_ viewType: ViewType) {
        switch viewType {
        case .browse:
            addSubview(listFilterButton)
            
            listFilterButton.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(20.0)
                $0.centerY.equalToSuperview()
            }
            
        default:
            listTitleLabel.text = viewType.rawValue
            
            addSubview(listTitleLabel)
            
            listTitleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(20.0)
                $0.centerY.equalToSuperview()
            }
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

