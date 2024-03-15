//  Created by Alessandro Comparini on 15/03/24.
//

import Foundation

public class AddItemViewModelImpl: AddItemViewModel {
    
    public func fetchFavoriteItems() -> [String] {
        
        return [
            "Água Mineral 510",
            "Barrigudinha",
            "Cerveja 600",
            "Cerveja Lata",
            "Comida",
            "Long Neck",
            "Porção",
            "Prato Feito",
            "Sanduba",
        ]
    }
    
    
    
}
