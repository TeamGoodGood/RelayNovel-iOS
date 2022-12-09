//
//  RelayReadingViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/07.
//

import UIKit
import SnapKit
import AVFoundation

class RelayReadingViewController: UIViewController {
    var playlist = Playlist()
    var relays: [Relay] = []
    var isPlaying = true
    
    var story: Story?
    var audioPlayer: AVAudioPlayer?
    
    private var isReleyFinished = false
    private var isReadingModeOn = true {
        didSet {
            if isReadingModeOn {
                readingBodyView.isReadingModeOn = true
            } else {
                readingBodyView.isReadingModeOn = false
            }
            readingBodyView.bodyCollectionView.reloadData()
            
            readingBodyView.snp.updateConstraints {
                $0.width.equalTo(UIScreen.main.bounds.width)
                $0.height.equalTo(readingBodyView.bodyCollectionView.collectionViewLayout.collectionViewContentSize.height)
            }
        }
    }
    
    private lazy var readingCoverView = RelayReadingCoverView()
    private lazy var readingNoticeView = ReadingNoticeView()
    private lazy var readingBodyView = ReadingBodyView()
    private lazy var readingFooterView = RelayReadingFooterView()
    private lazy var readingWriteView = RelayReadingWriteView()
    private lazy var readingFinishFooterView = RelayReadingFinishFooterView()
    private lazy var scrollView = UIScrollView()
    
    private lazy var spacerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let width = UIScreen.main.bounds.width
        
        readingCoverView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(373.0)
        }
        
        readingFooterView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(86.0)
        }
        
        readingWriteView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(402)
        }
        
        readingFinishFooterView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(255.0)
        }
        
        spacerView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(47.0)
        }
        
        [
            spacerView,
            readingCoverView,
            readingNoticeView,
            readingBodyView
        ].forEach { stackView.addArrangedSubview($0) }
        
        if isReleyFinished {
            stackView.addArrangedSubview(readingFinishFooterView)
        } else {
            stackView.addArrangedSubview(readingFooterView)
        }
        
        return stackView
    }()
    
    private let contentView = UIView()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 35/255, green: 46/255, blue: 57/255, alpha: 0.5)
        button.layer.cornerRadius = 20.0
        
        button.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var readingModeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "clock"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 35/255, green: 46/255, blue: 57/255, alpha: 0.5)
        button.layer.cornerRadius = 20.0
        
        button.addTarget(self, action: #selector(toggleReadingMode), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var musicButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "speaker.slash"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 35/255, green: 46/255, blue: 57/255, alpha: 0.5)
        button.layer.cornerRadius = 20.0
        
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        if let story = story {
            switch story.id {
            case 0:
                relays += mockRelay.story1Relay
            case 1:
                relays += mockRelay.story2Relay
            case 2:
                relays += mockRelay.story3Relay
            case 3:
                relays += mockRelay.story4Relay
            case 4:
                relays += mockRelay.story5Relay
            case 5:
                relays += mockRelay.story6Relay
            case 6:
                relays += mockRelay.story7Relay
            case 7:
                relays += mockRelay.story8Relay
            case 8:
                relays += mockRelay.story9Relay
            case 9:
                relays += mockRelay.story10Relay
            default:
                relays += []
            }
            
            isReleyFinished = story.finished
            configureViews(story: story)
        }
        
        
        readingWriteView.writingTextView.delegate = self
        
        addSingleTapRecognizer()
        setupNavigationController()
        setupLayout()
        setupCustomNavigationButton()
        setupBatonButtonAction()
        setupLikeButtonAction()
        setupMusicButtonAction()
        setupRegisterButtonAction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        readingBodyView.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(readingBodyView.bodyCollectionView.collectionViewLayout.collectionViewContentSize.height)
        }
    }
}

extension RelayReadingViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.textColor = .relayGray
            textView.text = "내용을 작성해주세요."
        } else if textView.text == "내용을 작성해주세요." {
            textView.textColor = .relayBlack
            textView.text = nil
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || textView.text == "내용을 작성해주세요." {
            textView.textColor = .relayGray
            textView.text = "내용을 작성해주세요."
            readingWriteView.textCountLabel.text = "0/500자"
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count > 500 {
            textView.deleteBackward()
        }
        
        readingWriteView.textCountLabel.text = "\(textView.text.count)/500자"
    }
}

extension RelayReadingViewController {
    private func setupNavigationController() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupCustomNavigationButton() {
        [
            backButton,
            musicButton,
            readingModeButton
        ].forEach { view.addSubview($0) }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(57.0)
            $0.leading.equalToSuperview().inset(12.0)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }
        
