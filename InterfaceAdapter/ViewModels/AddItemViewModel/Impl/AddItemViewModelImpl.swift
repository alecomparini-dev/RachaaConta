//  Created by Alessandro Comparini on 15/03/24.
//

import Foundation

public class AddItemViewModelImpl: AddItemViewModel {
    private var favoriteItems = [String]()
    private var items = [String]()
    
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
        ]
        
        fetchItems()
    }
    
    public func fetchItems() {
        items = [
            "Brhama 600",
            "Original 300",
            "Cerveja Lata",
            "Bhrama Long Neck",
            "Porção de Peixe",
            "Porção de Batata",
            "Porção de Cebola",
            "Refrigerante",
            "Coca Cola 2L",
            "Coca Cola 600",
            "Guaraná",
        ]
    }
    
    public func getItem(_ section: Int, _ index: Int) -> String {
        switch section {
            case 0:
                return favoriteItems[index]
                
            default:
                return items[index]
        }
    }
    
    public func numberOfSections() -> Int {
        return 2
    }
    
    public func numberOfRows(_ section: Int) -> Int {
        switch section {
            case 0:
                return favoriteItems.count
                
            default:
                return items.count
        }
    }
    
    public func isFirstRow(_ section: Int, _ row: Int) -> Bool {
        return row == 0
    }
    
    public func isLastRow(_ section: Int, _ row: Int) -> Bool {
        switch section {
            case 0:
                return row == favoriteItems.count - 1
                
            default:
                return row == items.count - 1
        }
    }
    
}
