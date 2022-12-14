//
//  RelayWritingViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/05.
//

import UIKit
import SnapKit
import AVFoundation

class RelayWritingViewController: UIViewController, UICollectionViewDelegate {
    private var selectedCategory: BGM?
    private var selectedEvent: String?
    private var selectedTouch: Int?
    var audioPlayer: AVAudioPlayer?
    var mute = true
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "xmark", withConfiguration: config)
        
        button.setImage(image: image!)
        button.tintColor = .relayBlack
        button.addTarget(self, action: #selector(dissmissViewController), for: .touchUpInside)
        
        return button
    }()
    
    private let relayLabel: UILabel = {
        let label = UILabel()
        
        label.text = "새 릴레이"
        label.setFont(.body2)
        label.textColor = .relayBlack
        
        return label
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "checkmark", withConfiguration: config)
        
        button.setImage(image: image!)
        button.tintColor = .relayPink1
        button.addTarget(self, action: #selector(touchCompleteButton), for: .touchUpInside)
        
        return button
    }()
    
    private let musicListButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "music.note.list", withConfiguration: config)
        
        button.setImage(image: image!)
        button.tintColor = .relayPink1
        
        button.setTitle("플레이리스트 선택", for: .normal)
        button.titleLabel!.setFont(.body2)
        button.setTitleColor(.relayBlack, for: .normal)
        
        button.backgroundColor = .relayGray2
        button.layer.cornerRadius = 8
        
        button.contentHorizontalAlignment = .leading
        button.semanticContentAttribute = .forceLeftToRight
        button.imageEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 0)
        button.titleEdgeInsets = .init(top: 0, left: 28, bottom: 0, right: 0)
        
        button.addTarget(self, action: #selector(touchMusicListButton), for: .touchUpInside)
        
        return button
    }()
    
    private let muteButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "speaker.slash.fill", withConfiguration: config)
        
        button.setImage(image: image!)
        button.tintColor = .relayBlack
        
        button.addTarget(self, action: #selector(muteMusic), for: .touchUpInside)
        
        return button
    }()
    private let playListLabel: UILabel = {
        let label = UILabel()
        
        label.text = "플레이리스트"
        label.setFont(.body1)
        
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "제목"
        label.setFont(.body1)
        
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 8.0
        textField.backgroundColor = .relayGray2
        textField.placeholder = "제목을 작성해주세요"
        
        textField.addTarget(self, action: #selector(titleTextFieldDidChange), for: .editingChanged)
        
        // TODO: 다음 스프린트때 제목 확인
        //        textField.addTarget(self, action: #selector(checkText), for: .editingChanged)
        
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 0.0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let titleTextCountLabel: UILabel = {
        let label = UILabel()
        
        label.text = "0/20자"
        label.setFont(.caption2)
        label.textColor = .relayGray
        return label
    }()
    
    private let storyLabel: UILabel = {
        let label = UILabel()
        
        label.text = "내용"
        label.setFont(.body1)
        
        return label
    }()
    
    let textViewPlaceHolder = "터치1의 내용을 작성해주세요."
    
    // TODO: TextView에는 addTarget이 안되서 한국어 받침 설정을 못했습니다
    lazy var storyTextView: UITextView = {
        let textView = UITextView()
        
        textView.layer.cornerRadius = 8.0
        textView.backgroundColor = .relayGray2
        
        textView.text = textViewPlaceHolder
        textView.font = .systemFont(ofSize: 17)
        textView.textColor = .systemGray3
        
        textView.textContainerInset = UIEdgeInsets(top: 12.0, left: 18.0, bottom: 12.0, right: 18.0)
        
        textView.delegate = self
        
        return textView
    }()
    
    let remainCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .relayGray
        label.setFont(.caption2)
        label.text = "0/500자"
        
        return label
    }()
    
    private lazy var commentTitleView = WritingTitleView()
    private lazy var eventTitleView = WritingTitleView()
    private lazy var touchTitleView = WritingTitleView()
    
    private let commentDivider = DividerView()
    private let eventDivider = DividerView()
    
    private let commentTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 8.0
        textField.backgroundColor = .relayGray2
        textField.placeholder = "이 릴레이의 소개를 입력해주세요."
        
        textField.addTarget(self, action: #selector(commentTextFieldDidChange), for: .editingChanged)
        
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 0.0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let commentTextCountLabel: UILabel = {
        let label = UILabel()
        
        label.text = "0/20자"
        label.setFont(.caption2)
        label.textColor = .relayGray
        
        return label
    }()
    
    let tagList = ["로맨스", "스릴러/공포", "판타지", "SF", "시대극", "무협", "추리", "일반", "기타"]
    let touchList = [10, 20, 30, 40, 50]
    
    lazy var eventCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        cv.showsHorizontalScrollIndicator = false
        
        return cv
    }()
    
    lazy var touchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        cv.showsHorizontalScrollIndicator = false
        
        return cv
    }()
    
    let eventIdentifier = "EventCollectionViewCell"
    let touchIdentifier = "TouchCollectionViewCell"
    
    private lazy var writeScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    private lazy var contentView = UIView()
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        audioPlayer?.stop()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTapped()
        view.backgroundColor = .white
        setupTopBar()
        
        view.addSubview(writeScrollView)
        setupLayout()
        setupCollectionView()
        setupTitleButton()
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextField.textDidChangeNotification, object: nil)
    }
}

