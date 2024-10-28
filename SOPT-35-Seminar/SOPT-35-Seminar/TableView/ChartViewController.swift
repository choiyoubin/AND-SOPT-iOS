//
//  ChartViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/26/24.
//

import UIKit
import Then
import SnapKit

class ChartViewController: UIViewController {

    private let tableView = UITableView()
    private let appList = App.sampleApps
    let titleList = ["a","b","c"]
    let rankingList = [1,2,3]
    let subtitleList = ["가", "나", "다"]
    let imageList = [ UIImage(systemName: "person")!, UIImage(systemName: "person")!, UIImage(systemName: "person")! ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setStyle()
        setLayout()
    }
    
    private func setUI() {
        view.addSubview(tableView)
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        tableView.do {
            $0.register(ChartCell.self, forCellReuseIdentifier: ChartCell.identifier)
            $0.rowHeight = 250
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ChartViewController: UITableViewDelegate { }

extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // applist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChartCell.identifier, for: indexPath)
                as? ChartCell else { return UITableViewCell() }
        cell.configure(title: titleList[indexPath.row], ranking: rankingList[indexPath.row], subTitle: subtitleList[indexPath.row], image: imageList[indexPath.row])
        return cell
    }
    
}
