import UIKit

public final class TKPageControl: UIPageControl, ViewInitializable {
    
    // MARK: Properties
    public var numberOfDots: Int {
        get {
            return numberOfPages
        }
        set {
            numberOfPages = newValue
        }
    }
    
    public var activeDotColor: UIColor? {
        get {
            return currentPageIndicatorTintColor
        }
        set {
            currentPageIndicatorTintColor = newValue
        }
    }
    
    public var inactiveDotColor: UIColor? {
        get {
            return pageIndicatorTintColor
        }
        set {
            pageIndicatorTintColor = newValue
        }
    }
}
