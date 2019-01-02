import UIKit

public final class TKScrollView: UIScrollView, ViewInitializable, UIScrollViewDelegate {
    
    // MARK: Properties
    var completionBlock: ((_ newPage: Int) -> Void)?
    
    // MARK: Life Cycle
    public convenience init(position: Position = (0, 0), size: Size = (0, 0)) {
        self.init(frame: CGRect(x: position.x, y: position.y, width: size.width, height: size.height))
        
        contentSize.height = frame.size.height
        showsHorizontalScrollIndicator = false
        isPagingEnabled = true
    }
    
    // MARK: - Functions
    override public func addSubview(_ view: UIView) {
        view.frame.origin.x = contentSize.width
        contentSize.width += view.frame.size.width
        
        super.addSubview(view)
    }
    
    public func notifyWhenPageChanges(completion: @escaping ((_ page: Int) -> Void)) {
        delegate = self
        self.completionBlock = completion
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let completion = completionBlock else { return }
        let pageIndex = Int(scrollView.contentOffset.x / bounds.width)
        
        completion(pageIndex)
    }
}
