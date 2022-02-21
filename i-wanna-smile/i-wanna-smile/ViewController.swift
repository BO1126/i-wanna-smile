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
    @IBOutlet weak var checkImageView : UIImageView!
    
    var touchBeganLocation = CGPoint(x: 0.0, y: 0.0)
    var yValue = 160
    var greenValue = 0
    var blueValue = 0
    
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
        touchBeganLocation = touches.first!.location(in: touches.first?.view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if yValue < 235{
            if touches.first!.location(in: touches.first?.view).y < touchBeganLocation.y{
                self.yValue += 1
                self.greenValue += 3
                self.blueValue += 2
                let mouthview = mouthview(frame: self.view.frame)
                mouthview.backgroundColor = .clear
                mouthview.path.move(to: CGPoint(x: 60, y: 160))
                mouthview.path.addQuadCurve(to: CGPoint(x: 180, y: 160), controlPoint: CGPoint(x: 120, y: self.yValue))
                faceView.addSubview(mouthview)
                faceView.backgroundColor = UIColor(red: 229/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
            }
            
            if yValue == 234{
                self.checkImageView.image = UIImage(systemName: "smiley.fill")
                self.checkImageView.tintColor = UIColor.systemGreen
                
            }
        }
    }
    
}

class mouthview : UIView {
    
    let path = UIBezierPath()
    
    override func draw(_ rect: CGRect) {
        path.move(to: CGPoint(x: 60, y: 160))
        path.addLine(to: CGPoint(x: 180, y: 160))
        path.stroke()
    }
    
    
}

