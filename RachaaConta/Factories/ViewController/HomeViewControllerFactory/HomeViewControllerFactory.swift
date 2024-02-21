//  Created by Alessandro Comparini on 21/02/24.
//

import Foundation
import UI
import Presenter

class HomeViewControllerFactory {
    
    static func make() -> HomeViewController {
        
        let homeVM = HomeViewModelImpl()
        
        return HomeViewController(homeViewModel: homeVM)
        
    }
}
