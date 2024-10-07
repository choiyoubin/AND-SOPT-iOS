//
//  ViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 100), size: CGSize(width: UIScreen.main.bounds.size.width, height: 50)))
        label.text = "네비게이션"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField(frame: CGRect(origin: CGPoint(x: 10, y: 170), size: CGSize(width: UIScreen.main.bounds.size.width - 20, height: 50)))
        textField.placeholder = "제목을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView(frame: CGRect(origin: CGPoint(x: 10, y: 240), size: CGSize(width: UIScreen.main.bounds.size.width - 20, height: 100)))
        
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        
        return textView
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 10, y: 360), size: CGSize(width: UIScreen.main.bounds.size.width - 20, height: 50)))
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var changeModeButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 10, y: 430), size: CGSize(width: UIScreen.main.bounds.size.width - 20, height: 50)))
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
    
    private var pushMode = true
    
    private func changeUI() {
        self.titleLabel.text = pushMode ? "네비게이션" : "모달"
    }
    
    @objc func changeButtonTapped() {
        changeMode()
    }
    
    private func changeMode() {
        self.pushMode.toggle()
        self.changeUI()
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
        [titleLabel, titleTextField, contentTextView, nextButton, changeModeButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        
        guard let title = titleTextField.text,
                let content = contentTextView.text
        else { return }

        nextViewController.dataBind(title: title, content: content)
        if pushMode {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.present(nextViewController, animated: true)
        }
        
//        if let title = titleTextField.text, let content = contentTextView.text {
//            nextViewController.dataBind(title: title, content: content)
//        }
//        if pushMode {
//            self.navigationController?.pushViewController(nextViewController, animated: true)
//        } else {
//            self.present(nextViewController, animated: true)
//        }
    }

}

//class ViewController: UIViewController {
//  private let titleLabel: UILabel = {
//    let label = UILabel()
//    label.text = "카카오톡"
//    label.font = .systemFont(ofSize: 16)
//    return label
//  }()
//
//  private let titleTextField: UITextField = {
//    let textField = UITextField()
//    textField.placeholder = "제목을 입력해주세요."
//    textField.clearButtonMode = .whileEditing
//    textField.layer.borderColor = UIColor.gray.cgColor
//    textField.layer.borderWidth = 1
//    return textField
//  }()
//
//  private let contentTextView: UITextView = {
//    let textView = UITextView()
//    textView.font = .systemFont(ofSize: 14)
//    textView.layer.borderColor = UIColor.gray.cgColor
//    textView.layer.borderWidth = 1
//    textView.layer.cornerRadius = 5
//    return textView
//  }()
//
//  private lazy var nextButton: UIButton = {
//    let button = UIButton()
//    button.setTitle("다음", for: .normal)
//    button.backgroundColor = .tintColor
//    button.setTitleColor(.white, for: .normal)
//    return button
//  }()
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    setStyle()
//    setUI()
//    setLayout()
//  }
//
//  private func setStyle() {
//    self.view.backgroundColor = .white
//  }
//
//  private func setUI() {
//    [titleLabel, titleTextField, contentTextView, nextButton].forEach {
//      $0.translatesAutoresizingMaskIntoConstraints = false
//      self.view.addSubview($0)
//    }
//  }
//
//  private func setLayout() {
//    NSLayoutConstraint.activate(
//      [
//        titleLabel.topAnchor.constraint(
//          equalTo: view.safeAreaLayoutGuide.topAnchor,
//          constant: 20
//        ),
//        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//        titleTextField.topAnchor.constraint(
//          equalTo: titleLabel.bottomAnchor,
//          constant: 20
//        ),
//        titleTextField.leadingAnchor.constraint(
//          equalTo: view.leadingAnchor,
//          constant: 20
//        ),
//        titleTextField.trailingAnchor.constraint(
//          equalTo: view.trailingAnchor,
//          constant: -20
//        ),
//        titleTextField.heightAnchor.constraint(equalToConstant: 40),
//
//        contentTextView.topAnchor.constraint(
//          equalTo: titleTextField.bottomAnchor,
//          constant: 20
//        ),
//        contentTextView.leadingAnchor.constraint(
//          equalTo: view.leadingAnchor,
//          constant: 20
//        ),
//        contentTextView.trailingAnchor.constraint(
//          equalTo: view.trailingAnchor,
//          constant: -20
//        ),
//        contentTextView.heightAnchor.constraint(
//          equalToConstant: 200
//        ),
//
//        nextButton.topAnchor.constraint(
//          equalTo: contentTextView.bottomAnchor,
//          constant: 20
//        ),
//        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        nextButton.heightAnchor.constraint(equalToConstant: 50),
//        nextButton.widthAnchor.constraint(equalToConstant: 100)
//      ]
//    )
//  }
//}
