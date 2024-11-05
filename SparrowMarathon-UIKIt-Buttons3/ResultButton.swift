//
//  ResultButton.swift
//  SparrowMarathon-UIKIt-Buttons3
//
//  Created by Sergey Leontiev on 4.11.24..
//

import UIKit

protocol ButtonStyleable {
    var backgroundColor: UIColor { get }
    var foregroundColor: UIColor { get }
}

final class ResultButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        configuration?.title = title
    }
    
    override func tintColorDidChange() {
        switch tintAdjustmentMode {
        case .automatic, .normal:
            applyStyle(.primary)
        case .dimmed:
            applyStyle(.dimmed)
        @unknown default:
            fatalError("Unknown tintAdjustmentMode \(tintAdjustmentMode)")
        }
    }
}

private extension ResultButton {
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.plain()
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.image = UIImage(systemName: "arrow.forward.circle.fill")
        config.imagePadding = 8
        config.imagePlacement = .trailing
        configuration = config
        
        applyStyle(.primary)
        
        addTarget(self, action: #selector(scaleDown), for: .touchDown)
        addTarget(self, action: #selector(scaleUp), for: [.touchUpInside, .touchUpOutside])
    }
    
    @objc private func scaleDown() {
        UIView.animate(withDuration: Constants.animationDuration, delay: 0, options: Constants.animationOptions) {
            self.transform = CGAffineTransform(scaleX: Constants.scale, y: Constants.scale)
        }
    }
    
    @objc private func scaleUp() {
        UIView.animate(withDuration: Constants.animationDuration, delay: 0, options: Constants.animationOptions) {
            self.transform = .identity
        }
    }
    
    func applyStyle(_ style: Constants.Style) {
        configuration?.background.backgroundColor = style.backgroundColor
        configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.foregroundColor = style.foregroundColor
            return outgoing
        }
        configuration?.imageColorTransformer = UIConfigurationColorTransformer { _ in
            return style.foregroundColor
        }
    }
}

private extension ResultButton {
    enum Constants {
        static let animationDuration: TimeInterval = 0.2
        static let animationOptions: UIView.AnimationOptions = [.beginFromCurrentState, .allowUserInteraction]
        static let scale: CGFloat = 0.9
        
        enum Style: ButtonStyleable {
            case primary
            case dimmed
            
            var backgroundColor: UIColor {
                switch self {
                case .primary: return .systemBlue
                case .dimmed: return .systemGray2
                }
            }
            
            var foregroundColor: UIColor {
                switch self {
                case .primary: return .white
                case .dimmed: return .systemGray3
                }
            }
        }
    }
}
