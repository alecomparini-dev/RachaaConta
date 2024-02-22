//  Created by Alessandro Comparini on 22/02/24.
//

import Foundation
import CustomComponentsSDK

class NeumorphismTextFieldView {
        
    public static func set(_ textField: TextFieldBuilder?) {
        guard let textField else {return}
        
        textField
            .setNeumorphism({ build in
                build
                    .setReferenceColor(Theme.shared.currentTheme.surfaceContainer)
                    .setShape(.concave)
                    .setLightPosition(.leftTop)
                    .setIntensity(to: .light, percent: 60)
                    .setIntensity(to: .dark, percent: 100)
                    .setBlur(to: .light, percent: 5)
                    .setBlur(to: .dark, percent: 10)
                    .setDistance(to: .light, percent: 4)
                    .setDistance(to: .dark, percent: 10)
                    .setShadowColor(to: .dark, color: .black)
                    .apply()
            })
        
            
    }
    
    
}
