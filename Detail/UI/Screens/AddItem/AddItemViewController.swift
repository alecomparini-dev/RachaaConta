//  Created by Alessandro Comparini on 07/03/24.
//


import UIKit
import CustomComponentsSDK

public protocol AddItemViewControllerCoordinator: AnyObject {
    func gotoBack()
}


public class AddItemViewController: UIViewController {
    public weak var coordinator: AddItemViewControllerCoordinator?
    
    lazy var screen: AddItemView = {
        let comp = AddItemView()
        return comp
    }()
    
    
    //  MARK: - LIFE CYCLE
    
    public override func loadView() {
        view = screen
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    //  MARK: - PRIVATE AREA
    private func configure() {
        
    }
    
    
}
