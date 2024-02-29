//  Created by Alessandro Comparini on 29/02/24.
//

import Foundation
import UI

class CreateBillCoordinator: Coordinator {
    var coordinator: Coordinator?
    
    let navigationController: NavigationController
    
    var dataTransfer: Any?
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        coordinator = self
        
        var controller = CreateBillViewController()
        
        controller = navigationController.pushViewController(controller)
        
        controller.coordinator = self
    }
    
    
}


//  MARK: - EXTENSION - CreateBillViewControllerCoordinator
extension CreateBillCoordinator: CreateBillViewControllerCoordinator {
    
    func gotoSearchPlaceOnMap() {
        let coordinator = SearchPlaceOnMapCoordinator(navigationController)
        
        coordinator.start()
        
        self.coordinator = nil
    }
    
    
}
