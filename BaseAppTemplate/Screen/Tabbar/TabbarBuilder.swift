//
//  TabbarBuilder.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 2/6/25.
//

import Foundation
struct RootCoordinatorIdentifier {
    static let home = "home"
    static let setting = "setting"
}

final class MainTabBarBuilder {

    class func buildViewCoordinators() -> [RootCoordinator] {

        let upcomingMoviesNavigationController = createNavigationController(title: LocalizedStrings.upcomingMoviesTabBarTitle(), image: #imageLiteral(resourceName: "Movies"))
        let upcomingMoviesCoordinator = UpcomingMoviesCoordinator(navigationController: upcomingMoviesNavigationController,
                                                                  navigationDelegate: UpcomingMoviesNavigation())
        upcomingMoviesCoordinator.start(coordinatorMode: .push)

        let searchMoviesNavigationController = createNavigationController(title: LocalizedStrings.searchMoviesTabBarTitle(), image: #imageLiteral(resourceName: "Search"))
        let searchMoviesCoordinator = SearchMoviesCoordinator(navigationController: searchMoviesNavigationController)
        searchMoviesCoordinator.start(coordinatorMode: .push)

        let accountNavigationController = createNavigationController(title: LocalizedStrings.accountTabBarTitle(), image: #imageLiteral(resourceName: "Account"))
        let accountCoordinator = AccountCoordinator(navigationController: accountNavigationController)
        accountCoordinator.start(coordinatorMode: .push)

        return [
            upcomingMoviesCoordinator,
            searchMoviesCoordinator,
            accountCoordinator
        ]
    }

    class func createNavigationController(title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image

        return navController
    }

}
