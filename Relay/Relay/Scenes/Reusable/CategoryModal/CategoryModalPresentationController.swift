//
//  CategoryModalPresentationController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/04.
//

import UIKit

class CategoryModalPresentationController: UIPresentationController {
    
    let shadowView: UIView!
    var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
    var check: Bool = false
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        shadowView = UIView()
        shadowView.backgroundColor = .black
        super.init(presentedViewController: presentedViewController, presenting: presentedViewController)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        shadowView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        shadowView.isUserInteractionEnabled = true
        shadowView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        CGRect(origin: CGPoint(x: 0,
                               y: self.containerView!.frame.height * 198 / 844),
               size: CGSize(width: self.containerView!.frame.width,
                            height: self.containerView!.frame.height * 646 / 844))
    }
    
    // 모달이 올라갈 때 뒤에 있는 배경을 검은색 처리해주는 용도
    override func presentationTransitionWillBegin() {
        self.shadowView.alpha = 0
        self.containerView!.addSubview(shadowView)
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in self.shadowView.alpha = 0.5},
                                                                    completion: nil)
    }
    
    // 모달이 없어질 때 검은색 배경을 슈퍼뷰에서 제거
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in self.shadowView.alpha = 0},
                                                                    completion: { _ in self.shadowView.removeFromSuperview()})
    }
    
    // 모달의 크기가 조절됐을 때 호출되는 함수
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        shadowView.frame = containerView!.bounds
        self.presentedView?.layer.cornerRadius = 16.0
        self.presentedView?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.presentedView?.layer.masksToBounds = true
    }
    
    @objc func dismissController() {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}
