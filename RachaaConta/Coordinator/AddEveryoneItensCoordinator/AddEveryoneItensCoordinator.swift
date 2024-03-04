//  Created by Alessandro Comparini on 04/03/24.
//

import Foundation
import UI

class AddEveryoneItensCoordinator: Coordinator {
    var coordinator: Coordinator?
    let navigationController: NavigationController
    
    var dataTransfer: Any?
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        coordinator = self
        
        var controller = AddEveryoneItensViewController()
        controller = navigationController.pushViewController(controller)
        controller.coordinator = self
    }
    
    
}


extension AddEveryoneItensCoordinator: AddEveryoneItensViewControllerCoordinator {
    
    func gotoTrocar() {
        let coordinator = CreateBillCoordinator(navigationController)
        coordinator.start()
        
        self.coordinator = nil
    }
    
    
}
