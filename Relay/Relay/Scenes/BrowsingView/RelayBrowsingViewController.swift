//
//  RelayBrowsingViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/03.
//

import UIKit
import SnapKit
import AVFoundation

class RelayBrowsingViewController: UIViewController, UICollectionViewDelegate {
    var audioPlayer: AVAudioPlayer?
    
    private var selectedCategory: Category?
    var stories: [Story] = []
    
    private var currentHighlightedButton: ButtonName? {
        didSet {
            changeButtonsHighlight()
        }
    }
    
    private lazy var relayBrowsingHeaderView = RelayBrowsingHeaderView(frame: .zero)
    private lazy var relayListView = RelayListView(frame: .zero, type: .browse)
    
    //TODO: 알림이 있을 때 Image가 변경되도록 구현
    private lazy var noticeButton = UIBarButtonItem(
        image: UIImage(systemName: "bell"),
        style: .plain,
        target: self,
        action: #selector(touchNoticeButton)
    )
    
    //TODO: develop 브랜치에 merge 후 leftBarItem의 UIImage 크기조절 필요
    private lazy var logoButton = UIBarButtonItem(
        image: UIImage(named: "RelayLogo")?.resize(newWidth: 56).withRenderingMode(.alwaysOriginal),
        style: .plain,
        target: self,
        action: nil
    )
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        //TODO: API를 통한 데이터호출로 변경
        stories = mockStory.allList
        
        currentHighlightedButton = .entire
        
        relayListView.listCollectionView.delegate = self
        relayListView.listCollectionView.dataSource = self
        
        setNavigationBar()
        setupButtonMethod()
        setupLayout()
    }
}

extension RelayBrowsingViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        CategoryModalPresentationController(presentedViewController: presented, presenting: presenting)
        }
}

extension RelayBrowsingViewController: RelayCategoryDelegate {
    func didApplyCategory(selectedCategory: Category) {
        self.selectedCategory = selectedCategory
        
        if selectedCategory.name == "전체" {
            relayListView.listHeaderView?.listFilterButton.setTitle("카테고리 전체", for: .normal)
        } else {
            relayListView.listHeaderView?.listFilterButton.setTitle(selectedCategory.name, for: .normal)
        }
    }
}

extension RelayBrowsingViewController: UICollectionViewDelegateFlowLayout {
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

extension RelayBrowsingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelayListCollectionViewCell.id, for: indexPath) as? RelayListCollectionViewCell else { return UICollectionViewCell() }
        let story = stories[indexPath.row]
        let playlist = Playlist()
        
        //TODO: 날짜계산모델 구현필요
        cell.configure(indexPath.row, title: story.title, stepCount: story.current_step, stepLimit: story.step_limit, hashTag: playlist.getBGMHashTag(id: story.bgm), date: "1일 전", likeCount: story.like_count, isFinished: story.finished)
        
        return cell
    }

}

extension RelayBrowsingViewController {
    enum ButtonName: String {
        case entire = "전체"
        case running = "달리는중"
        case completed = "완주"
    }
    
    private func setupLayout() {
        [
            relayBrowsingHeaderView,
            relayListView
        ].forEach { view.addSubview($0) }
        
        relayBrowsingHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(57.0)
        }
        
        relayListView.snp.makeConstraints {
            $0.top.equalTo(relayBrowsingHeaderView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setNavigationBar() {
        noticeButton.tintColor = .relayBlack
        logoButton.isEnabled = false
        
        navigationItem.leftBarButtonItem = logoButton
        navigationItem.rightBarButtonItem = noticeButton
    }
    
    private func setupButtonMethod() {
        relayBrowsingHeaderView.entireTitleView.titleButton.tag = 0
        relayBrowsingHeaderView.completedTitleView.titleButton.tag = 1
        relayBrowsingHeaderView.runningTitleView.titleButton.tag = 2
        
        relayBrowsingHeaderView.entireTitleView.titleButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        relayBrowsingHeaderView.completedTitleView.titleButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        relayBrowsingHeaderView.runningTitleView.titleButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        
        relayListView.listHeaderView?.listFilterButton.addTarget(self, action: #selector(touchListFilterButton), for: .touchUpInside)
    }
    
    private func changeButtonsHighlight() {
        switch currentHighlightedButton {
        case .entire:
            onButtonHighlight(.entire)
            offButtonHighlight(.running)
            offButtonHighlight(.completed)
        case .running:
            offButtonHighlight(.entire)
            onButtonHighlight(.running)
            offButtonHighlight(.completed)
        case .completed:
            offButtonHighlight(.entire)
            offButtonHighlight(.running)
            onButtonHighlight(.completed)
        default:
            break
        }
    }
    
    private func onButtonHighlight(_ buttonName: ButtonName) {
        let title = buttonName.rawValue
        let underlineView: UIView
        let button: UIButton
        
        var titleAttribute = AttributedString(title)
        titleAttribute.font = .systemFont(ofSize: 24.0, weight: .bold)
        
        switch buttonName {
        case .entire:
            underlineView = relayBrowsingHeaderView.entireTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.entireTitleView.titleButton

        case .running:
            underlineView = relayBrowsingHeaderView.runningTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.runningTitleView.titleButton

        case .completed:
            underlineView = relayBrowsingHeaderView.completedTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.completedTitleView.titleButton
        }
        
        titleAttribute.foregroundColor = .relayBlack
        underlineView.isHidden = false
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
    }
    
    private func offButtonHighlight(_ buttonName: ButtonName) {
        let title = buttonName.rawValue
        let underlineView: UIView
        let button: UIButton
        
        var titleAttribute = AttributedString(title)
        titleAttribute.font = .systemFont(ofSize: 24.0, weight: .bold)
        
        switch buttonName {
        case .entire:
            underlineView = relayBrowsingHeaderView.entireTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.entireTitleView.titleButton

        case .running:
            underlineView = relayBrowsingHeaderView.runningTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.runningTitleView.titleButton

        case .completed:
            underlineView = relayBrowsingHeaderView.completedTitleView.titleUnderlineView
            button = relayBrowsingHeaderView.completedTitleView.titleButton
        }
        
        titleAttribute.foregroundColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1.0)
        underlineView.isHidden = true
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
    }
    
    @objc private func touchButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            currentHighlightedButton = .entire
        case 1:
            currentHighlightedButton = .completed
        case 2:
            currentHighlightedButton = .running
        default:
            break
        }
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
    
    @objc private func touchListFilterButton() {
        let genrelist = GenreList()
        let list = genrelist.list
        let modalViewController = RelayCategoryViewController(list: list)
        
        modalViewController.fetchSelectedCateogry(selectedCategory)
        modalViewController.modalPresentationStyle = .custom
        modalViewController.transitioningDelegate = self
        modalViewController.delegate = self
        
        present(modalViewController, animated: true)
    }
    
    @objc private func touchNoticeButton() {
        let noticeViewController = RelayNoticeViewController()
        
        navigationController?.pushViewController(noticeViewController, animated: true)
    }
}
