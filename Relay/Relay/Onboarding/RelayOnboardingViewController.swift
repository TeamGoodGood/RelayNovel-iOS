//
//  RelayOnboardingViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/10/31.
//

import UIKit
import SnapKit

class RelayOnboardingViewController: UIPageViewController {
    
    //MARK: property
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let initialPage = 0
    private var currentpage = 0 {
           didSet {
               print("didSet \(currentpage)")
               pageController.currentPage = currentpage
               if currentpage != 2 {
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
    
    //MARK: UI Components
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
    
    // MARK: Life Cycle Method
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        // transitionStyle이 default 값이 pagecurl이라 그 스타일을 scroll로 바꿔줬습니다.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        setupLayout()
    }
}
    extension RelayOnboardingViewController {
        //MARK: Private func
        private func setup() {
            dataSource = self
            delegate = self
            
            pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
            
            let page1 = RelayFirstViewController()
            let page2 = RelaySecondViewController()
            let page3 = RelayThirdViewController()
            
            pages.append(page1)
            pages.append(page2)
            pages.append(page3)
            
            
            setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
            
        }
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
    
    // MARK: - Actions
    
    extension RelayOnboardingViewController {
        //FIXME: 해당 함수가 동작하지 않습니다.. 무언가 충돌이 일어나는 것 같아요! 다른 코드를 전부 해석해야 할 것 같아서 못 만졌습니다 ㅜㅜ
        @objc func pageControlTapped(_ sender: UIPageControl) {
            setViewControllers([pages[sender.currentPage]], direction: .forward, animated: false, completion: nil)
        }
    }
    
    // MARK: - DataSources
    
    extension RelayOnboardingViewController: UIPageViewControllerDataSource {
        //FIXME: currentIndex didset에서 오류가 발생하는 듯 합니다. 이 또한 코드를 다 해석해야 할 것 같아... 못 했습니다..
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            print("before")
            guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
            currentpage = currentIndex - 1
            if currentIndex == 0 {
                return nil
            } else {
                currentpage = currentIndex - 1
                return pages[currentIndex - 1]
            }
                    

        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
            if currentIndex < pages.count - 1 {
                currentpage = currentIndex + 1
                return pages[currentIndex + 1]
            } else {
                return nil
            }
               }

    }
    
    // MARK: - Delegates
    
    extension RelayOnboardingViewController: UIPageViewControllerDelegate {
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            guard let viewControllers = pageViewController.viewControllers else { return }
            guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
            
            pageControl.currentPage = currentIndex
        }
    }
