//  Created by Alessandro Comparini on 04/03/24.
//

import Foundation
import UI

class CalculatorItemsCoordinator: Coordinator {
    var coordinator: Coordinator?
    var dataTransfer: Any?
    let navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        coordinator = self
        
        var controller = CalculatorItemsViewController()
        controller = navigationController.pushViewController(controller)
        controller.coordinator = self
    }
    
    
}


//  MARK: - EXTENSION - CalculatorItemsViewControllerCoordinator
extension CalculatorItemsCoordinator: CalculatorItemsViewControllerCoordinator {
    
    func gotoAddItem() {
        let coordinator = AddItemCoordinator(navigationController)
        coordinator.start()
//        self.coordinator = nil
    }
    
    func gotoTrocar() {
        let coordinator = CreateBillCoordinator(navigationController)
        coordinator.start()
        self.coordinator = nil
    }
    
}
