//
//  BaseViewController.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 27/5/25.
//

import UIKit

class BaseViewController: UIViewController {

//    let bag: DisposeBag = DisposeBag()
    var navi: BaseNavigationController? {
        return navigationController as? BaseNavigationController
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    func bindViewModel() {}

    func setupUI() {
//        view.backgroundColor = App.Theme.current.package.viewBackground
    }
}
