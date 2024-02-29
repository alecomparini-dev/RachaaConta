//  Created by Alessandro Comparini on 23/02/24.
//

import Foundation
import UI

class HomeCoordinator: Coordinator {
    var coordinator: Coordinator?
    
    var navigationController: NavigationController
    
    var dataTransfer: Any?
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        coordinator = self
                
        var controller: HomeViewController!
        
        controller = HomeViewControllerFactory.make()
        
        controller = navigationController.pushViewController(controller)
                
        controller.coordinator = self
    }
    
        
}



//  MARK: - EXTENSION - HomeViewControllerCoordinator

extension HomeCoordinator: HomeViewControllerCoordinator {
    
    func gotoCreateBill() {
        let coordinator = CreateBillCoordinator(navigationController)
        coordinator.start()
        self.coordinator = nil
    }
    
    
}