extension RelayWritingViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let modal = CategoryModalPresentationController(presentedViewController: presented, presenting: presenting)
        modal.dismissDelegate = self
        modal.modalHeight = 551.0
        
        return modal
        }
}

extension RelayWritingViewController: RelayCategoryDelegate {
    func didApplyCategory(selectedCategory: Category) {
        self.selectedCategory = selectedCategory as? BGM
        
        if let selectedPlaylist = self.selectedCategory {
            musicListButton.setTitle(selectedPlaylist.name, for: .normal)
        }
    }
}

extension RelayWritingViewController: RelayPlaylistCategoryDelegate {
    func playMusic(id: Int) {
        let playlist = Playlist()
        let fileName = playlist.getBGMFileName(id: id)
        let url = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        
        if let url = url {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                if mute {
                    audioPlayer?.volume = 1
                    
                } else {
                    audioPlayer?.volume = 0
                }
            } catch {
                print(error)
            }
        }
    }
}

extension RelayWritingViewController: CategoryModalDismissDelegate {
    func dismissByTouchingBackground() {
        if let bgm = selectedCategory {
            playMusic(id: bgm.id)
            if mute {
                audioPlayer?.volume = 1
                
            } else {
                audioPlayer?.volume = 0
            }
        } else {
            audioPlayer?.stop()
        }
    }
}

extension RelayWritingViewController {
    
    @objc
    func muteMusic() {
        mute.toggle()
        if mute {
            let config = UIImage.SymbolConfiguration(pointSize: 22)
            let image = UIImage(systemName: "speaker.slash.fill", withConfiguration: config)
            
            muteButton.setImage(image: image!)
            audioPlayer?.volume = 1
            
        } else {
            let config = UIImage.SymbolConfiguration(pointSize: 22)
            let image = UIImage(systemName: "speaker.fill", withConfiguration: config)
            
            muteButton.setImage(image: image!)
            audioPlayer?.volume = 0
        }
        print(mute)
        // mute가 false일때 소리 0
    }
    
    @objc
    func dissmissViewController() {
        self.presentingViewController?.dismiss(animated: true, completion:nil)
    }
    
    @objc
    func keyboardUp(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
          var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
          keyboardFrame = self.view.convert(keyboardFrame, from: nil)

          var contentInset:UIEdgeInsets = self.writeScrollView.contentInset
          contentInset.bottom = keyboardFrame.size.height + 20
        writeScrollView.contentInset = contentInset
    }
    
    @objc
    func keyboardDown() {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        writeScrollView.contentInset = contentInset
    }
    
