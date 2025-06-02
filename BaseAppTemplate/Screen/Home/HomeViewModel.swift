//
//  HomeViewModel.swift
//  BaseAppTemplate
//
//  Created by LONGPHAN on 27/5/25.
//

import Foundation

class HomeViewModel: BaseViewModel {
    var coordinator: HomeCoordinator?
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    func transform(input: Void) {
        
    }
}
