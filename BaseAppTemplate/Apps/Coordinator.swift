//
//  RootCoordinator.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 28/5/25.
//

import UIKit
import Swinject

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var navigationController: UINavigationController { get set }

    var shouldBeAutomaticallyFinished: Bool { get }

    func start()
    func start(coordinatorMode: CoordinatorMode)

    func childDidFinish()
    func childDidFinish(_ child: Coordinator)

}

extension Coordinator {

    /// If we don't have a parent coordinator set up, the parent coordinator is the coordinator itself.
    var unwrappedParentCoordinator: Coordinator {
        parentCoordinator ?? self
    }

    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }

    func childDidFinish() {
        childCoordinators.removeLast(while: \.shouldBeAutomaticallyFinished)
        if !childCoordinators.isEmpty {
            childCoordinators.removeLast()
        }
    }

}

enum CoordinatorMode {
    case push
    case present(presentingViewController: UIViewController, configuration: CoordinatorModePresentConfiguration?)
    case embed(parentViewController: UIViewController, containerView: UIView?)
}

struct CoordinatorModePresentConfiguration {
    let modalPresentationStyle: UIModalPresentationStyle
    let transitioningDelegate: UIViewControllerTransitioningDelegate?
}

extension RangeReplaceableCollection {

    mutating func removeLast(while predicate: (Element) throws -> Bool) rethrows {
        guard let index = try indices.reversed().first(where: { try !predicate(self[$0]) }) else {
            removeAll()
            return
        }
        removeSubrange(self.index(after: index)...)
    }

}
