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
    public var onPrimary:UIColor { backgroundColor }
    public var primaryContainer: UIColor { UIColor.HEX("#28364d") }
    public var onPrimaryContainer: UIColor { UIColor.HEX("#eeeeee") }
}

extension ThemeDark: ThemeSecondaryColor {
    public var secondary: UIColor { UIColor.HEX("#006270") }
    public var onSecondary: UIColor { UIColor.HEX("#FFFFFF") }
    public var secondaryContainer: UIColor { .black }
    public var onSecondaryContainer: UIColor { .black }
}

extension ThemeDark: ThemeTertiaryColor {
    public var tertiary: UIColor { UIColor.HEX("#ff6f26") }
    public var onTertiary: UIColor { UIColor.HEX("#eeeeee") }
    public var tertiaryContainer: UIColor { .black }
    public var onTertiaryContainer: UIColor { .black }
}

extension ThemeDark: ThemeGradientColor {
    public var backgroundColorGradient: [UIColor] { [backgroundColor, backgroundColor.adjustBrightness(-70)] }
    public var primaryGradient: [UIColor] { [primary, UIColor.HEX("#006270")] }
    public var secondaryGradient: [UIColor] { [secondary, UIColor.HEX("#eeeeee")] }
    public var tertiaryGradient: [UIColor] { [tertiary, UIColor.HEX("#ff6b00")] }
}


extension ThemeDark: ThemeSurface {
    public var surfaceContainerHighest: UIColor { UIColor.HEX("#41484a") }
    public var surfaceContainerHigh: UIColor { surfaceContainerHighest.adjustBrightness(-25) }
    public var surfaceContainer: UIColor { surfaceContainerHighest.adjustBrightness(-40) }
    public var surfaceContainerLow: UIColor { surfaceContainerHighest.adjustBrightness(-60) }
    public var surfaceContainerLowest: UIColor { surfaceContainerHighest.adjustBrightness(-80) }

    public var onSurface: UIColor { UIColor.HEX("#eeeeee") }
    public var onSurfaceInverse: UIColor { UIColor.HEX("#050505") }
    public var onSurfaceVariant: UIColor { onSurface.adjustBrightness(-40) }
}

