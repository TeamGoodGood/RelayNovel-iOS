//
//  RelayCategoryViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/04.
//

import UIKit
import SnapKit

// TODO: 플레이리스트 모달로도 재사용 가능하도록 리팩토링 필요
class RelayCategoryViewController: UIViewController {
    var categoryList: [Category]
    private var selectedCategory: Category?
    
    weak var delegate: RelayCategoryDelegate?
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RelayCategoryCollectionViewCell.self, forCellWithReuseIdentifier: RelayCategoryCollectionViewCell.id)
        
        return collectionView
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton()
        
        var titleAttribute = AttributedString("적용하기")
        titleAttribute.font = .systemFont(ofSize: 16.0, weight: .bold)
        titleAttribute.foregroundColor = UIColor.white
        
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: -11.0, left: 0.0, bottom: 11.0, right: 0.0)
        button.backgroundColor = .relayPink1
        
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        return button
    }()
    
    init(list: [Category]) {
        categoryList = list
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupLayout()
    }
}

extension RelayCategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = 53.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = categoryList[indexPath.row]
        delegate?.playMusic()
    }
}

extension RelayCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelayCategoryCollectionViewCell.id, for: indexPath) as? RelayCategoryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(categoryList[indexPath.row].name, index: indexPath.row)
        
        if indexPath.row == 0 {
            cell.layer.addBorder([.bottom], color: UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0), width: 1.0)
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
        
        if let category = selectedCategory {
            if category.name == "전체" {
                let indexPath0 = IndexPath(row: 0, section: 0)
                collectionView.selectItem(at: indexPath0, animated: false, scrollPosition: .init())
            } else {
                let categoryIndexPath = IndexPath(row: categoryList.firstIndex(of: category) ?? 0, section: 0)
                collectionView.selectItem(at: categoryIndexPath, animated: false, scrollPosition: .init())
            }
        } else {
            let indexPath0 = IndexPath(row: 0, section: 0)
            collectionView.selectItem(at: indexPath0, animated: false, scrollPosition: .init())
        }
        
        return cell
    }
}

extension RelayCategoryViewController {
    private func setupLayout() {
        [
            categoryCollectionView,
            applyButton
        ].forEach { view.addSubview($0) }
        
        
        categoryCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.leading.equalTo(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(530.0)
        }
        
        applyButton.snp.makeConstraints {
            $0.top.equalTo(categoryCollectionView.snp.bottom).offset(16.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(80.0)
        }
    }
    
    func fetchSelectedCateogry(_ cateogry: Category?) {
        selectedCategory = cateogry
    }
    
    @objc private func dismissViewController() {
        if let selectedCategory = self.selectedCategory {
            delegate?.didApplyCategory(selectedCategory: selectedCategory)
        } else {
            delegate?.didApplyCategory(selectedCategory: categoryList.first ?? Category(id: 0, name: "불명확한 카테고리"))
        }
        
        dismiss(animated: true)
    }
}


protocol RelayCategoryDelegate: AnyObject {
    func didApplyCategory(selectedCategory: Category)
    
    func playMusic()
}
