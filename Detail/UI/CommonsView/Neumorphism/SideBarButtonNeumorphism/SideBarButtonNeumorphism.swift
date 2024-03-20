//  Created by Alessandro Comparini on 19/03/24.
//

import UIKit

import CustomComponentsSDK

struct SideBarButtonNeumorphism {

    private let component: BaseBuilder
    
    init(_ component: BaseBuilder) {
        self.component = component
    }
    
    func configNeumorphism() {
        component.setNeumorphism({ build in
            build
                .setReferenceColor(Theme.shared.currentTheme.backgroundColor)
                .setShape(.convex)
                .setLightPosition(.leftTop)
                .setIntensity(to: .light, percent: 30)
                .setIntensity(to: .dark, percent: 100)
                .setBlur(to: .light, percent: 8)
                .setBlur(to: .dark, percent: 10)
                .setDistance(to: .light, percent: 4)
                .setDistance(to: .dark, percent: 10)
                .setShadowColor(to: .dark, color: .black)
        })
    }
    
}
