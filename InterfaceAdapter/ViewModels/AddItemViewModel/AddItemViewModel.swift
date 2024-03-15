//  Created by Alessandro Comparini on 15/03/24.
//

import Foundation

public protocol AddItemViewModel {
    
    func fetchFavoriteItems()
    
    func getItem(_ section: Int, _ row: Int) -> String
        
    func numberOfSections() -> Int

    func numberOfRows(_ section: Int) -> Int
    
    func isFirstRow(_ section: Int, _ row: Int) -> Bool
    
    func isLastRow(_ section: Int, _ row: Int) -> Bool
}
