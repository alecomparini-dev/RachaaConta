//  Created by Alessandro Comparini on 23/02/24.
//


import UIKit

protocol Coordinator: AnyObject {
    var coordinator: Coordinator? { get set }
    
    var navigationController: NavigationController { get }
    
    var dataTransfer: Any? { get set }
    
    init(_ navigationController: NavigationController)
    
    func start()

}
