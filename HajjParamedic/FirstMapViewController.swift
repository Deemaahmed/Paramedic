//
//  FirstMapViewController.swift
//  HajjParamedic
//
//  Created by Sara Alqubaisi on 8/3/18.
//  Copyright © 2018 Sara Alqubaisi. All rights reserved.
//

import UIKit

class FirstMapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func SureAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: "هل أنت متأكد من تشغيل خاصية التحكم بإشارة المرور؟", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "متأكد", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
