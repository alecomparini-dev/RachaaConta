//  Created by Alessandro Comparini on 13/03/24.
//

import Foundation
import UI

class AddItemCoordinator: Coordinator {
    var coordinator: Coordinator?
    var dataTransfer: Any?
    let navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        coordinator = self
        
        var controller = AddItemViewControllerFactory.make()
        controller = navigationController.pushViewController(controller)
        controller.coordinator = self
    }
    
}

//  MARK: - EXTENSION - AddItemViewControllerCoordinator
extension AddItemCoordinator: AddItemViewControllerCoordinator {
    
    func gotoBack() {
        navigationController.popViewController()
        self.coordinator = nil
    }
        
}
