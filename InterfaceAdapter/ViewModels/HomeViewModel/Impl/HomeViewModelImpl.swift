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
            BillPresenterDTO(title: "COCO BAMBÚ", day: "16", month: "Jul", dayOfWeek: "terça-feira", time: "18:30", countPerson: "5", amountPaid: "R$ 59,25", address: AddressPresenterDTO(street: "Rua Francisco Sales",number: "1228", city: "Rio de Janeiro", state: "RJ")),
            BillPresenterDTO(title: "MERCADO DO SEU JORGE", day: "06", month: "Mai", dayOfWeek: "segunda-feira", time: "00:30", countPerson: "12", amountPaid: "R$ 159,25", address: AddressPresenterDTO(street: "Av. Nicomedes",number: "1228", city: "Uberlândia", state: "MG")),
            BillPresenterDTO(title: "OUTBACK",  day: "10", month: "Dez", dayOfWeek: "domingo", time: "12:39", countPerson: "9", amountPaid: "R$ 599,00", address: AddressPresenterDTO(street: "Rua Marcos de Freitas Costas", number: "1228", city: "São Paulo", state: "SP")),
            BillPresenterDTO(title: "BROTHERS NÃO SEI ONDE",  day: "31", month: "Dez", dayOfWeek: "sábado", time: "21:39", countPerson: "55", amountPaid: "R$ 19,05", address: AddressPresenterDTO(street: "Av. Dionysia Alves Barreto",number: "5201", city: "Uberlândia", state: "MG")),
        ]
        
    }
    
    public func getBill(_ index: Int) -> BillPresenterDTO {
        return bills[index]
    }
    
    public func heightForRowAt(_ index: Int) -> CGFloat { 240 }
    
    public func numberOfRowsInSection() -> Int {
        return bills.count
    }
    
}
