//
//  PaidCollectionViewCell.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 11/1/24.
//

import UIKit
import Then
import SnapKit

class PaidCollectionViewCell: UICollectionViewCell {
    private let tableView = UITableView()
    private var apps = App.sampleApps
    private var startRanking: Int = 1
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTableView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setTableView() {
        contentView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(PaidChartCell.self, forCellReuseIdentifier: PaidChartCell.className)
            $0.rowHeight = 70
        }
    }
        
    func configure(with apps: [App], startRanking: Int) {
        self.apps = apps
        self.startRanking = startRanking
        tableView.reloadData()
    }
}

extension PaidCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PaidChartCell.className, for: indexPath) as? PaidChartCell else {
            return UITableViewCell()
        }
        let app = apps[indexPath.row]
        let ranking = startRanking + indexPath.row
        cell.configure(app: app, ranking: ranking)
        return cell
    }
}

