//
//  RelayAgreementViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/01.
//

import UIKit
import SnapKit
// TODO: 색깔 임의로 지정했기 때문에 extension 나오면 수정 필요
class RelayAgreementViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "서비스 이용 동의"
        label.font = .boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    private let allAgreeButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        
        button.setTitle("전체 동의하기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
        
        button.setImage(image, for: .normal)
        
        button.tintColor = .systemGray5
        
        button.addTarget(self, action: #selector(agreeCheck(sender:)), for: .touchUpInside)
        
        button.contentHorizontalAlignment = .leading
        
        button.tag = 3
        
        return button
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        return view
    }()
    
    private var allAgreeCheck = false {
        didSet {
            if allAgreeCheck {
                allAgreeButton.tintColor = UIColor(named: "MainColor")
            } else {
                allAgreeButton.tintColor = .systemGray5
            }
        }
    }
    private var firstAgreeCheck = false {
        didSet {
            if firstAgreeCheck {
                firstAgreeButton.tintColor = UIColor(named: "MainColor")
            } else {
                firstAgreeButton.tintColor = .systemGray5
            }
        }
    }
    private var secondAgreeCheck = false {
        didSet {
            if secondAgreeCheck {
                secondAgreeButton.tintColor = UIColor(named: "MainColor")
            } else {
                secondAgreeButton.tintColor = .systemGray5
            }
        }
    }
    private var thirdAgreeCheck = false {
        didSet {
            if thirdAgreeCheck {
                thirdAgreeButton.tintColor = UIColor(named: "MainColor")
            } else {
                thirdAgreeButton.tintColor = .systemGray5
            }
        }
    }
    private var forthAgreeCheck = false {
        didSet {
            if forthAgreeCheck {
                forthAgreeButton.tintColor = UIColor(named: "MainColor")
            } else {
                forthAgreeButton.tintColor = .systemGray5
            }
        }
    }
    
    // TODO: 차후에 collectionView로 리펙토링 필요
    // 정해진 약관이 없어서 이름 이렇게 해놨습니다
    private lazy var firstAgreeButton: UIButton = {
        let button = makeAgreeButton(text: "만 14세 이상입니다.")
        
        button.tag = 4
        
        return button
    }()
    
    private lazy var secondAgreeButton: UIButton = {
        let button = makeAgreeButton(text: "(필수) 서비스 이용약관")
        
        button.tag = 5
        
        return button
    }()
    
    private lazy var secondDetailButton: UIButton = {
        let button = makeDetailButton()
        button.tag = 0
        
        return button
    }()
    
    private lazy var thirdAgreeButton: UIButton = {
        let button = makeAgreeButton(text: "(필수) 개인정보 처리방침")
        
        button.tag = 6
        
        return button
    }()
    
    private lazy var thirdDetailButton: UIButton = {
        let button = makeDetailButton()
        button.tag = 1
        
        return button
    }()
    
    private lazy var forthAgreeButton: UIButton = {
        let button = makeAgreeButton(text: "(선택) 마케팅 정보 수신동의")
        
        button.tag = 7
        
        return button
    }()
    
    private lazy var forthDetailButton: UIButton = {
        let button = makeDetailButton()
        button.tag = 2
        
        return button
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.systemGray3, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        
        button.backgroundColor = .systemGray5
        
        button.layer.cornerRadius = 8
        
        button.isEnabled = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
}

extension RelayAgreementViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        // 크기 변경 감지 경우
    }
}

extension RelayAgreementViewController {
    
