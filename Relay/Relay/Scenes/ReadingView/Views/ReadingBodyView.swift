//
//  ReadingBodyView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/07.
//

import UIKit
import SnapKit

class ReadingBodyView: UIView {
    var isReadingModeOn = true
    var relays: [(content: String, date: String, name: String)] = []
    
    lazy var bodyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BodyCollectionViewCell.self, forCellWithReuseIdentifier: BodyCollectionViewCell.id)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReadingBodyView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = relays[indexPath.row].content
        let width = collectionView.frame.width

        let style = NSMutableParagraphStyle()
        style.lineSpacing = 8.0
        style.maximumLineHeight = 25.0
        style.minimumLineHeight = 25.0

        let font = UIFont.systemFont(ofSize: 16.0)
        let cellSize = NSString(string: text).boundingRect(
            with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [
                .font: font,
                .paragraphStyle: style,
                .baselineOffset: (25.0 - font.lineHeight) / 4
            ],
            context: nil
        )
        
        if isReadingModeOn {
            return CGSize(width: width, height: cellSize.height + 10.0)
        } else {
            return CGSize(width: width, height: cellSize.height + 65.0)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }

}

extension ReadingBodyView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        relays.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BodyCollectionViewCell.id, for: indexPath) as? BodyCollectionViewCell else { return UICollectionViewCell() }
        
        let content = relays[indexPath.row]
        cell.configure(isReadingMode: isReadingModeOn, bodyText: content.content, name: content.name, date: content.date, touchCount: indexPath.row + 1)
        cell.isReadingModeOn = self.isReadingModeOn

        return cell
    }
}

extension ReadingBodyView {
    private func setupLayout() {
        addSubview(bodyCollectionView)

        bodyCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configure(firstText: String, firstDate: String, firstName: String, relays: [Relay]) {
        let firstContent = (content: firstText, date: firstDate, name: firstName)
        self.relays.append(firstContent)
        
        for relay in relays {
            let content = (content: relay.content, date: relay.created_time.doubleDateToString, name: relay.contributer.penname ?? "필명불명")
            self.relays.append(content)
        }
    }
    
    func addRelay(relay: Relay) {
        let content = (content: relay.content, date: relay.created_time.doubleDateToString, name: relay.contributer.penname ?? "필명불명")
        self.relays.append(content)
    }
    
}
