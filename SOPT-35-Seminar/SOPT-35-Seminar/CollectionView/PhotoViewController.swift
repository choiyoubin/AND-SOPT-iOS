//
//  PhotoViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/26/24.
//

import UIKit
import Then
import SnapKit

enum PhotoSection: CaseIterable {
    case main
}

class PhotoViewController: UIViewController {
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var photoList = Photo.mockData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setCollectionView()
        
    }

    private func setStyle() {
        self.view.backgroundColor = .white
    }
    private func setUI() {
        view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.horizontalEdges.equalToSuperview()
          }
    }
    
    private func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        let itemSize = (UIScreen.main.bounds.width - 6) / 3
        flowLayout.itemSize = .init(width: itemSize, height: itemSize)
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        
        collectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: false)
            $0.register(
                PhotoCell.self,
                forCellWithReuseIdentifier: PhotoCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension PhotoViewController: UICollectionViewDelegate { }

extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath)
                as? PhotoCell else { return UICollectionViewCell()
        }
        item.likeButtonAction = { [weak self] in
            guard let self else { return }
            self.photoList[indexPath.row].isLiked.toggle()
            self.collectionView.reloadItems(at: [indexPath])
            // applySnapshot 구현 
        }
        item.bind(photoList[indexPath.row])
        return item
    }
}
