//  Created by Alessandro Comparini on 21/02/24.
//

import Foundation

public struct AddressPresenterDTO {
    public var street: String?
    public var number: String?
    public var city: String?
    public var state: String?
    
    public init(street: String? = nil, number: String? = nil, city: String? = nil, state: String? = nil) {
        self.street = street
        self.number = number
        self.city = city
        self.state = state
    }
}
