//  Created by Alessandro Comparini on 29/02/24.
//

import Foundation
import CustomComponentsSDK



class ContainerSearchMapView: ViewBuilder {
    
    override init() {
        super.init()
        configure()
    }
    
    
//  MARK: - LAZY PROPERTIES
    lazy var containerSearchBlurView: BlurBuilder = {
        let comp = BlurBuilder(style: .dark)
            .setOpacity(0.8)
            .setBorder({ build in
                build
                    .setCornerRadius(12)
            })
            .setAutoLayout { build in
                build.pin.equalToSuperview()
            }
        return comp
    }()
    
    lazy var containerShadow: ViewBuilder = {
        let comp = ViewBuilder()
            .setBorder({ build in
                build
                    .setRoundedCorners([.bottom])
            })
            .setShadow({ build in
                build
                    .setRadius(8)
                    .setColor(.black)
                    .setOffset(width: 0, height: 0)
//                    .apply()
            })
            .setAutoLayout { build in
                build
                    .top.equalTo(containerSearchBlurView, .bottom)
                    .leading.equalTo(containerSearchBlurView, .leading, 16)
                    .trailing.equalTo(containerSearchBlurView, .trailing, 6)
                    .height.equalToConstant(24)
            }
        return comp
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configBackgroundColor()
        addElements()
        configAutoLayout()
    }
    
    private func configBackgroundColor() {
        self.setBackgroundColor(.clear)
    }
    
    private func addElements() {
        containerSearchBlurView.add(insideTo: self)
        containerShadow.add(insideTo: self)
    }
    
    private func configAutoLayout() {
        containerSearchBlurView.applyAutoLayout()
        containerShadow.applyAutoLayout()
    }

    
}
