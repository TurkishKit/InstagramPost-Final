import UIKit

public protocol ViewInitializable {
    
    // MARK: - Properties
    var size: (width: Double, height: Double) { get }
    
    var top: Double { get }
    var left: Double { get }
    var right: Double { get }
    var bottom: Double { get }
    
    // MARK: - Initializers
    init(position: Position, size: Size)
}

public extension ViewInitializable where Self: UIView {
    
    // MARK: - Types
    typealias Position = (x: Double, y: Double)
    typealias Size = (width: Double, height: Double)
    
    // MARK: - Initializers
    init(position: Position = (0, 0), size: Size = (0, 0)) {
        let position = CGPoint(x: position.x, y: position.y)
        let size = CGSize(width: size.width, height: size.height)
        let rectFrame = CGRect(origin: position, size: size)
        
        self.init(frame: rectFrame)
        self.backgroundColor = .white
    }
    
    // MARK: - Properties
    var size: (width: Double, height: Double) {
        return (Double(self.frame.size.width), Double(self.frame.size.height))
    }
    
    var top: Double {
        return Double(frame.origin.y)
    }
    
    var left: Double {
        return Double(frame.origin.x)
    }
    
    var right: Double {
        return Double(frame.origin.x) + Double(frame.size.width)
    }
    
    var bottom: Double {
        return Double(frame.origin.y) + Double(frame.size.height)
    }
}
