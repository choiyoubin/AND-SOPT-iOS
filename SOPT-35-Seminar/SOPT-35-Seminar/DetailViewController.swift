//
//  DetailViewController.swift
//  SOPT-35-Seminar
//
//  Created by 최유빈 on 10/5/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 100), size: CGSize(width: UIScreen.main.bounds.size.width, height: 50)))
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 170), size: CGSize(width: UIScreen.main.bounds.size.width, height: 50)))
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 10, y: 240), size: CGSize(width: UIScreen.main.bounds.size.width - 20, height: 50)))
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
        // Do any additional setup after loading the view.
    }
    
    private func setStyle() {
        self.view.backgroundColor = .lightGray
    }
    
    private func setUI() {
        [titleLabel, contentLabel, backButton].forEach {
            self.view.addSubview($0)
        }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
