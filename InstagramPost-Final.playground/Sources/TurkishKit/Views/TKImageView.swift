import UIKit

public final class TKImageView: UIImageView, ViewInitializable {
    
    // MARK: Life Cycle
    public convenience init(position: Position = (0, 0), size: Size, image: UIImage) {
        self.init(position: position, size: size)
        self.image = image
    }
    
    // MARK: Properties
    public var isRounded: Bool = false {
        willSet {
            if newValue {
                self.layer.cornerRadius = self.frame.size.width / 2.0
                self.clipsToBounds = true
            }else {
                self.layer.cornerRadius = 0.0
                self.clipsToBounds = false
            }
        }
    }
}
