//  Created by Alessandro Comparini on 17/03/24.
//

import Foundation
import UI
import Presenter

class CalculatorItemsViewControllerFactory {
    
    static func make() -> CalculatorItemsViewController {
        
        let viewModel = CalculatortemsViewModelImpl()
        
        return CalculatorItemsViewController(viewModel: viewModel)
        
    }
    
}
