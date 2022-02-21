//
//  ViewController.swift
//  i-wanna-smile
//
//  Created by 이정우 on 2022/02/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var faceView : UIView!
    @IBOutlet weak var firstEyeView : UIView!
    @IBOutlet weak var secondEyeView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        faceView.layer.borderWidth = 7
        faceView.layer.borderColor = UIColor.black.cgColor
        faceView.clipsToBounds = true
        faceView.layer.cornerRadius = 120
        
        firstEyeView.clipsToBounds = true
        firstEyeView.layer.cornerRadius = 25
        
        secondEyeView.clipsToBounds = true
        secondEyeView.layer.cornerRadius = 25
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let mouthview = mouthview(frame: self.view.frame)
        mouthview.backgroundColor = .clear
        faceView.addSubview(mouthview)
        print("a\(touches.first!.location(in: touches.first?.view))")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("b\(touches.first!.location(in: touches.first?.view))")
    }

}

class mouthview : UIView {
    
    let path = UIBezierPath()
    
    override func draw(_ rect: CGRect) {
        path.move(to: CGPoint(x: 80, y: 160))
        path.lineWidth = 10
        path.addLine(to: CGPoint(x: 160, y: 160))
        path.stroke()
    }
    
    
}

