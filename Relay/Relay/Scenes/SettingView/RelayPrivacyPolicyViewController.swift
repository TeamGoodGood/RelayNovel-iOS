//
//  RelayPrivacyPolicyViewController.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/10.
//

import UIKit
import SnapKit

class RelayPrivacyPolicyViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private let privacyPolicyLabel: UILabel = {
        let label = UILabel()
        let content = """
개인정보 처리방침

굳굳(이하 “회사” 또는 “굳굳”이라 함)은 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법, 통신비밀보호법 등 정보통신서비스 제공자가 준수하여 할 관련 법령상의 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보취급방침을 정하여 이용자의 권익 보호를 위해 최선을 다하고 있습니다.


1. 개인정보 수집 항목
회사는 다음의 개인정보 항목을 처리하고 있습니다.
- 애플 계정으로 회원가입: [필수] 소셜 ID, 이메일

2. 개인정보 수집
서비스 제공을 위한 필요 최소한의 개인정보를 수집하고 있습니다.
필수정보의 수집: 이메일
서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록

3. 개인정보 이용
회사는 아래의 목적을 위하여 개인정보를 이용하며, 명시된 목적 이외의 용도로는 이용하지 않습니다.
- 회원관리, 서비스 제공 및 개선, 신규 서비스 개발

4. 개인정보의 제공
회사는 이용자의 별도 동의가 있는 경우나 법령에 규정된 경우를 제외하고는 이용자의 개인정보를 제3자에게 제공하지 않습니다.

5. 개인정보 파기
회사는 개인정보는 수집 및 이용목적이 달성되면 지체없이 파기합니다.

6. 이용자의 권리와 의무
이용자의 개인정보를 가장 소중한 가치로 여기고 개인정보를 처리함에 있어서 다음과 같은 노력을 다하고 있습니다.
- 이용자의 개인정보를 암호화하고 있습니다.
- 이용자의 개인정보를 암호화된 통신구간을 이용하여 전송하고, 비밀번호 등 중요정보는 암호화하여 보관하고 있습니다.
- 해킹이나 컴퓨터 바이러스로부터 보호하기 위하여 노력하고 있습니다.
- 소중한 개인정보에 접근할 수 있는 사람을 최소화하고 있습니다.

7. 개인정보 보호책임자
서비스를 이용하면서 발생하는 모든 개인정보보호 관련 문의, 불만, 조언이나 기타 사항은 개인정보 보호책임자 및 담당부서로 연락해주시기 바랍니다. 회사는 이용자의 목소리에 귀 기울이고 신속하고 충분한 답변을 드릴 수 있도록 최선을 다하겠습니다.

책임자: 누구? (~~@gmail.com)

8. 개인정보처리방침의 변경
법률이나 서비스 변경사항을 반영하기 위한 목적 등으로 개인정보처리 방침을 수정할 수 있습니다. 개인정보처리방침이 변경되는 경우 회사는 변경 사항을 게시하며, 변경된 개인정보처리방침은 게시한 날로부터 7일 후부터 효력이 발생합니다.

다만, 수집하는 개인정보의 항목, 이용목적의 변경 등과 같이 이용자 권리의 중대한 변경이 발생할 때에는 최소 30일 전에 미리 알려드리겠습니다.

공고일자: 2022년 00월 00일
시행일자: 2022년 00월 00일

"""
        label.numberOfLines = 0
        label.sizeToFit()
        label.setLineHeight(text: content, lineHeight: 24.0)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        view.backgroundColor = .white
        setupLayout()
        scrollView.addSubview(privacyPolicyLabel)
    }
}

extension RelayPrivacyPolicyViewController {
    private func setupLayout() {
        [
            scrollView,
            privacyPolicyLabel
        ].forEach { view.addSubview($0) }
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview().inset(20.0)
        }
        privacyPolicyLabel.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.height.equalTo(privacyPolicyLabel)
        }
    }
}
