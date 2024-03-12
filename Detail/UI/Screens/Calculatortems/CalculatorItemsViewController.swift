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
    public func numberOfSections(_ list: ListBuilder) -> Int { 1 }
    
    public func numberOfRows(_ list: ListBuilder, section: Int) -> Int { 3 }
    
    public func rowViewCallBack(_ list: ListBuilder, section: Int, row: Int) -> Any {
        switch row {
            case 0:
                return Line0KeyboardView()
                
            case 1:
                return Line1KeyboardView()
                
            case 2:
                let line2 = Line2KeyboardView()
//                line2.delegate = self
                return line2
                            
        default:
            return UIView()
        }
    }

    public func sectionViewCallback(_ list: CustomComponentsSDK.ListBuilder, section: Int) -> UIView? {
        nil       
    }
    
    public func didSelectItemAt(_ list: ListBuilder, _ section: Int, _ row: Int) {
        print("SELECIONOU UMA LINHA ")
    }
    
}


//  MARK: - EXTENSION - BackButtonViewDelegate
extension CalculatorItemsViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoTrocar()
    }
    
}

//  MARK: - EXTENSION - BackButtonViewDelegate
extension CalculatorItemsViewController: Line2KeyboardViewDelegate {
    
    func buttonSaveItemTapped(_ button: ButtonImageBuilder) {
        print("A+3PERTOU A PORRA DO SALVAR")
    }
    
    
}

