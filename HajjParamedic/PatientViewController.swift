//
//  PatientViewController.swift
//  HajjParamedic
//
//  Created by Sara Alqubaisi on 8/3/18.
//  Copyright © 2018 Sara Alqubaisi. All rights reserved.
//

import UIKit

class PatientViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate{
    
    var picker_arr : [String]!
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker_arr = ["حريق","بتر","غرق","غيبوبة","إغماء"]
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker_arr.count
    }
    

   
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row:Int,forComponent component: Int) -> String?
    {
        return picker_arr[row]
        
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
