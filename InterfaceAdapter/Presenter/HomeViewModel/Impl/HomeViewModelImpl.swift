//  Created by Alessandro Comparini on 20/02/24.
//

import Foundation

public class HomeViewModelImpl: HomeViewModel {
    
    private var bills = [BillPresenterDTO]()
    
//  MARK: - INITIALIZERS
    
    private let fetchBillPresenter: FetchBillPresenter
    
    public init(fetchBillPresenter: FetchBillPresenter) {
        self.fetchBillPresenter = fetchBillPresenter
    }
    
    
    
//  MARK: - PUBLIC AREA
    
    public func fetchBills() {
        bills = [
            BillPresenterDTO(title: "COCO BAMBÚ", amountPaid: "59,25"),
            BillPresenterDTO(title: "MERCADO DO SEU JORGE MAGALHÃES"),
            BillPresenterDTO(title: "OUTBACK"),
            BillPresenterDTO(title: "BROTHERS NÃO SEI ONDE"),
        ]
        
    }
    
    public func getBill(_ index: Int) -> BillPresenterDTO {
        return bills[index]
    }
    
    public func heightForRowAt(_ index: Int) -> CGFloat { 200 }
    
    public func numberOfRowsInSection() -> Int {
        return bills.count
    }
    
}
