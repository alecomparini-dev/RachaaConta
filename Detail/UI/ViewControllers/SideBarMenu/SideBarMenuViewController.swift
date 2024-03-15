//  Created by Alessandro Comparini on 26/02/24.
//

import UIKit

public class SideBarMenuViewController: UIViewController {

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var screen: SideBarMenuView = {
        let comp = SideBarMenuView()
        return comp
    }()
    
 
    
//  MARK: - LIFE CICLE
    
    public override func loadView() {
        view = screen
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
}