    func setupCollectionView() {
        eventCollectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: eventIdentifier)
        eventCollectionView.delegate = self
        eventCollectionView.dataSource = self
        touchCollectionView.register(TouchCollectionViewCell.self, forCellWithReuseIdentifier: touchIdentifier)
        touchCollectionView.delegate = self
        touchCollectionView.dataSource = self
    }
    
    // 텍스트 숫자 세기
    @objc
    func titleTextFieldDidChange(_ textField: UITextField) {
        let string = textField.text
        let strCount = string?.count
        
        if strCount ?? 0 > 20 {
            titleTextCountLabel.text = "20/20자"
        } else {
            titleTextCountLabel.text = "\(String(describing: strCount ?? 0))/20자"
        }
    }
    
    @objc
    func commentTextFieldDidChange(_ textField: UITextField) {
        let string = textField.text
        let strCount = string?.count
        
        if strCount ?? 0 > 20 {
            commentTextCountLabel.text = "20/20자"
        } else {
            commentTextCountLabel.text = "\(String(describing: strCount ?? 0))/20자"
        }
    }
    
    // titleTextField 마지막 글자 한글 받침 사용하기 위해
    @objc
    func textDidChange(noti: NSNotification) {
        if let text = titleTextField.text {
            if text.count >= 20 {
                let fixedText = text.prefix(20)
                titleTextField.text = fixedText + " "
                
                let when = DispatchTime.now() + 0.01
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.titleTextField.text = String(fixedText)
                }
            }
        }
        if let text = commentTextField.text {
            if text.count >= 20 {
                let fixedText = text.prefix(20)
                commentTextField.text = fixedText + " "
                
                let when = DispatchTime.now() + 0.01
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.commentTextField.text = String(fixedText)
                }
            }
        }
        if let text = storyTextView.text {
            if text.count >= 500 {
                let fixedText = text.prefix(500)
                storyTextView.text = fixedText + " "
                
                let when = DispatchTime.now() + 0.01
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.storyTextView.text = String(fixedText)
                }
            }
        }
    }
    
    @objc func touchMusicListButton() {
        let playlist = Playlist()
        let list = playlist.list
        
        let modalViewController = RelayCategoryViewController(list: list)
        
        modalViewController.fetchSelectedCateogry(selectedCategory)
        modalViewController.isHiddenFirstCellUnderline = true
        modalViewController.modalPresentationStyle = .custom
        modalViewController.transitioningDelegate = self
        modalViewController.delegate = self
        modalViewController.playlistDelegate = self
        
        present(modalViewController, animated: true)
    }
    
    @objc func touchCompleteButton() {
        lazy var alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        lazy var action = UIAlertAction(title: "확인", style: .default)
        
        guard let playlist = selectedCategory else {
            alert.message = "플레이리스트를 선택해주세요."
            alert.addAction(action)
            present(alert, animated: true)
            
            return
        }
        
        guard let title = titleTextField.text, title != "" else {
            alert.message = "제목을 작성해주세요."
            alert.addAction(action)
            present(alert, animated: true)
            
            return
        }
        guard let content = storyTextView.text, content != textViewPlaceHolder else {
            alert.message = "본문을 작성해주세요."
            alert.addAction(action)
            present(alert, animated: true)
            
            return
        }
        
        guard let comment = commentTextField.text, comment != "" else {
            alert.message = "공지를 작성해주세요."
            alert.addAction(action)
            present(alert, animated: true)
            
            return
        }
        
        guard let event = selectedEvent else {
            alert.message = "종목을 선택해주세요."
            alert.addAction(action)
            present(alert, animated: true)

            return
        }
        
        guard let stepLimit = selectedTouch else {
            alert.message = "터치 수를 선택해주세요."
            alert.addAction(action)
            present(alert, animated: true)
            
            return
        }
        
        let now: Double = {
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYYMMddHHmm"
            
            let nowDate = Double(formatter.string(from: Date())) ?? 20221225000000
            
            return nowDate
        }()
        
        
        let userResponse = UserResponse(id: loginUser.id, penname: loginUser.penname)
        let story = Story(
            id: mockStory.allList.count,
            original: userResponse,
            genre: event,
            header: comment,
            title: title,
            content: content,
            bgm: playlist.id,
            like_count: 0,
            step_limit: stepLimit,
            current_step: 1,
            finished: false,
            created_time: now,
            user_liked: false
        )
        
        mockStory.allList = [story] + mockStory.allList
        
        alert.message = "릴레이가 시작되었습니다!"
        let dismissAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            self?.dismiss(animated: true)
        }
        
        alert.addAction(dismissAction)

        present(alert, animated: true)

    }
    
    private func updateCountLabel(characterCount: Int) {
        remainCountLabel.text = "\(characterCount)/500자"
        remainCountLabel.textColor = .relayGray
    }
    
    private func setupTitleButton() {
        commentTitleView.titleLabel.text = "공지"
        eventTitleView.titleLabel.text = "종목"
        touchTitleView.titleLabel.text = "터치"
        touchTitleView.discriptionLabel.text = "(릴레이 소설 횟수)"
    }
    
    private func setupTopBar() {
        [
            closeButton,
            relayLabel,
            completeButton
            
        ].forEach { view.addSubview($0) }
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        relayLabel.snp.makeConstraints {
            $0.top.equalTo(closeButton)
            $0.centerX.equalToSuperview()
        }
        completeButton.snp.makeConstraints {
            $0.top.equalTo(closeButton)
            $0.trailing.equalToSuperview().inset(20.0)
        }
    }
        
    
    private func setupLayout() {
        writeScrollView.addSubview(contentView)
        writeScrollView.delaysContentTouches = false
        [
            muteButton,
            musicListButton,
            playListLabel,
            titleLabel,
            titleTextField,
            titleTextCountLabel,
            storyLabel,
            storyTextView,
            remainCountLabel,
            commentTitleView,
            commentTextField,
            commentTextCountLabel,
            commentDivider,
            eventTitleView,
            eventCollectionView,
            eventDivider,
            touchTitleView,
            touchCollectionView
        ].forEach { contentView.addSubview($0) }
        writeScrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(writeScrollView.contentLayoutGuide.snp.height)
            $0.width.equalToSuperview()
        }
        muteButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(62.0)
            $0.trailing.equalTo(view.snp.trailing).inset(20.0)
            $0.width.equalTo(22.0)
        }
        playListLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        musicListButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(49.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalTo(muteButton.snp.leading).inset(-20.0)
            $0.height.equalTo(47.0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(musicListButton.snp.bottom).offset(28.0)
            $0.leading.equalTo(musicListButton.snp.leading)
        }
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.trailing.equalTo(muteButton.snp.trailing)
            $0.height.equalTo(49.0)
        }
        titleTextCountLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel)
            $0.trailing.equalTo(muteButton.snp.trailing)
        }
        storyLabel.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(28.0)
            $0.leading.equalTo(musicListButton.snp.leading)
        }
        storyTextView.snp.makeConstraints {
            $0.top.equalTo(storyLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.trailing.equalTo(titleTextField.snp.trailing)
            $0.height.equalTo(300.0)
        }
        remainCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(storyTextView.snp.top).offset(-10.0)
            $0.trailing.equalTo(titleTextField.snp.trailing)
        }
        commentTitleView.snp.makeConstraints {
            $0.top.equalTo(storyTextView.snp.bottom).offset(28.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.trailing.equalTo(commentTextCountLabel)
            $0.height.equalTo(20)
        }
        commentTextField.snp.makeConstraints {
            $0.top.equalTo(commentTitleView.snp.bottom).offset(8.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.trailing.equalTo(storyTextView.snp.trailing)
            $0.height.equalTo(49.0)
        }
        commentTextCountLabel.snp.makeConstraints {
            $0.top.equalTo(storyTextView.snp.bottom).offset(28.0)
            $0.trailing.equalTo(muteButton.snp.trailing)
        }
        commentDivider.snp.makeConstraints {
            $0.top.equalTo(commentTextField.snp.bottom).offset(28.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.trailing.equalTo(storyTextView.snp.trailing)
            $0.height.equalTo(1.0)
        }
        eventTitleView.snp.makeConstraints {
            $0.top.equalTo(commentDivider.snp.bottom).offset(28.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.width.equalTo(57)
            $0.height.equalTo(20)
        }
        eventCollectionView.snp.makeConstraints {
            $0.top.equalTo(eventTitleView.snp.bottom).offset(12.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.trailing.equalToSuperview().inset(56.0)
            $0.height.equalTo(74.0)
        }
        eventDivider.snp.makeConstraints {
            $0.top.equalTo(eventCollectionView.snp.bottom).offset(28.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.trailing.equalTo(storyTextView.snp.trailing)
            $0.height.equalTo(1.0)
        }
        touchTitleView.snp.makeConstraints {
            $0.top.equalTo(eventDivider.snp.bottom).offset(28.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.width.equalTo(57.0)
            $0.height.equalTo(20.0)
        }
        touchCollectionView.snp.makeConstraints {
            $0.top.equalTo(touchTitleView.snp.bottom).offset(12.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.trailing.equalTo(storyTextView.snp.trailing)
            $0.height.equalTo(48.0)
            $0.bottom.equalToSuperview()
        }
    }
}

extension RelayWritingViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 백 스페이스 가능하게 설정
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        
        guard let text = textField.text else { return false }
        if text.count >= 21 {
            return false
        }
        return true
    }
}


extension RelayWritingViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .relayBlack
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .systemGray3
            textView.font = .systemFont(ofSize: 17)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let string = storyTextView.text
        let strCount = string?.count
        
        if strCount ?? 0 > 500 {
            // TODO: 500자 넘었을 때 완료 버튼 비활성화 구현 해야 함
            remainCountLabel.textColor = .red
            remainCountLabel.text = "\(String(describing: strCount ?? 0))/500자"
        } else {
            remainCountLabel.text = "\(String(describing: strCount ?? 0))/500자"
        }
        return true
    }
}

extension RelayWritingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case eventCollectionView:
            selectedEvent = tagList[indexPath.row]
        case touchCollectionView:
            selectedTouch = touchList[indexPath.row]
        default:
            print("CollectionView touch Error")
        }
    }
}

extension RelayWritingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case eventCollectionView:
            return tagList.count
            
        case touchCollectionView:
            return touchList.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case eventCollectionView:
            let cell = eventCollectionView.dequeueReusableCell(withReuseIdentifier: eventIdentifier, for: indexPath) as! EventCollectionViewCell
            
            cell.eventLabel.text = tagList[indexPath.row]
            
            return cell
            
        case touchCollectionView:
            let cell = touchCollectionView.dequeueReusableCell(withReuseIdentifier: touchIdentifier, for: indexPath) as! TouchCollectionViewCell
            
            cell.touchLabel.text = "\(touchList[indexPath.row])"
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

