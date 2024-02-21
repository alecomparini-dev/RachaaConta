//  Created by Alessandro Comparini on 20/02/24.
//

import Foundation

public class HomeViewModelImpl: HomeViewModel {

    private var bills: [String] = ["1", "2", "2", "2"]
    
    
    public init() {    }
    
    public func numberOfRowsInSection() -> Int {
        return bills.count
    }
    
    
    
    
}
