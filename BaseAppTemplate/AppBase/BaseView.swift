//
//  BaseView.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 28/5/25.
//

import Foundation
protocol BaseView {
    associatedtype ViewModelType: BaseViewModel
    var viewModel: ViewModelType! { get set }
}
