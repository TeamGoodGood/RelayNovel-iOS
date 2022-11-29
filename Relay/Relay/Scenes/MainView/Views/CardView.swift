//
//  CardView.swift
//  Relay
//
//  Created by 이창형 on 2022/11/10.
//

import SwiftUI

struct CardView: View {
    @State var isPlaying: Bool = false
    let story: Story
    let playlist = Playlist()
    
    var body: some View {
        Rectangle()
            .overlay {
                ZStack{
                    VStack(spacing: 0){
                        HStack(spacing: 0){
                            
                            Text(playlist.getBGMName(id: story.bgm))
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 25)
                            
                            Spacer()
                            
                            Button{
                                isPlaying.toggle()
                            } label: {
                                Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32))
                            }
                            .padding(.top, 25)
                        }
                        HStack(spacing: 0){
                            Text(playlist.getBGMHashTag(id: story.bgm))
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
                            Text(story.title)
                                .font(.system(size: 24))
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.bottom, 8)
                        HStack(spacing: 0){
                            Text("\(story.current_step) / \(story.step_limit)")
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
                            Text(" \(story.genre)")
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

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
