//
//  carender.swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/18.
//

import UIKit

class CalendarViewController: UIViewController {
    private var collectionView: UICollectionView!
    private var days: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "カレンダー"

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width / 7, height: 50)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)

        // 現在の月の日数を取得
        let date = Date()
        let range = Calendar.current.range(of: .day, in: .month, for: date)!
        days = (1...range.count).map { "\($0)" }
    }
}

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .lightGray
        let dayLabel = UILabel(frame: cell.contentView.bounds)
        dayLabel.textAlignment = .center
        dayLabel.text = days[indexPath.row]
        cell.contentView.addSubview(dayLabel)
        return cell
    }
}

