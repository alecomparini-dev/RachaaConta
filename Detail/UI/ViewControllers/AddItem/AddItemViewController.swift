//  Created by Alessandro Comparini on 07/03/24.
//


import UIKit

import CustomComponentsSDK
import Presenter


public protocol AddItemViewControllerCoordinator: AnyObject {
    func gotoBack()
}


public class AddItemViewController: UIViewController {
    public weak var coordinator: AddItemViewControllerCoordinator?
    
    private let viewModel: AddItemViewModel
    
    public init(viewModel: AddItemViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY AREA
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
        configDidAppear()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configDidLoad() {
        configDelegate()
    }
    
    private func configDidLayoutSubviews() {
        screen.backButtonView.applyNeumorphism()
        screen.underline.applyShadow()
        screen.nameBillUnderline.applyShadow()
    }
    
    private func configWillAppear() {
        screen.backgroundView.applyGradient()
        screen.searchItensList.show()
        viewModel.fetchFavoriteItems()
        
        DispatchQueue.main.async { [weak self] in
            self?.screen.saveItemButton.style.applyNeumorphism()
        }
    }
    
    private func configDidAppear() {
        
    }

    private func configDelegate() {
        screen.delegate = self
        screen.backButtonView.delegate = self
        screen.searchItensList.setDelegate(self)
    }
    
    private func createItemsViewCell(_ section: Int, _ row: Int) -> Any {
        let cell = ItemsViewCell(viewModel.getItem(section, row))
            .setGradient { build in
                build
                    .setReferenceColor(Theme.shared.currentTheme.surfaceContainerLow, percentageGradient: 30)
                    .setAxialGradient(.leftToRight)
                    .apply()
            }
        
        if viewModel.isLastRow(section, row) {
            cell.setBorder { build in
                build
                    .setCornerRadius(16)
                    .setRoundedCorners([.bottom])
            }
        }
        
        return cell
    }

    
}



//  MARK: - EXTENSION - AddItemViewDelegate
extension AddItemViewController: AddItemViewDelegate {
    
    func saveItemButtonTapped() {
        coordinator?.gotoBack()
    }
    
}


//  MARK: - EXTENSION - BackButtonViewDelegate
extension AddItemViewController: BackButtonViewDelegate {
    
    public func backButtonImageTapped() {
        coordinator?.gotoBack()
    }
    
}


//  MARK: - EXTENSION
extension AddItemViewController: ListDelegate {
    public func numberOfSections(_ list: CustomComponentsSDK.ListBuilder) -> Int {
        viewModel.numberOfSections()
    }
    
    public func numberOfRows(_ list: CustomComponentsSDK.ListBuilder, section: Int) -> Int {
        return viewModel.numberOfRows(section)
    }
    
    public func sectionViewCallback(_ list: CustomComponentsSDK.ListBuilder, section: Int) -> UIView? {
        var sectionView: SectionViewCell!
        
        if (section == 0 ) {
           sectionView = SectionViewCell(title: "FAVORITOS:",
                                          color: Theme.shared.currentTheme.secondary,
                                          fontColor: Theme.shared.currentTheme.onSecondary)
        } else {
            sectionView = SectionViewCell(title: "ITENS:")
        }
        
        DispatchQueue.main.async {
            sectionView.applyNeumorphism()
        }
        
        return sectionView.get
    }
    
    public func rowViewCallBack(_ list: CustomComponentsSDK.ListBuilder, section: Int, row: Int) -> Any {
        return createItemsViewCell(section, row)
    }
    
    public func scrollViewWillBeginDragging(_ list: ListBuilder, _ scrollView: UIScrollView) {
        screen.nameItemTextField.setHideKeyboard()
    }
    
}
