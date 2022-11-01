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
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        
        title.text = "릴레이 설명"
        title.font = .boldSystemFont(ofSize: 36)
        
        return title
    }()
    
    private let contentLabel: UILabel = {
        let content = UILabel()
        
        content.text = "어플을 설명하는 문장입니다\n어플을 설명하는 문장입니다\n어플을 설명하는 문장입니다"
        content.numberOfLines = 3
        content.font = .systemFont(ofSize: 17)
        
        return content
    }()
    
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        let myImage: UIImage = UIImage(named: "onboardingImage")!
        imageView.image = myImage
        
        return imageView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont(name: "SF Pro", size: 16)
        button.addTarget(self, action: #selector(pressedStartButton), for: .touchUpInside)
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout(){
        [
            skipButton,
            titleLabel,
            contentLabel,
            onboardingImageView,
            startButton,
            pageController
          
        ].forEach { view.addSubview($0) }
        
        skipButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(160.0)
            $0.leading.equalToSuperview().inset(50.0)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(43.0)
            $0.leading.equalToSuperview().offset(50.0)
        }
        onboardingImageView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(105.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(116.0)
            $0.height.equalTo(125.0)
        }
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(75.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(350.0)
            $0.height.equalTo(56.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        pageController.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(50.0)
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
