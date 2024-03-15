//  Created by Alessandro Comparini on 15/03/24.
//

import Foundation
import UI
import Presenter

class AddItemViewControllerFactory {
    
    static func make() -> AddItemViewController {
        
        let viewModel = AddItemViewModelImpl()
        
        return AddItemViewController(viewModel: viewModel )
        
    }
}
