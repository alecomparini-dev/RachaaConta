//  Created by Alessandro Comparini on 17/03/24.
//

import Foundation

public protocol CalculatortemsViewModel {
    
    func fetchBillItems()
    
    func getBillItem( _ row: Int) -> BillItemPresenterDTO
        
    func numberOfSections() -> Int

    func numberOfRowsBillItems() -> Int
    
}
