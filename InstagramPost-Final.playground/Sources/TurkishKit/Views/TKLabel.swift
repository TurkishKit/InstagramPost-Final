import UIKit


public final class TKLabel: UILabel, ViewInitializable {
    
    public enum FontStyle {
        case regular
        case medium
        case semibold
        case bold
        
        func weight() -> UIFont.Weight {
            switch self {
            case .regular:
                return .regular
            case .medium:
                return .medium
            case .semibold:
                return .semibold
            case .bold:
                return .bold
            }
        }
    }
    
    // MARK: Functions
    public func changeFont(size: Double, style: FontStyle, color: UIColor) {
        let newFont = UIFont.systemFont(ofSize: CGFloat(size), weight: style.weight())
        
        font = newFont
        textColor = color
        sizeToFit()
    }
}

