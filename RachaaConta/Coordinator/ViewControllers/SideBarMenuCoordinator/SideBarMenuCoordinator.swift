//  Created by Alessandro Comparini on 18/03/24.
//

import UIKit
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
        
        navigationController.present(controller)
        
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
