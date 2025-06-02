//
//  TabBarController.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 27/5/25.
//

import UIKit

final class TabBarController: UITabBarController {
    private var currentSelectedItemIndex: Int?
    private let coordinators: [Coordinator]

    // MARK: - Initializers

    init(coordinators: [Coordinator]) {
        self.coordinators = coordinators
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = coordinators.map { $0.navigationController }
    }

}
