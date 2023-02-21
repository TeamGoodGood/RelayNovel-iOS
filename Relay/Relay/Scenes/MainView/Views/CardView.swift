//
//  CardView.swift
//  Relay
//
//  Created by 이창형 on 2022/11/10.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var observable: RelayMainViewControllerObservable
    @State var isPlaying: Bool = false
    
    let story: Story
    let page: Int
    let playlist = Playlist()
    
    var body: some View {
        
        Rectangle()
            .overlay {
                ZStack{
                    Image("playlistBackgroundImage\(story.bgm + 1)")
                        .resizable()
                    
                    VStack(spacing: 0){
                        HStack(spacing: 0){
                            Text("\(Image(systemName: "music.note")) \(playlist.getBGMHashTag(id: story.bgm))")
                                .font(.system(size: 17))
                                .bold()
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button{
                                if isPlaying {
                                    if page == observable.nowPlayingPage {
                                        observable.pauseMusic()
                                        observable.nowPlayingPage = nil
                                        isPlaying = false
                                    } else {
                                        observable.nowPlayingPage = page
                                        observable.playMusic(bgmID: story.bgm)
                                    }
                                } else {
                                    if page == observable.nowPlayingPage {
                                        observable.playMusic()
                                    } else {
                                        observable.nowPlayingPage = page
                                        observable.playMusic(bgmID: story.bgm)
                                    }
                                    isPlaying = true
                                }
                            } label: {
                                Image(systemName: page == observable.nowPlayingPage ? "pause.circle" : "play.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32))
                            }
                        }
                        .padding(.top, 25)
                        
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
