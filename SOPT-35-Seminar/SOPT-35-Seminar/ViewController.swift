//
//  ViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Component 구성
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 100), size: CGSize(width: UIScreen.main.bounds.size.width, height: 50)))
        label.text = "네비게이션"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField(frame: CGRect(origin: CGPoint(x: 10, y: 240), size: CGSize(width: UIScreen.main.bounds.size.width - 20, height: 50)))
        textField.placeholder = "제목을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.textColor = .blue
        return textField
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView(frame: CGRect(origin: CGPoint(x: 10, y: 310), size: CGSize(width: UIScreen.main.bounds.size.width - 20, height: 100)))
        
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.textColor = .red
        
        return textView
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 10, y: 430), size: CGSize(width: UIScreen.main.bounds.size.width - 20, height: 50)))
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 20
        
        return button
    }()

    private lazy var changeModeButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 10, y: 500), size: CGSize(width: UIScreen.main.bounds.size.width - 20, height: 50)))
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var modeSwitch: UISwitch = {
        let switcher = UISwitch(frame: CGRect(origin: CGPoint(x: UIScreen.main.bounds.width - 60, y: 100), size: CGSize(width: 50, height: 50)))
        
        switcher.isOn = true
        
        switcher.addTarget(self, action: #selector(changeButtonTapped), for: UIControl.Event.valueChanged)
        
        return switcher
    }()
    
    private let nickNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 170), size: CGSize(width: UIScreen.main.bounds.size.width, height: 50)))
        label.text = "닉네임 미설정"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.backgroundColor = .yellow
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
    
    // MARK: - UI 설정
    private func setUI() {
        self.view.backgroundColor = .white
        [titleLabel, titleTextField, contentTextView, nextButton, changeModeButton, modeSwitch, nickNameLabel].forEach {
            self.view.addSubview($0)
        }
    }
    
    // MARK: - Function
    private var pushMode = true
    
    private func changeUI() {
        self.titleLabel.text = pushMode ? "네비게이션" : "모달"
        self.modeSwitch.isOn = pushMode ? true : false
    }
    
    @objc func changeButtonTapped() {
        changeMode()
    }
    
    private func changeMode() {
        self.pushMode.toggle()
        self.changeUI()
    }
    
    @objc func nextButtonTapped() {
        let nextViewController = DetailViewController()
        
//        nextViewController.delegate = self
        
        // weak self 사용 예시
//        nextViewController.completionHandler = { [weak self] nickname in
//            guard let self else { return }
//            self.nickNameLabel.text = nickname
//        }
        
        nextViewController.completionHandler = { string in
            self.nickNameLabel.text = string
        }
        
        //guard let으로 옵셔널 바인딩
        guard let title = titleTextField.text,
                let content = contentTextView.text
        else { return }

        nextViewController.dataBind(title: title, content: content)
        if pushMode {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.present(nextViewController, animated: true)
        }
    }
    //      if let으로 옵셔널 바인딩
    //        if let title = titleTextField.text, let content = contentTextView.text {
    //            nextViewController.dataBind(title: title, content: content)
    //        }
    //        if pushMode {
    //            self.navigationController?.pushViewController(nextViewController, animated: true)
    //        } else {
    //            self.present(nextViewController, animated: true)
    //        }
}

// MARK: - NicknameDelegate
extension ViewController: NicknameDelegate {
    func dataBind(nickname: String) {
        guard !nickname.isEmpty else { return }
        self.nickNameLabel.text = nickname
    }
}