        musicButton.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.top)
            $0.trailing.equalToSuperview().inset(12.0)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }
        
        readingModeButton.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.top)
            $0.trailing.equalTo(musicButton.snp.leading).offset(-16.0)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(-44.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
    
    //TODO: API 호출을 통해 받아오도록 수정
    func requestStory(_ story: Story?) {
        self.story = story
    }
    
    func configureViews(story: Story) {
        let dateString = story.created_time.doubleDateToString
        
        readingCoverView.configure(title: story.title, currentStep: story.current_step, stepLimit: story.step_limit, genre: story.genre, bgmTitle: playlist.getBGMName(id: story.bgm), bgmID: story.bgm,isFinished: story.finished)
        readingNoticeView.configure(name: story.original.penname ?? "작성자 미상", date: dateString, noticeContent: story.header)
        readingBodyView.configure(firstText: story.content, firstDate: dateString, firstName: story.original.penname ?? "작성자 미상", relays: relays)
        readingFooterView.configure(likeCount: story.like_count, isLikedUser: story.user_liked)
        readingFinishFooterView.configure(likeCount: story.like_count, isLikedUser: story.user_liked, relays: relays)
        readingWriteView.configure(touchCount: relays.count + 2)
    }
    
    func setupBatonButtonAction() {
        readingFooterView.batonButton.addTarget(self, action: #selector(touchBatonButton), for: .touchUpInside)
    }
    
    func addSingleTapRecognizer() {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchViewEndEditing))
        scrollView.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    func setupLikeButtonAction() {
        readingFooterView.likeButton.addTarget(self, action: #selector(pushLikeButton), for: .touchUpInside)
        readingFinishFooterView.likeButton.addTarget(self, action: #selector(pushLikeButton), for: .touchUpInside)
    }
    
    func setupMusicButtonAction() {
        musicButton.addTarget(self, action: #selector(touchMusicButton), for: .touchUpInside)
    }
    
    func setupRegisterButtonAction() {
        readingWriteView.registerButton.addTarget(self, action: #selector(pushRegisterButton), for: .touchUpInside)
    }
    
    @objc func popViewController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
    @objc func toggleReadingMode() {
        isReadingModeOn.toggle()
    }
    
    @objc func pushRegisterButton() {
        lazy var alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        lazy var action = UIAlertAction(title: "확인", style: .default)
        
        guard let text = readingWriteView.writingTextView.text, text != "내용을 작성해주세요." else {
            alert.message = "내용이 있어야합니다."
            alert.addAction(action)
            present(alert, animated: true)

            return
        }
        
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            alert.message = "공백은 등록되지 않습니다."
            alert.addAction(action)
            present(alert, animated: true)
            
            return
        }
        
        let createdTime: Double = {
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYYMMddHHmm"
            
            let nowDate = Double(formatter.string(from: Date())) ?? 20221225000000
            
            return nowDate
        }()
        
        
        let relay = Relay(contributer: mockUser.curry, content: text, created_time: createdTime)
        
        if let story = story {
            switch story.id {
            case 0:
                mockRelay.story1Relay.append(relay)
            case 1:
                mockRelay.story2Relay.append(relay)
            case 2:
                mockRelay.story3Relay.append(relay)
            case 3:
                mockRelay.story4Relay.append(relay)
            case 4:
                mockRelay.story5Relay.append(relay)
            case 5:
                mockRelay.story6Relay.append(relay)
            case 6:
                mockRelay.story7Relay.append(relay)
            case 7:
                mockRelay.story8Relay.append(relay)
            case 8:
                mockRelay.story9Relay.append(relay)
            case 9:
                mockRelay.story10Relay.append(relay)
            default:
                print("새로운 게시글의 릴레이추가")
            }
        }
        
        alert.message = "새로운 터치가 추가되었습니다!"
        alert.addAction(action)
        present(alert, animated: true)
        
        relays.append(relay)
        readingBodyView.addRelay(relay: relay)
        readingBodyView.bodyCollectionView.reloadData()
        
        readingBodyView.snp.updateConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(readingBodyView.bodyCollectionView.collectionViewLayout.collectionViewContentSize.height)
        }
        
        stackView.removeArrangedSubview(readingWriteView)
        stackView.addArrangedSubview(readingFooterView)
        
        readingWriteView.configure(touchCount: relays.count + 2)
        
        readingFooterView.isHidden = false
    }
    
    @objc func pushLikeButton() {
        if var story = story {
            if story.user_liked {
                print("좋아요 해제")
                let image = UIImage(systemName: "heart")
                readingFooterView.likeButton.setImage(image, for: .normal)
                readingFinishFooterView.likeButton.setImage(image, for: .normal)
                for i in 0..<mockStory.allList.count {
                    if mockStory.allList[i].id == story.id {
                        print("\(mockStory.allList[i].like_count)")
                        mockStory.allList[i].like_count -= 1
                        print("\(mockStory.allList[i].like_count)")
                        
                        print("\(mockStory.allList[i].user_liked)")
                        mockStory.allList[i].user_liked.toggle()
                        print("\(mockStory.allList[i].user_liked)")
                    }
                }
            } else {
                print("좋아요 추가")
                let image = UIImage(systemName: "heart.fill")
                readingFooterView.likeButton.setImage(image, for: .normal)
                readingFinishFooterView.likeButton.setImage(image, for: .normal)
                for i in 0..<mockStory.allList.count {
                    if mockStory.allList[i].id == story.id {
                        print("\(mockStory.allList[i].like_count)")
                        mockStory.allList[i].like_count += 1
                        print("\(mockStory.allList[i].like_count)")
                        
                        print("\(mockStory.allList[i].user_liked)")
                        mockStory.allList[i].user_liked.toggle()
                        print("\(mockStory.allList[i].user_liked)")
                    }
                }
            }
        }
    }
    
    @objc func touchBatonButton() {
        stackView.removeArrangedSubview(readingFooterView)
        stackView.addArrangedSubview(readingWriteView)
        
        readingFooterView.isHidden = true
    }
    
    
    @objc func touchMusicButton() {
        if isPlaying {
            musicButton.setImage(UIImage(systemName: "speaker.wave.2"), for: .normal)
            
            audioPlayer?.pause()
            isPlaying.toggle()
        } else {
            musicButton.setImage(UIImage(systemName: "speaker.slash"), for: .normal)
            
            audioPlayer?.play()
            isPlaying.toggle()
        }
    }
    
    @objc func touchViewEndEditing(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func keyboardUp(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
          var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
          keyboardFrame = self.view.convert(keyboardFrame, from: nil)

          var contentInset:UIEdgeInsets = self.scrollView.contentInset
          contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardDown() {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
