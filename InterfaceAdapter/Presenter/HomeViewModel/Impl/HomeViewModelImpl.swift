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
            BillPresenterDTO(title: "COCO BAMBÚ", amountPaid: "R$ 59,25", address: AddressPresenterDTO(street: "Rua Francisco Sales",number: "1228", city: "Uberlândia", state: "MG")),
            BillPresenterDTO(title: "MERCADO DO SEU JORGE MAGALHÃES", amountPaid: "R$ 159,25", address: AddressPresenterDTO(street: "Av. Nicomedes",number: "1228", city: "Uberlândia", state: "MG")),
            BillPresenterDTO(title: "OUTBACK", amountPaid: "R$ 599,00", address: AddressPresenterDTO(street: "Rua Marcos de Freitas Costas", number: "1228", city: "Uberlândia", state: "MG")),
            BillPresenterDTO(title: "BROTHERS NÃO SEI ONDE", amountPaid: "R$ 19,05", address: AddressPresenterDTO(street: "Rua Francisco Sales",number: "1228", city: "Uberlândia", state: "MG")),
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
