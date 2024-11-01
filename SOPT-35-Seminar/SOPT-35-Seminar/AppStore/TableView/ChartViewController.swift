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
            $0.register(FinanceChartCell.self, forCellReuseIdentifier: FinanceChartCell.className)
            $0.rowHeight = 70
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
        return appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FinanceChartCell.className, for: indexPath)
                as? FinanceChartCell else { return UITableViewCell() }
        cell.configure(app: appList[indexPath.row])
        return cell
    }
    
}
