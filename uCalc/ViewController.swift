//
//  ViewController.swift
//  uCalc
//
//  Created by Gregory Mendes on 04/09/18.
//  Copyright © 2018 Sptd. All rights reserved.
//

import UIKit
import Expression

class ViewController: UIViewController {
  
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var historyLabel: UILabel!
  var currentHistory: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func one() {
    currentHistory = "\(currentHistory)1"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func two() {
    currentHistory = "\(currentHistory)2"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func three() {
    currentHistory = "\(currentHistory)3"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func four() {
    currentHistory = "\(currentHistory)4"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func five() {
    currentHistory = "\(currentHistory)5"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func six() {
    currentHistory = "\(currentHistory)6"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func seven() {
    currentHistory = "\(currentHistory)7"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func eight() {
    currentHistory = "\(currentHistory)8"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func nine() {
    currentHistory = "\(currentHistory)9"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func zero() {
    currentHistory = "\(currentHistory)0"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func comma() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory)."
      historyLabel.text = currentHistory
    }
  }
  
  
  @IBAction func backspace() {
    if (currentHistory.last == " "){
      currentHistory = "\(currentHistory.dropLast().dropLast().dropLast())"
      historyLabel.text = currentHistory
    } else {
      currentHistory = "\(currentHistory.dropLast())"
      historyLabel.text = currentHistory
    }
    if currentHistory == "" {
      resultLabel.text = ""
    }
    calculate()
  }
  
  @IBAction func plus() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory) + "
      historyLabel.text = currentHistory
    }
  }
  
  @IBAction func minus() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory) - "
      historyLabel.text = currentHistory
    }
  }
  
  @IBAction func multiply() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory) x "
      historyLabel.text = currentHistory
    }
  }
  
  @IBAction func divide() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory) ÷ "
      historyLabel.text = currentHistory
    }
  }
  
  
  @IBAction func parentesisLeft() {
    currentHistory = "\(currentHistory)("
    historyLabel.text = currentHistory
  }
  
  @IBAction func parentesisRight() {
    currentHistory = "\(currentHistory))"
    historyLabel.text = currentHistory
  }
  
  @IBAction func pi() {
    currentHistory = "\(currentHistory)π"
    historyLabel.text = currentHistory
    calculate()
  }
  
  @IBAction func percent() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory)%"
      historyLabel.text = currentHistory
    }
  }
  
  func differentFromSpecial() -> Bool {
    if (currentHistory.last != nil && currentHistory.last != "+" &&
      currentHistory.last != "-" && currentHistory.last != "x" &&
      currentHistory.last != "," && currentHistory.last != "÷" &&
      currentHistory.last != " "){
      return true
    }
    return false
  }
  
  func calculate() {
    do {
      let result = try Expression(currentHistory
        .replacingOccurrences(of: "÷", with: "/")
        .replacingOccurrences(of: "x", with: "*")
        .replacingOccurrences(of: "π", with: " pi "))
        .evaluate()
      resultLabel.text = "\(result)"
      print("Result: \(result)")
    } catch {
      print("Error: \(error)")
    }
  }


}

