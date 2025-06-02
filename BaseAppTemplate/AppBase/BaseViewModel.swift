//
//  BaseViewModel.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 27/5/25.
//

import Foundation
protocol BaseViewModel {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
