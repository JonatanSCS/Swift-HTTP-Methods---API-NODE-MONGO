//
//  PUTViewController.swift
//  API
//
//  Created by Jonatan Santa Cruz Soria on 15/05/15.
//  Copyright (c) 2015 Jonatan Santa Cruz Soria. All rights reserved.
//

import UIKit
import Alamofire

class PUTViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var putErrorLabel: UILabel!
    @IBOutlet var modelText: UITextField!
    @IBOutlet var styleText: UITextField!
    @IBOutlet var sizeText: UITextField!
    @IBOutlet var colourText: UITextField!
    @IBOutlet var priceText: UITextField!
    @IBOutlet var summaryText: UITextField!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        modelText.resignFirstResponder()
        styleText.resignFirstResponder()
        sizeText.resignFirstResponder()
        colourText.resignFirstResponder()
        priceText.resignFirstResponder()
        summaryText.resignFirstResponder()
        
        return true
    }

    
    func alamoPUT() {
        
        //For iOS device test change localhost:3000 to IP Direction
        Alamofire.request(.GET, "http://localhost:3000/tshirts")
            .responseJSON {(request, response, Tshirts, error) in
                
            let json = JSON(Tshirts!)
                
            if json.count >= 1 {
                
                let id = json[0]["_id"]
                println(id)
        
                let parameters_put = [
                    "model": self.modelText.text,
                    "price": self.priceText.text,
                    "style": self.styleText.text,
                    "size": self.sizeText.text,
                    "colour": self.colourText.text,
                    "summary": self.summaryText.text ]
        
    
                Alamofire.request(.PUT, "http://localhost:3000/tshirt/\(id)", parameters:parameters_put, encoding: .JSON) .responseJSON {
            (request, response, JSON, error) in
            
                }
            }

            else {
                println("No hay playeras")
                self.putErrorLabel.text = "No hay playeras"
                self.putErrorLabel.textColor = UIColor.blackColor()
            }
        }
    }
    
    
    
    
    @IBAction func send_PUTbutton(sender: AnyObject) {
        alamoPUT()
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
