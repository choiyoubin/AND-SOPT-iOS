//
//  DetailViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/5/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.backgroundColor = .white
        
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var receivedTitle: String?
    private var receivedContent: String?
    
    @objc func backButtonTapped() {
        goBack()
    }
    
    private func goBack() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .systemPink
    }
    
    private func setUI() {
        // UIView+ 적용
        view.addSubviews(titleLabel, contentLabel, backButton)
    }
    
    func updateUI() {
        self.titleLabel.text = receivedTitle
        self.contentLabel.text = receivedContent
    }
    
    func dataBind(
        title: String,
        content: String
      ) {
        self.receivedTitle = title
        self.receivedContent = content
        updateUI()
      }
    

    private func setLayout() {
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        contentLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        backButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
    }

}
