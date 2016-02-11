//
//  ViewController.swift
//  TicTacToe app
//
//  Created by student1 on 2/8/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    
    let letter = "OX"
    var currentLetter = Character!()
    var decide = 0
    var labelArray = [UILabel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentLetter()
        labelArray = [label1,label2,label3,label4,label5,label6,label7,label8,label9]
    }
    
    @IBAction func tapped(sender: UITapGestureRecognizer) {
        let selectedPointed = sender.locationInView(self.view)
        for item in labelArray {
            if CGRectContainsPoint(item.frame, selectedPointed) {
                item.text = String(currentLetter)
                decide++
            }
            if decide == 2 {
                reset()
            }
        }
        checkForWinner()
        getCurrentLetter()
        
    }
    
    func getCurrentLetter()
    {
        let myRange = Range<String.Index>(start: letter.startIndex.advancedBy(decide), end: letter.startIndex.advancedBy(decide+1))
        currentLabel.text = letter.substringWithRange(myRange)
        currentLetter = Character(letter.substringWithRange(myRange))
    }
    func reset() {
        decide = 0
    }
    
    func checkForWinner()
    {
        
        if label1.text == label2.text && label2.text == label3.text && label3.text != ""
        {
            presentWinningAlert("\(label3.text!)")
        }
        else if label4.text == label5.text && label5.text == label6.text && label6.text != ""
        {
            presentWinningAlert("\(label6.text!)")
        }
        else if label7.text == label8.text && label8.text == label9.text && label9.text != ""
        {
            presentWinningAlert("\(label9.text!)")
        }
        else if label1.text == label4.text && label4.text == label7.text && label7.text != ""
        {
            presentWinningAlert("\(label7.text!)")
        }
        else if label2.text == label5.text && label5.text == label8.text && label8.text != ""
        {
            presentWinningAlert("\(label8.text!)")
        }
        else if label3.text == label6.text && label6.text == label9.text && label9.text != ""
        {
            presentWinningAlert("\(label9.text!)")
        }
        else if label1.text == label5.text && label5.text == label9.text && label9.text != ""
        {
            presentWinningAlert("\(label9.text!)")
        }
        else if label3.text == label5.text && label5.text == label7.text && label7.text != ""
        {
            presentWinningAlert("\(label7.text!)")
        }
        if decide == 9
        {
            presentWinningAlert("No One")
        }
    }
    func presentWinningAlert(alert: String) {
        let presentAlert = UIAlertController(title: "The Winner is", message: nil, preferredStyle: .Alert)
        let reset = UIAlertAction(title: "Reset", style: UIAlertActionStyle.Default, handler: clearLabels)
        presentAlert.addAction(reset)
        presentViewController(presentAlert, animated: true, completion: nil)
    }
    
    func clearLabels(action: UIAlertAction)
    {
        label1.text = ""
        label2.text = ""
        label3.text = ""
        label4.text = ""
        label5.text = ""
        label6.text = ""
        label7.text = ""
        label8.text = ""
        label9.text = ""
    }
    @IBAction func dragObject(sender: UIPanGestureRecognizer) {
        let points = sender.locationInView(view)
        let currentPoints = currentLabel.frame.origin
        currentLabel.center = CGPointMake(points.x, points.y)
        for item in labelArray {
            if CGRectContainsPoint(item.frame, points) {
                item.text = String(currentLabel)
                currentLabel.center = currentPoints
            }
        }
    }
    
}

