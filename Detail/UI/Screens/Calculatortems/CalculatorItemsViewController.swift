//  Created by Alessandro Comparini on 04/03/24.
//

import UIKit
import CustomComponentsSDK

public protocol CalculatorItemsViewControllerCoordinator: AnyObject {
    func gotoTrocar()
}


public class CalculatorItemsViewController: UIViewController {
    public weak var coordinator: CalculatorItemsViewControllerCoordinator?
    
    lazy var screen: CalculatorItemsView = {
        let comp = CalculatorItemsView()
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
        configDelegate()
        showKeyboardCollection()
    }
    
    private func configDelegate() {
        screen.backButtonView.delegate = self
        screen.keyboardList.setDelegate(self)
    }
    
    private func showKeyboardCollection() {
        screen.keyboardList.show()
    }
    
}



//  MARK: - EXTENSION - BackButtonViewDelegate
extension CalculatorItemsViewController: ListDelegate {
    public func numberOfSections(_ list: CustomComponentsSDK.ListBuilder) -> Int {
        1
    }
    
    public func numberOfRows(_ list: CustomComponentsSDK.ListBuilder, section: Int) -> Int {
        3
    }
    
    public func rowViewCallBack(_ list: CustomComponentsSDK.ListBuilder, section: Int, row: Int) -> UIView {
        switch row {
        case 0:
            return Line0KeyboardView().get
            
        case 1:
            return Line1KeyboardView().get
            
        case 2:
            return Line2KeyboardView().get
                        
        default:
            return UIView()
        }
    }

    public func sectionViewCallback(_ list: CustomComponentsSDK.ListBuilder, section: Int) -> UIView? {
        nil
    }
    
}


//  MARK: - EXTENSION - BackButtonViewDelegate
extension CalculatorItemsViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoTrocar()
    }
    
}
