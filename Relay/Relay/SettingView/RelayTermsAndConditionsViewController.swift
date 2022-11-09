//
//  RelayTermsAndConditionsViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/10.
//

import UIKit
import SnapKit

class RelayTermsAndConditionsViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        
        return scrollView
    }()
    
    private let termsAndConditions: UILabel = {
        let label = UILabel()
        let content = """
". 함은 이 약관 및 개인정보 제공에 동의하고, 회사로부터 서비스 이용 자격을 부여받은 대상자를 의미합니다.
        ③ “릴레이”이라 함은 회원이 서비스에 게시한 부호·문자 등의 정보 형태의 글 및 각종 파일과 링크 등을 의미합니다.
        2. 이 약관에서 사용하는 용어의 정의는 본 조에서 정하는 것을 제외하고는 개별 이용약관, 서비스 이용안내, 관계 법령 등에서 정하는 바에 따르며, 그 외에는 일반 상관례에 따릅니다.
"""
        label.numberOfLines = 200
        label.setLineHeight(text: content, lineHeight: 24.0)
        label.textAlignment = .left
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(termsAndConditions)
        view.backgroundColor = .blue
        setupLayout()
        scrollView.addSubview(termsAndConditions)
        scrollView.updateContentView()
        
    }
}

extension RelayTermsAndConditionsViewController {
    private func setupLayout() {
        [
            scrollView,
            termsAndConditions
        ].forEach { view.addSubview($0) }
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview().inset(20.0)
        }
        termsAndConditions.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.height.equalToSuperview()
        }
    }
}

extension UIScrollView {
    func updateContentView() {
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
    }
}
