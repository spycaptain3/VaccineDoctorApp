//
//  thirdPageViewController.swift
//  VaccineDoctorApp
//
//  Created by Deepak Gupta on 29/08/22.
//

import UIKit

class thirdPageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        firstView.layer.masksToBounds = true
        firstView.layer.shadowRadius = 20
        firstView.layer.shadowOpacity = 30
        firstView.layer.shadowOffset = CGSize(width: 20, height: 40)
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height/2
        
        firstView.layer.cornerRadius = firstView.frame.height/8
        firstView.layer.backgroundColor = UIColor.white.cgColor
        firstView.layer.shadowColor = UIColor.gray.cgColor
        firstView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        firstView.layer.shadowRadius = 7.0
        firstView.layer.shadowOpacity = 0.5
        firstView.layer.masksToBounds = false

        
        secondView.layer.cornerRadius = firstView.frame.height/8
        secondView.layer.backgroundColor = UIColor.white.cgColor
        secondView.layer.shadowColor = UIColor.gray.cgColor
        secondView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        secondView.layer.shadowRadius = 7.0
        secondView.layer.shadowOpacity = 0.5
        secondView.layer.masksToBounds = false
        
        thirdView.layer.cornerRadius = firstView.frame.height/8
        thirdView.layer.backgroundColor = UIColor.white.cgColor
        thirdView.layer.shadowColor = UIColor.gray.cgColor
        thirdView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        thirdView.layer.shadowRadius = 7.0
        thirdView.layer.shadowOpacity = 0.5
        thirdView.layer.masksToBounds = false

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
