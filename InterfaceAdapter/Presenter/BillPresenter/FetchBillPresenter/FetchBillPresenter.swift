//  Created by Alessandro Comparini on 21/02/24.
//

import Foundation

public protocol FetchBillPresenter {
    func fetchBill() async throws -> [ String ]
}
