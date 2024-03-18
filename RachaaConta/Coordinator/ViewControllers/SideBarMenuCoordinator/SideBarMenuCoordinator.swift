//  Created by Alessandro Comparini on 18/03/24.
//

import Foundation
import UI


class SideBarMenuCoordinator: Coordinator {
    var coordinator: Coordinator?
    
    let navigationController: NavigationController
    
    var dataTransfer: Any?
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        coordinator = self
        
        var controller: SideBarMenuViewController!
        
        controller = SideBarMenuViewController()
        
        controller = navigationController.pushViewController(controller)
        
        controller.coordinator = self
        
    }
    
    
}

//  MARK: - EXTENSION - SideBarMenuViewControllerCoordinator
extension SideBarMenuCoordinator: SideBarMenuViewControllerCoordinator {
    
    func gotoBack() {
        
        navigationController.popViewController()
        
        self.coordinator = nil
    }
    
    
}
