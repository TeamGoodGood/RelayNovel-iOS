//
//  RelayMainHostingController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/03.
//

import SwiftUI
import UIKit
import SnapKit
import AVFoundation

class RelayMainViewController: UIViewController {
    @ObservedObject var observable: RelayMainViewControllerObservable = RelayMainViewControllerObservable()
    private var recommend: Recommend?
    
    //TODO: 알람이 있을때 이미지 변경 필요
    private lazy var noticeButton = UIBarButtonItem(
        image: UIImage(systemName: "bell"),
        style: .plain,
        target: self,
        action: #selector(goToNoticeView)
    )
    
    private lazy var logoButton = UIBarButtonItem(
        image: UIImage(named: "RelayLogo")?.resize(newWidth: 56).withRenderingMode(.alwaysOriginal),
        style: .plain,
        target: self,
        action: nil
    )
    
    private let animationView: UIView = {
        let view = UIView()
        
        view.frame = CGRect(x: 50, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("릴레이 시작하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        
        button.backgroundColor = UIColor.relayBlack
        
        button.layer.cornerRadius = 8
        
        button.isEnabled = true
        
        button.addTarget(self, action: #selector(goToWritingView), for: .touchUpInside)
        
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        observable.nowPlayingPage = nil
        observable.playingPlaylistID = nil
        observable.stopMusic()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //TODO: 데이터호출 API로 변경
        recommend = mockRecommend.recommend
        
        observable.onTouchAction = { [weak self] in
            guard let pageNumber = self?.observable.pageNumber else { return }
            var story: Story?
            
            switch pageNumber {
            case 0, 3:
                story = self?.recommend?.story1
                self?.observable.nowPlayingPage = 0
            case 1, 4:
                story = self?.recommend?.story2
                self?.observable.nowPlayingPage = 1
            case 2, 5:
                story = self?.recommend?.story3
                self?.observable.nowPlayingPage = 2
            default:
                print("Story가 확인되지 않았습니다.")
            }
            
            let relayReadingViewController = RelayReadingViewController()
            
            if let playlistID = self?.observable.playingPlaylistID {
                if let storyBGM = story?.bgm {
                    if storyBGM != playlistID {
                        self?.observable.playMusic(bgmID: storyBGM)
                        relayReadingViewController.audioPlayer = self?.observable.audioPlayer
                    }
                }
            } else {
                if let storyBGM = story?.bgm {
                        self?.observable.playMusic(bgmID: storyBGM)
                        relayReadingViewController.audioPlayer = self?.observable.audioPlayer
                }
            }
            
            relayReadingViewController.hidesBottomBarWhenPushed = true
            relayReadingViewController.requestStory(story)
            
            self?.navigationController?.pushViewController(relayReadingViewController, animated: true)
        }
        
        self.addAnimationView()
        setNavigationBar()
        setupLayout()
    }
}

extension RelayMainViewController {
    private func setNavigationBar() {
        noticeButton.tintColor = .relayBlack
        logoButton.isEnabled = false
        
        navigationItem.leftBarButtonItem = logoButton
        navigationItem.rightBarButtonItem = noticeButton
    }
    
    @objc
    private func goToNoticeView() {
        let noticeViewController = RelayNoticeViewController()
        
        navigationController?.pushViewController(noticeViewController, animated: true)
    }
    
    @objc
    func goToWritingView(_ sender: UIButton!) {
        let vc = RelayWritingViewController()
        
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func setupLayout() {
        [
            animationView
        ].forEach { view.addSubview($0) }
        animationView.addSubview(submitButton)
        
        animationView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120.0)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        submitButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34.44)
            $0.height.equalTo(52.56)
            $0.leading.equalToSuperview().inset(15.0)
            $0.trailing.equalToSuperview().inset(15.0)
        }
    }
    
    func addAnimationView() {
        if let recommend = recommend {
            let hostingController = UIHostingController(rootView: PageAnimationView(observable: observable, recommend: recommend))
            
            hostingController.view.frame = animationView.bounds
            hostingController.didMove(toParent: self)
            
            addChild(hostingController)
            animationView.addSubview(hostingController.view)
        } else {
            print("Recommend 데이터 호출 실패")
        }
    }
    
}

class RelayMainViewControllerObservable: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    @Published var pageNumber: Int = 0
    @Published var nowPlayingPage: Int?
    @Published var playingPlaylistID: Int?
    
    var onTouchAction: (() -> Void)!
    
    func playMusic(bgmID: Int) {
        playingPlaylistID = bgmID
        
        let playlist = Playlist()
        let fileName = playlist.getBGMFileName(id: bgmID)
        let url = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        
        if let url = url {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func playMusic() {
        audioPlayer?.play()
    }
    
    func stopMusic() {
        audioPlayer?.stop()
    }
    
    func pauseMusic() {
        audioPlayer?.pause()
    }
}
