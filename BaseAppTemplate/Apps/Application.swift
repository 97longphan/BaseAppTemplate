//
//  Application.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 28/5/25.
//

import UIKit
import Swinject

final class Application {
    static let current = Application()
    var coodinator: RootCoordinator?
    private let appAssembler = AppAssembler.shared

    private init() {}

    func root(in window: UIWindow?) {
        let coodinator = RootCoordinator(resolver: appAssembler.resolver)
        coodinator.window = window
        coodinator.showScreen(.tabBar)
    }
}
