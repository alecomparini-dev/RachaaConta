//  Created by Alessandro Comparini on 05/03/24.
//

import UIKit

import CustomComponentsSDK
import Handler


protocol Line2KeyboardViewDelegate: AnyObject {
    func buttonSaveItemTapped(_ button: ButtonImageBuilder)    
}


class Line2KeyboardView: ViewBuilder {
    weak var delegate: Line2KeyboardViewDelegate?
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var stackView: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setIsUserInteractionEnabled(true)
            .setAxis(.horizontal)
            .setDistribution(.fillEqually)
            .setAutoLayout { build in
                build.pin.equalToSuperview()
            }
        return comp
    }()
    
    lazy var stackLeft: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setIsUserInteractionEnabled(true)
            .setAxis(.horizontal)
            .setDistribution(.fillEqually)
        return comp
    }()

    lazy var stackRight: StackViewBuilder = {
        let comp = StackViewBuilder()
            .setIsUserInteractionEnabled(true)
            .setAxis(.horizontal)
            .setDistribution(.fillEqually)
        return comp
    }()

    lazy var viewNo0: ViewBuilder = {
        let comp = ViewBuilder()
            .setIsUserInteractionEnabled(true)
        return comp
    }()
    
    lazy var buttonNo0: DefaultButton = {
        let comp = DefaultButton(text: "0")
            .setIsUserInteractionEnabled(true)
            .setAutoLayout { build in
                build
                    .centerAlignXY.equalToSuperview()
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    lazy var viewComma: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
    lazy var buttonComma: ButtonBuilder = {
        let comp = ButtonBuilder(",")
            .setFontFamily(Const.Font.titilliumWebBold, 28)
            .setTintColor(Theme.shared.currentTheme.onSurface)
            .setAutoLayout { build in
                build
                    .horizontalAlignX.equalToSuperview()
                    .verticalAlignY.equalToSuperview(-6)
                    .width.equalToConstant(Const.Default.sizeButtonKeyboard.width)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
        return comp
    }()
    
    lazy var viewSaveItem: ViewBuilder = {
        let comp = ViewBuilder()
        return comp
    }()
    
    lazy var buttonSaveItem: PrimaryButton = {
        let comp = PrimaryButton(text: "OK")
            .setAutoLayout { build in
                build
                    .verticalAlignY.equalToSuperview()
                    .trailing.equalToSuperview(-18)
                    .width.equalTo(viewComma, multiplier: 1.35)
                    .height.equalToConstant(Const.Default.sizeButtonKeyboard.height)
            }
            .setActions { build in
                build
                    .setTap ({ component, tapGesture in
                        print("AGORAAA DEU TAPPP CARAIOOOO")
                    }, false)
            }
        return comp
    }()
    
    lazy var favoriteView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var favoriteButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isUserInteractionEnabled = true
        btn.setTitle("TESTE", for: .normal)
        btn.backgroundColor = .red
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return btn
    }()
    @objc private func favoriteButtonTapped(_ button: UIButton) {
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configAutoLayout()
        
//        self.get.addSubview(favoriteView)
        
//        favoriteView.addSubview(favoriteButton)
        
        self.get.addSubview(favoriteButton)
        
        NSLayoutConstraint.activate([
//            favoriteView.centerXAnchor.constraint(equalTo:  self.get.safeAreaLayoutGuide.centerXAnchor),
//            favoriteView.centerYAnchor.constraint(equalTo:  self.get.safeAreaLayoutGuide.centerYAnchor),
//            favoriteView.widthAnchor.constraint(equalToConstant: 50),
//            favoriteView.heightAnchor.constraint(equalToConstant: 50),
//            
//            favoriteButton.topAnchor.constraint(equalTo: favoriteView.topAnchor),
//            favoriteButton.leadingAnchor.constraint(equalTo: favoriteView.leadingAnchor),
//            favoriteButton.trailingAnchor.constraint(equalTo: favoriteView.trailingAnchor),
//            favoriteButton.bottomAnchor.constraint(equalTo: favoriteView.bottomAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: self.get.topAnchor),
            favoriteButton.leadingAnchor.constraint(equalTo: self.get.leadingAnchor),
//            favoriteButton.trailingAnchor.constraint(equalTo: self.get.trailingAnchor),
            favoriteButton.bottomAnchor.constraint(equalTo: self.get.bottomAnchor),
            favoriteView.widthAnchor.constraint(equalToConstant: 200),
//            favoriteView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        self.setBackgroundColor(.yellow)
        
        
    }
    
    private func addElements() {
        addStacks()
        addButtonComma()
        addButonNo0()
        addButtonSaveItem()
    }
    
    private func addStacks() {
        stackView.add(insideTo: self)
        stackLeft.add(insideTo: stackView)
        stackRight.add(insideTo: stackView)
    }
    
    private func addButtonComma() {
        viewComma.add(insideTo: stackLeft)
        buttonComma.add(insideTo: viewComma)
    }

    private func addButonNo0() {
        viewNo0.add(insideTo: stackLeft)
        buttonNo0.add(insideTo: viewNo0)
    }
    
    private func addButtonSaveItem() {
        viewSaveItem.add(insideTo: stackRight)
        buttonSaveItem.add(insideTo: viewSaveItem)
    }
    
    private func configAutoLayout() {
        stackView.applyAutoLayout()
        buttonNo0.applyAutoLayout()
        buttonComma.applyAutoLayout()
        buttonSaveItem.applyAutoLayout()
    }
    
    
}