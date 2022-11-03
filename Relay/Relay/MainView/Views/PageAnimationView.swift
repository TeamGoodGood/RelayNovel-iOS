//
//  PageAnimationView.swift
//  Relay
//
//  Created by 이창형 on 2022/11/03.
//

// TODO: 서버 연결 할때 로직 구현 필요
import UIKit
import SwiftUI
import SwiftUIPager

struct PageAnimationView: View {
    @StateObject var page1: Page = .first()
    @StateObject var page2: Page = .first()
    var data = Array(0..<6)
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 10) {
                Pager(page: self.page2,
                      data: self.data,
                      id: \.self) {
                    self.pageView($0)
                }
                      .itemSpacing(10)
                      .loopPages(true)
                      .horizontal(.startToEnd)
                      .interactive(scale: 0.8)
                      .itemAspectRatio(0.7)
                      .background(.white)
            }
        }
    }
    
    func pageView(_ page: Int) -> some View {
        ZStack {
            
            if page == 0 {
                Rectangle()
                    .overlay {
                        Image("1")
                            .resizable()
                    }
            }
            
            if page == 1 {
                Rectangle()
                    .overlay {
                        Image("2")
                            .resizable()
                    }
            }
            
            if page == 2 {
                Rectangle()
                    .overlay {
                        Image("3")
                            .resizable()
                    }
            }
            
            if page == 3 {
                Rectangle()
                    .overlay {
                        Image("1")
                            .resizable()
                    }
            }
            
            if page == 4 {
                Rectangle()
                    .overlay {
                        Image("2")
                            .resizable()
                    }
            }
            
            if page == 5 {
                Rectangle()
                    .overlay {
                        Image("3")
                            .resizable()
                    }
            }
        }
        .cornerRadius(16)
    }
}
