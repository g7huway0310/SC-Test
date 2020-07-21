//
//  ViewController.swift
//  SC Test
//
//  Created by guowei on 2020/7/12.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var Scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addImage()
        Scrollview.delegate=self
    }


    func addImage(){
        
        var picture:[UIImage]=[]
        
        picture.append(UIImage(named: "The Horse in Motion")!)
        picture.append(UIImage(named: "The Horse in Motion")!)
        picture.append(UIImage(named: "The Horse in Motion")!)
        
        self.Scrollview.contentSize=CGSize(width: Scrollview.frame.size.width*CGFloat(picture.count), height: Scrollview.frame.size.height)
        
        for i in 0..<picture.count{
            var frame=CGRect()
            frame.origin.x=Scrollview.frame.size.width*CGFloat(i)
            frame.origin.y=0
            frame.size=Scrollview.frame.size
            Scrollview.showsHorizontalScrollIndicator=false
            let subView=UIImageView(frame:frame)
            subView.image=picture[i]
            subView.contentMode = .scaleAspectFill
            self.Scrollview.addSubview(subView)
            
        }
        
    }
    func scrollViewDidScroll(_ scrollView:UIScrollView){
        let x=scrollView.contentOffset.x
        if x>0{
            if x>=scrollView.frame.size.width*2{
                
                self.Scrollview.contentOffset=CGPoint(x:scrollView.frame.size.width,y: 0)
                
            }
        }
        else if x<0{
             self.Scrollview.contentOffset=CGPoint(x:scrollView.frame.size.width*1,y: 0)
        }
        
        
    }
    
    
    
    
}