    private func setupLayout() {
        [
            titleLabel,
            allAgreeButton,
            divider,
            firstAgreeButton,
            secondAgreeButton,
            secondDetailButton,
            thirdAgreeButton,
            thirdDetailButton,
            forthAgreeButton,
            forthDetailButton,
            submitButton
            
        ].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(115.0)
            $0.leading.equalToSuperview().inset(21.0)
        }
        allAgreeButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(250.0)
        }
        divider.snp.makeConstraints {
            $0.top.equalTo(allAgreeButton.snp.bottom).offset(25.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(1.0)
        }
        firstAgreeButton.snp.makeConstraints {
            $0.top.equalTo(allAgreeButton.snp.bottom).offset(49.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(250.0)
        }
        secondAgreeButton.snp.makeConstraints {
            $0.top.equalTo(firstAgreeButton.snp.bottom).offset(31.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(250.0)
        }
        secondDetailButton.snp.makeConstraints {
            $0.top.equalTo(secondAgreeButton.snp.top)
            $0.trailing.equalToSuperview().inset(22.0)
        }
        thirdAgreeButton.snp.makeConstraints {
            $0.top.equalTo(secondAgreeButton.snp.bottom).offset(31.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(250.0)
        }
        thirdDetailButton.snp.makeConstraints {
            $0.top.equalTo(thirdAgreeButton)
            $0.trailing.equalToSuperview().inset(22.0)
        }
        forthAgreeButton.snp.makeConstraints {
            $0.top.equalTo(thirdAgreeButton.snp.bottom).offset(31.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(250.0)
        }
        forthDetailButton.snp.makeConstraints {
            $0.top.equalTo(forthAgreeButton)
            $0.trailing.equalToSuperview().inset(22.0)
        }
        submitButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34.44)
            $0.height.equalTo(52.56)
            $0.leading.equalToSuperview().inset(15.0)
            $0.trailing.equalToSuperview().inset(15.0)
        }
    }
    
    private func makeAgreeButton(text: String) -> UIButton {
        let agreeButton: UIButton = {
            let button = UIButton(type: .custom)
            let config = UIImage.SymbolConfiguration(pointSize: 22)
            let image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
            
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16)
            button.setTitleColor(.black, for: .normal)
            button.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
            
            button.setImage(image, for: .normal)
            button.tintColor = .systemGray5
            
            button.contentHorizontalAlignment = .leading
            
            button.addTarget(self, action: #selector(agreeCheck(sender:)), for: .touchUpInside)
            
            return button
        }()
        
        return agreeButton
    }
    
    private func makeDetailButton() -> UIButton {
        let detailVC = view
        let detailButton: UIButton = {
            let button = UIButton(type: .custom)
            let config = UIImage.SymbolConfiguration(pointSize: 16)
            let image = UIImage(systemName: "chevron.right", withConfiguration: config)
            
            button.setImage(image, for: .normal)
            button.tintColor = .black
            
            button.addTarget(self, action: #selector(goToDetailView(sender:)), for: .touchUpInside)
            
            return button
        }()
        
        return detailButton
    }
    
    @objc func goToDetailView(sender: UIButton) {
        
        let detailVC = DetailViewController()
        
        if let sheet = detailVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            
            sheet.delegate = self
            
            sheet.prefersGrabberVisible = true
        }
        switch sender.tag {
        case 0:
            detailVC.detailLabel.text = "hello"
            
        case 1:
            detailVC.detailLabel.text = "ggggg"
            
        case 2:
            detailVC.detailLabel.text = "ddddddd"
            
        default:
            return
        }
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @objc
    func agreeCheck(sender: UIButton) {
        switch sender.tag {
        case 3:
            allAgreeCheck.toggle()
            allToggle(allAgreeCheck)
        case 4:
            firstAgreeCheck.toggle()
        case 5:
            secondAgreeCheck.toggle()
        case 6:
            thirdAgreeCheck.toggle()
        case 7:
            forthAgreeCheck.toggle()
        default:
            return
        }
        checkNextStep()
    }
    
    func allToggle(_ allCheck: Bool) {
        if allCheck {
            firstAgreeCheck = true
            secondAgreeCheck = true
            thirdAgreeCheck = true
            forthAgreeCheck = true
        } else {
            firstAgreeCheck = false
            secondAgreeCheck = false
            thirdAgreeCheck = false
            forthAgreeCheck = false
        }
    }
    
    func checkNextStep() {
        if firstAgreeCheck && secondAgreeCheck && thirdAgreeCheck {
            submitButton.backgroundColor = .black
            submitButton.setTitleColor(.white, for: .normal)
            submitButton.isEnabled = true
        } else {
            submitButton.backgroundColor = .systemGray5
            submitButton.setTitleColor(.systemGray3, for: .normal)
            submitButton.isEnabled = false
        }
    }
}
