//
//  test.swift
//  Relay
//
//  Created by 이창형 on 2022/10/31.
//

import UIKit
import SnapKit

class test: UIViewController {
  
  private let width = 155.0
  private let height = 26.0
  private let someView = UIView()
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.someView.backgroundColor = .white
      self.someView.layer.cornerRadius = 20
    
    self.view.addSubview(self.someView)
    
    self.someView.snp.makeConstraints {
        $0.top.equalToSuperview().inset(602.0)
        $0.leading.equalToSuperview().inset(122.0)
        $0.trailing.equalToSuperview().inset(113.0)
        $0.bottom.equalToSuperview().inset(216.0)
    }
    
    let path = CGMutablePath()

      path.move(to: CGPoint(x: self.width / 2 - 10, y: self.height)) // 시작 위치
      path.addLine(to: CGPoint(x: self.width / 2, y: self.height + 10))
      path.addLine(to: CGPoint(x: self.width / 2 + 10, y: self.height))
      
    let shape = CAShapeLayer()
    shape.path = path
    shape.fillColor = UIColor.gray.cgColor

    self.someView.layer.insertSublayer(shape, at: 0)
  }
}
