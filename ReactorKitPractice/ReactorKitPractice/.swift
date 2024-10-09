//
//  ViewController 2.swift
//  ReactorKitPractice
//
//  Created by 이명진 on 10/10/24.
//


//
//  ViewController.swift
//  codeBaseProject
//
//  Created by th1ngineeer on 2/23/24.
//
 
import UIKit
 
class ViewController: UIViewController {
    
    private let testLabel: UILabel = {
        let label = UILabel()
        label.text = "초기세팅 테스트 입니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.clipsToBounds = true
        return label
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.addSubview(testLabel)
        view.backgroundColor = .yellow
    }
    
    private func setLayout() {
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
        ])
    }
}
