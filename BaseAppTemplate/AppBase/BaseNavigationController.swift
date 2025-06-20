//
//  BaseNavigationController.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 27/5/25.
//

import Foundation
import UIKit

final class BaseNavigationController: UINavigationController {
    weak var progress: UIProgressView!
    var isProgressHidden: Bool = true {
        didSet {
            setupProgress()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationBar.prefersLargeTitles = true
        navigationBar.barStyle = .black
//        navigationBar.tintColor = App.Theme.current.package.tabbarTint
    }

    private func setupProgress() {
        if isProgressHidden {
            if progress != nil {
                progress.removeFromSuperview()
                updateViewConstraints()
            }
        } else {
            let progress = UIProgressView(progressViewStyle: .bar)
            progress.translatesAutoresizingMaskIntoConstraints = false
            progress.progress = 0
            progress.backgroundColor = .black
            navigationBar.addSubview(progress)
            NSLayoutConstraint.activate([
                progress.heightAnchor.constraint(equalToConstant: 5),
                progress.leftAnchor.constraint(equalTo: navigationBar.leftAnchor),
                progress.rightAnchor.constraint(equalTo: navigationBar.rightAnchor),
                progress.topAnchor.constraint(equalTo: navigationBar.bottomAnchor)
                ])
            self.progress = progress
        }
    }
}
