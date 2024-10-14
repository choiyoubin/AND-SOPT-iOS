//
//  DetailViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/5/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    weak var delegate: NicknameDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.backgroundColor = .black
        label.textColor = .white
        
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .black
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
    
    private let nickNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "닉네임을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        // 추가한 부분
        textField.textColor = .black
        return textField
    }()
    
    private var receivedTitle: String?
    private var receivedContent: String?
    var completionHandler: ((String) -> ())?
    
    @objc func backButtonTapped() {
        if let nickname = nickNameTextField.text {
//            delegate?.dataBind(nickname: nickname)
            completionHandler?(nickname)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        // UIView+ 적용
        view.addSubviews(titleLabel, contentLabel, backButton, nickNameTextField)
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
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
        titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
        titleLabel.heightAnchor.constraint(equalToConstant: 50),
        
        contentLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300),
        contentLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
        contentLabel.heightAnchor.constraint(equalToConstant: 100),
        
        backButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        backButton.widthAnchor.constraint(equalToConstant: 200),
        backButton.heightAnchor.constraint(equalToConstant: 50),
        backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
        
        nickNameTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
        nickNameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
        nickNameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        nickNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

protocol NicknameDelegate: AnyObject {
    func dataBind(nickname: String)
}
