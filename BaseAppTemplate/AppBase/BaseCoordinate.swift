//
//  BaseCoordinate.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 27/5/25.
//

import Foundation
import UIKit

protocol BaseCoordinate {
    associatedtype Screen
    associatedtype View: UIViewController
    
    var viewController: View? { get set }
    
    func showScreen(_ screen: Screen)
    func showError(_ error: Error)
}

// MARK: - Coordinator
extension BaseCoordinate {
    func showError(_ error: Error) {
//        let alert = UIAlertController(title: App.String.appName, message: error.localizedDescription, preferredStyle: .alert)
//        let ok = UIAlertAction(title: App.String.ok, style: .cancel)
//        alert.addAction(ok)
//        viewController?.present(alert, animated: true, completion: nil)
    }
}
