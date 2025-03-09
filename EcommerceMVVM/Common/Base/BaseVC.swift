//
//  BaseView.swift
//  ECommerce
//
//  Created by hasancan on 8.03.2025.
//

import UIKit
import RxSwift
import RxCocoa

class BaseVC: UIViewController, LoadingShowable {
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "E-Market"
    }
    
    func bindLoadingStatus(to loadingStatus: BehaviorRelay<LoadingStatus>) {
        loadingStatus
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] status in
                guard let self = self else { return }
                switch status {
                case .initial:
                    self.hideLoading()
                case .loading:
                    self.showLoading()
                case .success:
                    self.hideLoading()
                case .error(let message):
                    self.hideLoading()
                    self.showAnimatedErrorPopup(message: message)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func showAnimatedErrorPopup(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: false) {  
            alert.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            alert.view.alpha = 0.0
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                alert.view.transform = .identity
                alert.view.alpha = 1.0
            }, completion: nil)
        }
    }
}
