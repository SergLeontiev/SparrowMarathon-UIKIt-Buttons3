//
//  ResultButton.swift
//  SparrowMarathon-UIKIt-Buttons3
//
//  Created by Sergey Leontiev on 4.11.24..
//

import UIKit

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
        setupViews()
        
        configuration?.title = title
    }
}

private extension ResultButton {
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.image = UIImage(systemName: "arrow.forward.circle.fill")
        config.imagePadding = 8
        config.imagePlacement = .trailing
       
        configuration = config
    }
}
