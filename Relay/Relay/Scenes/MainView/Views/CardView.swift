//
//  CardView.swift
//  Relay
//
//  Created by 이창형 on 2022/11/10.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        Rectangle()
            .overlay {
                ZStack{
//                    Image("1")
//                        .resizable()
                    VStack(spacing: 0){
                        HStack(spacing: 0){
                            
                            Text("플레이리스트 제목")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 25)
                            
                            Spacer()
                            
                            Button{
                                
                            } label: {
                                Image(systemName: "play.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32))
                            }
                            .padding(.top, 25)
                        }
                        HStack(spacing: 0){
                            Text("#곡 무드 태그")
                                .foregroundColor(.white)
                                .font(.system(size: 13))
                                .padding(.top, 4)
                            Spacer()
                        }
                        Spacer()
                        HStack(spacing: 0){
                            Text("바통을 이어받으세요")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        HStack(spacing: 0){
                            Text("소설 제목입니다")
                                .font(.system(size: 24))
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.bottom, 8)
                        HStack(spacing: 0){
                            Text("9 / 10")
                                .font(.system(size: 17))
                                .bold()
                                .foregroundColor(.white)
                            Text(" 터치 ")
                                .font(.system(size: 17))
                                .bold()
                                .foregroundColor(.white)
                            Image(systemName: "circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 5))
                            Text(" SF")
                                .font(.system(size: 17))
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.bottom, 25)
                        
                    }.padding(.horizontal, 20)
                }
            }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
