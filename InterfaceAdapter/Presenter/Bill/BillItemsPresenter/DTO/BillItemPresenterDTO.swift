//  Created by Alessandro Comparini on 17/03/24.
//

import Foundation

public struct BillItemPresenterDTO {
    public var descriptionItem: String?
    public var quantity: String?
    public var unitValue: String?
    public var totalValue: String?
    
    public init(descriptionItem: String? = nil, quantity: String? = nil, unitValue: String? = nil, totalValue: String? = nil) {
        self.descriptionItem = descriptionItem
        self.quantity = quantity
        self.unitValue = unitValue
        self.totalValue = totalValue
    }
    
}
