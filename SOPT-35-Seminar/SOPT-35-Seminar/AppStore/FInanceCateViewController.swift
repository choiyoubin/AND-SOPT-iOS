//
//  FInanceCateViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/31/24.
//

import UIKit

class FInanceCateViewController: UIViewController {

    private let mainModelItems: [MainModel] = MainModel.getData()
    private let titleLists: [String] = MainModel.getTitleLists()
    private let appLists = App.sampleApps
    
    private let rootView = FInanceCateView()
    
    override func loadView() {
        self.view = rootView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegate()
        setRegister()
    }
    
    private func setDelegate() {
        rootView.appCollectionView.delegate = self
        rootView.appCollectionView.dataSource = self
    }
    
    private func setRegister() {
        rootView.appCollectionView.register(MainCell.self, forCellWithReuseIdentifier: MainCell.className)
        rootView.appCollectionView.register(FreeCollectionViewCell.self, forCellWithReuseIdentifier: FreeCollectionViewCell.className)
        rootView.appCollectionView.register(PaidCollectionViewCell.self, forCellWithReuseIdentifier: PaidCollectionViewCell.className)
        rootView.appCollectionView.register(EssentialCollectionViewCell.self, forCellWithReuseIdentifier: EssentialCollectionViewCell.className)
        
        rootView.appCollectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.className)
    }

}

extension FInanceCateViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FinanceSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = FinanceSection(rawValue: section) else {
            return 0
        }

        return section.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = FinanceSection(rawValue: indexPath.section) else {
            fatalError()
        }
        
        switch section {
        case .main:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.className, for: indexPath) as! MainCell
            let model = mainModelItems[indexPath.row]
            cell.bindData(
                mainImage: model.mainImage,
                sort: model.sort,
                title: model.title,
                subTitle: model.subTitle,
                logoImage: model.logoImage,
                miniTitle: model.miniTitle,
                info: model.info,
                inApp: model.inApp
            )
            return cell
            
        case .essential:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EssentialCollectionViewCell.className, for: indexPath) as! EssentialCollectionViewCell
            let startIndex = indexPath.item * 3
            let endIndex = min(startIndex + 3, appLists.count)
            let appsForThisCell = Array(appLists[startIndex..<endIndex])
            cell.configure(with: appsForThisCell, startRanking: startIndex + 1)
            return cell
            
        case .paid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaidCollectionViewCell.className, for: indexPath) as! PaidCollectionViewCell
            let startIndex = indexPath.item * 3
            let endIndex = min(startIndex + 3, appLists.count)
            let appsForThisCell = Array(appLists[startIndex..<endIndex])
            cell.configure(with: appsForThisCell, startRanking: startIndex + 1)
            return cell
            
        case .free:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FreeCollectionViewCell.className, for: indexPath) as! FreeCollectionViewCell
            let startIndex = indexPath.item * 3
            let endIndex = min(startIndex + 3, appLists.count)
            let appsForThisCell = Array(appLists[startIndex..<endIndex])
            cell.configure(with: appsForThisCell, startRanking: startIndex + 1)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.className, for: indexPath) as? HeaderCell,
                  let section = FinanceSection(rawValue: indexPath.section) else {
                return UICollectionReusableView()
            }
            switch section {
            case .main:
                headerView.bindTitle(title: "")
            case .essential:
                headerView.bindTitle(title: titleLists[0])
            case .paid:
                headerView.bindTitle(title: titleLists[1])
            case .free:
                headerView.bindTitle(title: titleLists[2])
            }
            return headerView
        }
        return UICollectionReusableView()
    }
}
extension FInanceCateViewController: UICollectionViewDelegate {
    
}
