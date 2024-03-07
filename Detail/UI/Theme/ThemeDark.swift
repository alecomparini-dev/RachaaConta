//  Created by Alessandro Comparini on 15/02/24.
//

import CustomComponentsSDK

import UIKit

public struct ThemeDark: ThemeProtocol {
    
    public init () {}
    
    public var backgroundColor: UIColor { UIColor.HEX("#292D2E")}
    public var error: UIColor { UIColor.HEX("#c81b1a") }
    public var onError: UIColor { UIColor.HEX("#d3d3d3") }
}

extension ThemeDark: ThemePrimaryColor {
    public var primary: UIColor { UIColor.HEX("#00e0c7") }
    public var onPrimary:UIColor { backgroundColor.withAlphaComponent(0.75) }
    public var primaryContainer: UIColor { UIColor.HEX("#28364d") }
    public var onPrimaryContainer: UIColor { UIColor.HEX("#d1d3d2") }
}

extension ThemeDark: ThemeSecondaryColor {
    public var secondary: UIColor { UIColor.HEX("#ee975a") }
    public var onSecondary: UIColor { backgroundColor.withAlphaComponent(0.75) }
    public var secondaryContainer: UIColor { .black }
    public var onSecondaryContainer: UIColor { .black }
}

extension ThemeDark: ThemeTertiaryColor {
    public var tertiary: UIColor { UIColor.HEX("#006270") }
    public var onTertiary:  UIColor { UIColor.HEX("#ffffff") }
    public var tertiaryContainer: UIColor { .black }
    public var onTertiaryContainer: UIColor { .black }
}

extension ThemeDark: ThemeGradientColor {
    public var backgroundColorGradient: [UIColor] { [backgroundColor, backgroundColor.adjustBrightness(-80)] }
    public var primaryGradient: [UIColor] { [primary, UIColor.HEX("#019f8e")] }
    public var secondaryGradient: [UIColor] { [secondary, UIColor.HEX("#ff6b00")] }
    public var tertiaryGradient: [UIColor] { [tertiary, UIColor.HEX("#00c7e3")] }
}


extension ThemeDark: ThemeSurface {
    public var surfaceContainerHighest: UIColor { UIColor.HEX("#41484a") }
    public var surfaceContainerHigh: UIColor { surfaceContainerHighest.adjustBrightness(-25) }
    public var surfaceContainer: UIColor { surfaceContainerHighest.adjustBrightness(-40) }
    public var surfaceContainerLow: UIColor { surfaceContainerHighest.adjustBrightness(-60) }
    public var surfaceContainerLowest: UIColor { surfaceContainerHighest.adjustBrightness(-80) }

    public var onSurface: UIColor { UIColor.HEX("#d1d3d2") }
    public var onSurfaceInverse: UIColor { UIColor.HEX("#050505") }
    public var onSurfaceVariant: UIColor { onSurface.adjustBrightness(-40) }
}

