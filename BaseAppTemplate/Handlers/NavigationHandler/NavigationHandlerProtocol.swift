//
//  NavigationHandlerProtocol.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 2/6/25.
//

import UIKit
protocol RootCoordinator: Coordinator {

    var rootIdentifier: String { get }

}

final class NavigationHandler: NavigationHandlerProtocol {

    private let rootCoordinators: [RootCoordinator] = MainTabBarBuilder.buildViewCoordinators()

    private var initialTransitionCompleted: Bool = false
    private var onInitialTransition: ((UIWindow?) -> Void)?

    // MARK: - NavigationHandlerProtocol

    func initialTransition(from window: UIWindow?) {
        guard let window = window else { return }
        UIView.transition(with: window,
                          duration: 0.5,
                          options: [UIView.AnimationOptions.curveEaseOut,
                                    UIView.AnimationOptions.transitionCrossDissolve],
                          animations: {},
                          completion: { _ in
            let mainTabBarController = MainTabBarController(coordinators: self.rootCoordinators)
            window.rootViewController = mainTabBarController
            self.onInitialTransition?(window) ?? mainTabBarController.setSelectedIndex(0)
            self.initialTransitionCompleted = true
        })
    }
    // MARK: - Private

    private func changeTabBarToSelectedIndex(_ rootIdentifier: String, from window: UIWindow?) {
        let selectedIndex = index(for: rootIdentifier)
        guard let tabBarController = window?.rootViewController as? MainTabBarController else {
            return
        }
        tabBarController.setSelectedIndex(selectedIndex)
    }

    private func index(for rootIdentifier: String) -> Int {
        let coordinatorIdentifiers = rootCoordinators.map { $0.rootIdentifier }
        guard let indexToSelect = coordinatorIdentifiers.firstIndex(of: rootIdentifier) else {
            fatalError()
        }

        return indexToSelect
    }

}
