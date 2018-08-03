//
//  PatientViewController.swift
//  HajjParamedic
//
//  Created by Sara Alqubaisi on 8/3/18.
//  Copyright © 2018 Sara Alqubaisi. All rights reserved.
//

import UIKit

class PatientViewController:  UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        
    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    
        
        let thePicker = UIPickerView()
        
        let thePicker2 = UIPickerView()
        
        
        let picker_arr = ["حريق","بتر","غرق","غيبوبة","إغماء"]
        let picker_arr2 = ["بسيطة","متوسطة","خطيرة"]
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            thePicker.tag=1
            thePicker2.tag=5
            txtField.inputView = thePicker
            txtField2.inputView = thePicker2
            
            txtField.placeholder = "نوع الحالة"
            txtField2.placeholder = "خطورة الحالة"
            
            
            txtField.inputView = thePicker
            txtField2.inputView = thePicker2
            
            thePicker.delegate = self
            thePicker2.delegate = self
        }
        
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView == thePicker {
                return picker_arr.count}
            else if pickerView == thePicker2 {
                return picker_arr2.count
            }
            return -1
            
        }
        
        func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            
            if pickerView == thePicker {
                return picker_arr[row]
            }
            else if pickerView == thePicker2 {
                return picker_arr2[row]
            }
            return nil
            
        }
        
        func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            
            if pickerView == thePicker {
                
                txtField.text = picker_arr[row]
                txtField.resignFirstResponder()
            }
                
            else if pickerView == thePicker2{
                
                txtField2.text = picker_arr2[row]
                txtField2.resignFirstResponder()

                
            }}
        
        
}
