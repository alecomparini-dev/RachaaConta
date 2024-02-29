//  Created by Alessandro Comparini on 23/02/24.
//

import Foundation
import UI

class SearchPlaceOnMapCoordinator: Coordinator {
    var coordinator: Coordinator?
    
    let navigationController: NavigationController
    
    var dataTransfer: Any?
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        coordinator = self
        
        var controller = SearchPlaceOnMapViewController()
        
        controller = navigationController.pushViewController(controller)
        
        controller.coordinator = self
        
    }
    
}


//  MARK: - EXTENSION - SearchPlaceOnMapViewControllerCoordinator

extension SearchPlaceOnMapCoordinator: SearchPlaceOnMapViewControllerCoordinator {
    func gotoHome() {
        let coordinator = HomeCoordinator(navigationController)
        coordinator.start()
        self.coordinator = nil
    }
    
    
}

