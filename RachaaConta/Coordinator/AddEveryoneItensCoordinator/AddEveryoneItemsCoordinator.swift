//  Created by Alessandro Comparini on 04/03/24.
//

import Foundation
import UI

class AddEveryoneItemsCoordinator: Coordinator {
    var coordinator: Coordinator?
    let navigationController: NavigationController
    
    var dataTransfer: Any?
    
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


extension AddEveryoneItemsCoordinator: CalculatorItemsViewControllerCoordinator {
    
    func gotoTrocar() {
        let coordinator = CreateBillCoordinator(navigationController)
        coordinator.start()
        
        self.coordinator = nil
    }
    
    
}
