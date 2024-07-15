//
//  MiniGameCustomView.swift
//  HomeworkMiniGame
//
//  Created by Левиафан on 2024-06-20.
//

import UIKit

class MiniGameCustomView: UIView {
    
    var customView: UIView!
    var xibName: String = "MiniGameCustomView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }
    
    func getFromXib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setCustomView() {
        customView = getFromXib()
        customView.frame = bounds
        customView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        customView.layer.cornerRadius = frame.size.width / 2
        addSubview(customView)
    }
    
}
