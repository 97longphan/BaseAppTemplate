//
//  AppDIContainer.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 28/5/25.
//

import Foundation
import Swinject

class AppAssembler {
    static let shared = AppAssembler()
    private let assembler: Assembler
    
    var resolver: Resolver { self.assembler.resolver }
    
    init() {
        self.assembler = Assembler([
            CoordinatorAssembly(),
            ViewModelAssembly(),
            ViewControllerAssembly()
        ])
    }
}


class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
//        container.register(SettingsViewModel.self) { r in
//            SettingsViewModel(coordinator: r.resolved(SettingsCoordinator.self))
//        }.inObjectScope(.transient)
//        
//        container.register(TabBarViewModel.self) { r in
//            TabBarViewModel(coordinator: r.resolved(TabBarCoordinator.self))
//        }.inObjectScope(.transient)
    }
}

class CoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SettingsCoordinator.self) { r in
            SettingsCoordinator()
        }.inObjectScope(.transient)
        
        container.register(TabBarCoordinator.self) { _ in
            TabBarCoordinator()
        }.inObjectScope(.transient)
    }
}

class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
//        container.register(SettingsViewController.self) { r in
//            let controller = SettingsViewController()
//            let coordinator = r.resolved(SettingsCoordinator.self)
//            let viewModel = r.resolved(SettingsViewModel.self)
//            coordinator.viewController = controller
//            controller.viewModel = viewModel
//            return controller
//        }.inObjectScope(.transient)
//        
//        container.register(TabBarController.self) { r in
//            let controller = TabBarController()
//            let coordinator = r.resolved(TabBarCoordinator.self)
//            let viewModel = r.resolved(TabBarViewModel.self)
//            coordinator.viewController = controller
//            controller.viewModel = viewModel
//            return controller
//        }.inObjectScope(.transient)
    }
}
