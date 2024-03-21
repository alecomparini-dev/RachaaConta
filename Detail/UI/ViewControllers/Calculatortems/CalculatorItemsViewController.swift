//  Created by Alessandro Comparini on 04/03/24.
//

import UIKit

import CustomComponentsSDK
import Presenter

public protocol CalculatorItemsViewControllerCoordinator: AnyObject {
    func gotoAddItem()
    func gotoTrocar()
}


public class CalculatorItemsViewController: UIViewController {
    public weak var coordinator: CalculatorItemsViewControllerCoordinator?
    
    private let viewModel: CalculatortemsViewModel
    
    public init(viewModel: CalculatortemsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        configDidLoad()
    }
     
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configDidLayoutSubviews()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configWillAppear()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
//  MARK: - PRIVATE AREA
    private func configDidLoad() {
        fetchBillItems()
        configDelegate()
        showKeyboardCollection()
        showListItems()
    }
    
    private func configDidLayoutSubviews() {
        screen.backButtonView.applyNeumorphism()
        screen.nameBillUnderline.applyShadow()
        screen.underlineItem.applyShadow()
    }
    
    private func configWillAppear() {
        screen.backgroundView.applyGradient()
    }

    
    private func configDelegate() {
        screen.backButtonView.delegate = self
        screen.keyboardList.setDelegate(self)
        screen.listItems.setDelegate(self)
    }
    
    
    private func showKeyboardCollection() {
        screen.keyboardList.show()
    }
    
    private func showListItems() {
        screen.listItems.show()
    }
    
    private func fetchBillItems() {
        viewModel.fetchBillItems()
    }
    
    private func rowViewCallBackListItems(_ row: Int) -> Any {
        return ListItemsView(billItemPresenterDTO: viewModel.getBillItem(row))
    }
    
    private func rowViewCallBackKeyBoardList(_ row: Int) -> Any {
        switch row {
            case 0:
                let line = Line0KeyboardView()
                line.applyStyles()
                return line
                
            case 1:
                let line = Line1KeyboardView()
                line.applyStyles()
                return line
                
            case 2:
                let line = Line2KeyboardView()
                line.applyStyles()
                line.delegate = self
                return line
                            
        default:
            return UIView()
        }
    }
    
    
}



//  MARK: - EXTENSION - BackButtonViewDelegate
extension CalculatorItemsViewController: ListDelegate {
    public func numberOfSections(_ list: ListBuilder) -> Int {
        return viewModel.numberOfSections()
    }
    
    public func numberOfRows(_ list: ListBuilder, section: Int) -> Int {
        if list.id == CalculatorItemsView.listItemsID { return viewModel.numberOfRowsBillItems() }
        if list.id == CalculatorItemsView.keyboardID { return 3 }
        return 0
    }
    
    public func rowViewCallBack(_ list: ListBuilder, section: Int, row: Int) -> Any {
        if list.id == CalculatorItemsView.listItemsID {
            return rowViewCallBackListItems(row)
        }
        
        return rowViewCallBackKeyBoardList(row)
    }

    public func sectionViewCallback(_ list: CustomComponentsSDK.ListBuilder, section: Int) -> UIView? {
        nil       
    }
    
    public func didSelectItemAt(_ list: ListBuilder, _ section: Int, _ row: Int) {
        
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
    
    func saveItemButtonTapped() {
        coordinator?.gotoAddItem()
    }
    
    
}

