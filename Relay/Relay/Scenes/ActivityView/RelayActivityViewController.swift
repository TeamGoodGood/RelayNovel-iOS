//
//  RelayActivityViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/21.
//

import UIKit
import SnapKit
import AVFoundation

class RelayActivityViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    var type: ListViewType
    var stories: [Story] = []
    
    private lazy var relayListView = RelayListView(frame: .zero, type: type)
    
    private lazy var settingButton = UIBarButtonItem(
        image: UIImage(systemName: "gearshape"),
        style: .plain,
        target: self,
        action: #selector(tappedSettingButton)
    )
    
    //TODO: 알림이 있을 때 Image가 변경되도록 구현
    private lazy var noticeButton = UIBarButtonItem(
        image: UIImage(systemName: "bell"),
        style: .plain,
        target: self,
        action: #selector(tappedNoticeButton)
    )
    
    init(type: ListViewType) {
        self.type = type
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        //TODO: API를 통한 데이터호출로 구현필요
        switch type {
        case .like:
            stories = mockStory.fetchUserLikedStories()
        case .participated:
            stories = mockStory.fetchUserParticipatedStories()
        case .started:
            stories = mockStory.fetchUserStartedStories()
        default:
            stories = mockStory.allList
        }
        
        relayListView.listCollectionView.delegate = self
        relayListView.listCollectionView.dataSource = self
        
        setupButtonsLayout()
        setNavigationBar()
        setupLayout()
    }
}

extension RelayActivityViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = 118.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let readingViewController = RelayReadingViewController()
        readingViewController.requestStory(stories[indexPath.row])
        readingViewController.hidesBottomBarWhenPushed = true
        
        playMusic(bgmID: stories[indexPath.row].bgm)
        readingViewController.audioPlayer = audioPlayer
        navigationController?.pushViewController(readingViewController, animated: true)
    }
}

extension RelayActivityViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if stories.count == 0 {
            switch type {
            case .like:
                collectionView.setEmptyView(message: "좋아요한 릴레이가 없습니다.")
            case .participated:
                collectionView.setEmptyView(message: "참여한 릴레이가 없습니다.")
            case .started:
                collectionView.setEmptyView(message: "시작한 릴레이가 없습니다.")
            default:
                collectionView.setEmptyView(message: "디폴트.")
            }
        }
        else {
            collectionView.restore()
        }
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelayListCollectionViewCell.id, for: indexPath) as? RelayListCollectionViewCell else { return UICollectionViewCell() }
        let story = stories[indexPath.row]
        let playlist = Playlist()
        
        //TODO: 날짜계산모델 구현필요
        cell.configure(indexPath.row, title: story.title, stepCount: story.current_step, stepLimit: story.step_limit, hashTag: playlist.getBGMHashTag(id: story.bgm), date: story.created_time.dateDifferenceToString, likeCount: story.like_count, isFinished: story.finished)
        
        return cell
    }
}

extension RelayActivityViewController {
    private func setupLayout() {
        view.addSubview(relayListView)
        
        relayListView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.tintColor = .relayBlack
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func setupButtonsLayout() {
        settingButton.tintColor = .black
        noticeButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [noticeButton, settingButton]
    }
    
    private func playMusic(bgmID: Int) {
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
    
    @objc func tappedSettingButton() {
        let settingViewController = RelaySettingViewController()
        
        navigationController?.pushViewController(settingViewController, animated: true)
    }
    
    @objc func tappedNoticeButton() {
        let noticeViewController = RelayNoticeViewController()
        
        navigationController?.pushViewController(noticeViewController, animated: true)
    }
}
