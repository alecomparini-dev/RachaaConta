//  Created by Alessandro Comparini on 15/03/24.
//

import Foundation

public class AddItemViewModelImpl: AddItemViewModel {
    private var favoriteItems = [String]()
    
    public init() { }
    
    public func fetchFavoriteItems() {
        favoriteItems = [
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
    
    public func getItem(_ section: Int, _ index: Int) -> String {
        return favoriteItems[index]
    }
    
    public func numberOfSections() -> Int {
        return 2
    }
    
    public func numberOfRows(_ section: Int) -> Int {
        switch section {
            case 0:
                return favoriteItems.count
                
            default:
                return 20
        }
    }
    
    public func isFirstRow(_ section: Int, _ row: Int) -> Bool {
        return row == 0
    }
    
    public func isLastRow(_ section: Int, _ row: Int) -> Bool {
        return row == favoriteItems.count - 1
    }
    
}
