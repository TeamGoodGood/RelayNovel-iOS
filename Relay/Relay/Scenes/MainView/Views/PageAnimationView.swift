// TODO: 서버 연결 할때 로직 구현 필요
import SwiftUI
import SwiftUIPager

struct PageAnimationView: View {
    @ObservedObject var observable: RelayMainViewControllerObservable
    
    @StateObject var page1: Page = .first()
    @StateObject var page2: Page = .first()

    var data = Array(0..<6)
    var recommend: Recommend
    
    var body: some View {
            ZStack{
                VStack{
                    Spacer()
                    Image("7")
                        .resizable()
                        .scaledToFit()
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 70)
                }
                GeometryReader { proxy in
                    VStack(spacing: 31) {
                        Pager(page: self.page2,
                              data: self.data,
                              id: \.self) { pageNumber in
                            self.pageView(pageNumber)
                                .onTapGesture {
                                    observable.pageNumber = pageNumber
                                    observable.onTouchAction()
                                }
                        }
                              .itemSpacing(10)
                              .loopPages(true)
                              .horizontal(.startToEnd)
                              .interactive(scale: 0.8)
                              .itemAspectRatio(0.7)
                              .background(.white)
                              .frame(height: 400)
                        
                        Pager(page: self.page2,
                              data: self.data,
                              id: \.self) {
                            self.pageView2($0)
                        }.itemSpacing(100)
                            .loopPages(true)
                            .horizontal(.startToEnd)
                            .interactive(scale: 0.6)
                            .itemAspectRatio(0.4)
                            .frame(height: 100)
                    }
                }
            }
    }
    
    func pageView(_ page: Int) -> some View {
        ZStack {
            if page == 0 {
                Rectangle()
                    .overlay {
                        CardView(observable: observable, story: recommend.story1, page: 0)
                    }
            }
            
            if page == 1 {
                Rectangle()
                    .overlay {
                        CardView(observable: observable, story: recommend.story2, page: 1)
                    }
            }
            
            if page == 2 {
                Rectangle()
                    .overlay {
                        CardView(observable: observable, story: recommend.story3, page: 2)
                    }
            }
            
            if page == 3 {
                Rectangle()
                    .overlay {
                        CardView(observable: observable, story: recommend.story1, page: 0)
                    }
            }
            
            if page == 4 {
                Rectangle()
                    .overlay {
                        CardView(observable: observable, story: recommend.story2, page: 1)
                    }
            }
            
            if page == 5 {
                Rectangle()
                    .overlay {
                        CardView(observable: observable, story: recommend.story3, page: 2)
                    }
            }
        }
        .cornerRadius(16)
    }
    
    func pageView2(_ page: Int) -> some View {
        ZStack {
            
            if page == 0 {
                Image("4")
                    .resizable()
                    .frame(width: 80, height: 86.22)
            }
            
            if page == 1 {
                Image("5")
                    .resizable()
                    .frame(width: 80, height: 86.22)
            }
            
            if page == 2 {
                Image("6")
                    .resizable()
                    .frame(width: 80, height: 86.22)
            }
            
            if page == 3 {
                Image("4")
                    .resizable()
                    .frame(width: 80, height: 86.22)
            }
            
            if page == 4 {
                Image("5")
                    .resizable()
                    .frame(width: 80, height: 86.22)
            }
            
            if page == 5 {
                Image("6")
                    .resizable()
                    .frame(width: 80, height: 86.22)
            }
        }
    }
}
