//  Created by Alessandro Comparini on 17/03/24.
//

import Foundation

public class CalculatortemsViewModelImpl: CalculatortemsViewModel {
    
    private var billItems = [BillItemPresenterDTO]()
    
    public init() {    }
    
    public func fetchBillItems() {
        billItems = [
            BillItemPresenterDTO(descriptionItem: "Brahma 600", quantity: "990", unitValue: "999,99", totalValue: "9999,99"),
            BillItemPresenterDTO(descriptionItem: "Gin Wolves", quantity: "3", unitValue: "98,99", totalValue: "296,97"),
            BillItemPresenterDTO(descriptionItem: "Sanduba do Caralho", quantity: "2", unitValue: "49,98", totalValue: "99,96"),
            BillItemPresenterDTO(descriptionItem: "Sanduba do Caralho com Bacon", quantity: "400", unitValue: "550,49", totalValue: "2210,96"),
            BillItemPresenterDTO(descriptionItem: "Porção Batata", quantity: "2", unitValue: "52,90", totalValue: "105,80"),
            BillItemPresenterDTO(descriptionItem: "Porção", quantity: "222", unitValue: "5,90", totalValue: "1,80"),
            BillItemPresenterDTO(descriptionItem: "Nome Bem Grande Que Não Cabe na Porra do Caralho", quantity: "2", unitValue: "1,00", totalValue: "0,00"),
        ]
    }
    
    public func getBillItem(_ row: Int) -> BillItemPresenterDTO {
        billItems[row]
    }
    
    public func numberOfSections() -> Int { 1 }
    
    public func numberOfRowsBillItems() -> Int { billItems.count }
    
}
