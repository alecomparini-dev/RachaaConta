//  Created by Alessandro Comparini on 21/02/24.
//

import Foundation

public struct BillPresenterDTO {
    public var title: String?
    public var day: String?
    public var month: String?
    public var dayOfWeek: String?
    public var time: String?
    public var countPerson: String?
    public var amountPaid: String?
    public var address: AddressPresenterDTO?
    
    public init(title: String? = nil, day: String? = nil, month: String? = nil, dayOfWeek: String? = nil, time: String? = nil, countPerson: String? = nil, amountPaid: String? = nil, address: AddressPresenterDTO? = nil) {
        self.title = title
        self.day = day
        self.month = month
        self.dayOfWeek = dayOfWeek
        self.time = time
        self.countPerson = countPerson
        self.amountPaid = amountPaid
        self.address = address
    }
    
}


