//  Created by Alessandro Comparini on 20/02/24.
//

import Foundation

public protocol HomeViewModel {
    
    func fetchBills()
    
    func getBill(_ index: Int) -> BillPresenterDTO
    
    func numberOfRowsInSection() -> Int
    
    func heightForRowAt(_ index: Int) -> CGFloat
}
