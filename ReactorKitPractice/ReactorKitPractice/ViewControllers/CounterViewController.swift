//
//  CounterViewController.swift
//  codeBaseProject
//
//  Created by th1ngineeer on 2/23/24.
//

import UIKit

import ReactorKit

import SnapKit
import Then

final class CounterViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
    private let increaseButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
    }
    
    private let decreaseButton = UIButton().then {
        $0.setImage(UIImage(systemName: "minus"), for: .normal)
    }
    
    private var activityIndicatorView = UIActivityIndicatorView().then {
        $0.color = .black
    }
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "초기세팅 테스트 입니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.clipsToBounds = true
        return label
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [increaseButton, countLabel, decreaseButton, activityIndicatorView].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = .yellow
    }
    
    private func setLayout() {
        
        increaseButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        decreaseButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        activityIndicatorView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.centerX.equalToSuperview()
        }
    }
    
}

extension CounterViewController: View {
    func bind(reactor: CounterViewReactor) {
        
        // Action (View -> Reactor)
        increaseButton.rx.tap
            .map { CounterViewReactor.Action.increase }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        decreaseButton.rx.tap
            .map { CounterViewReactor.Action.decrease }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // State (Reactor -> View)
        reactor.state
            .map { String($0.value) }
            .distinctUntilChanged()
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.isLoading }
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}
