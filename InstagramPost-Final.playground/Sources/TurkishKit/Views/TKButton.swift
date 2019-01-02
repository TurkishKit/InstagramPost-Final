import UIKit

final public class TKButton: UIButton, ViewInitializable {
    
    // MARK: - Life Cycle
    public convenience init(position: Position = (0, 0), size: Size = (0, 0)) {
        self.init(type: .custom)
        
        frame = CGRect(x: position.x, y: position.y, width: size.width, height: size.height)
        addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
        adjustsImageWhenHighlighted = false
    }
    
    // MARK: - Properties
    public override var isSelected: Bool {
        willSet {
            if newValue && selectedImage == nil {
                selectedImage = normalImage
            }
        }
    }
    
    public var isAnimated: Bool = false

    public var normalImage: UIImage? {
        get {
            return image(for: .normal)
        }
        set {
            setImage(newValue, for: .normal)
        }
    }
    
    public var selectedImage: UIImage? {
        get {
            return image(for: .selected)
        }
        set {
            setImage(newValue, for: .selected)
        }
    }
    
    public var title: String? {
        get {
            return title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    // MARK: - Functions
    @objc func touchUpInside(_ sender: UIButton) {
        if isAnimated {
            transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            UIViewPropertyAnimator(duration: 0.75, dampingRatio: 0.5) {
                self.isSelected.toggle()
                self.transform = .identity
            }.startAnimation()
        }else {
            isSelected.toggle()
        }
    }
    
    public func changeFont(size: Double, style: TKLabel.FontStyle, color: UIColor) {
        let newFont = UIFont.systemFont(ofSize: CGFloat(size), weight: style.weight())
        
        titleLabel?.font = newFont
        setTitleColor(color, for: .normal)
        sizeToFit()
    }
}

