//
//  RelayOnboardingViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/10/31.
//

import UIKit
import SnapKit

class RelayOnboardingViewController: UIViewController {
    
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
    
    private var pageController: UIPageControl = {
        let controller = UIPageControl()
        
        controller.currentPage = 0
        controller.numberOfPages = 3
        controller.currentPageIndicatorTintColor = .systemPink
        controller.pageIndicatorTintColor = .systemGray
        
        return controller
    }()
    
    private var currentPage = 0 {
        didSet {
            pageController.currentPage = currentPage
            if currentPage != 3 {
                startButton.isHidden = true
                skipButton.isHidden = false
                pageController.isHidden = false
            }
            else {
                startButton.isHidden = false
                skipButton.isHidden = true
                pageController.isHidden = true
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - func
    private func setupLayout(){
        [
            skipButton,
            startButton,
            pageController
            
        ].forEach { view.addSubview($0) }
        
        skipButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(75.0)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.width.equalTo(350.0)
            $0.height.equalTo(56.0)
        }
        pageController.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(85.0)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc private func pressedSkipButton(_ sender: UIButton) {
        //건너뛰기 기능 구현 예정
    }
    @objc private func pressedStartButton(_ sender: UIButton) {
        //시작하기 기능 구현 예정
    }
}
