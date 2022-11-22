//
//  RelayOnboardingViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/10/31.
//

import UIKit
import SnapKit

class RelayOnboardingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let swipeItems = [
        RelayOnboardingDataModel(image: "onboardingImage", titleLabel: "함께 완성하는 릴레이 소설", descriptionLabel: "여러명의 주자들과 함께 \n릴레이 소설을 완성해보세요."),
        RelayOnboardingDataModel(image: "onboardingImage", titleLabel: "새로운 플레이리스트", descriptionLabel: "매일 새로운 플레이리스트를 통해 \n소설에 몰입해보세요!"),
        RelayOnboardingDataModel(image: "onboardingImage", titleLabel: "바통을 이어받으세요!", descriptionLabel: "바통을 이어받아 어디로 튈지 모르는 \n릴레이 소설의 매력을 느껴보세요")
    ]
    
    private var pageControl: UIPageControl = {
        let controller = UIPageControl()
        
        controller.currentPage = 0
        controller.numberOfPages = 3
        controller.currentPageIndicatorTintColor = .systemPink
        controller.pageIndicatorTintColor = .systemGray
        
        return controller
    }()
    
    private let skipButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("건너뛰기", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro", size: 16)
        button.addTarget(self, action: #selector(pressedSkipButton), for: .touchUpInside)
        
        return button
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont(name: "SF Pro", size: 16)
        button.addTarget(self, action: #selector(pressedStartButton), for: .touchUpInside)
        button.isHidden = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        setupLayout()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return swipeItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelayOnboardingViewCell.reuseIdentifier, for: indexPath) as! RelayOnboardingViewCell
        let swipeItem = swipeItems[indexPath.item]
        cell.update(image: swipeItem.image, headline: swipeItem.titleLabel, subheadline: swipeItem.descriptionLabel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        
        if currentPage != 2 {
            startButton.isHidden = true
            skipButton.isHidden = false
            pageControl.isHidden = false
        }
        else {
            startButton.isHidden = false
            skipButton.isHidden = true
            pageControl.isHidden = true
        }
    }
}

extension RelayOnboardingViewController{
    private func setupLayout(){
        [
            skipButton,
            startButton,
            pageControl,
            
        ].forEach { view.addSubview($0) }
        
        skipButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(95.0)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.width.equalTo(350.0)
            $0.height.equalTo(56.0)
        }
        pageControl.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(115.0)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc private func pressedSkipButton(_ sender: UIButton) {
        //건너뛰기 기능 구현 예정
    }
    
    @objc private func pressedStartButton(_ sender: UIButton) {
        let toRelayLoginView = RelayLoginViewController()
           toRelayLoginView.modalPresentationStyle = .fullScreen
           present(toRelayLoginView, animated: false, completion: nil)
    }
    
    func configureViewController() {
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(RelayOnboardingViewCell.self, forCellWithReuseIdentifier: RelayOnboardingViewCell.reuseIdentifier)
    }
}
