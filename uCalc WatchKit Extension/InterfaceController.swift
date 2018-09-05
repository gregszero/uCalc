//
//  InterfaceController.swift
//  uCalc WatchKit Extension
//
//  Created by Gregory Mendes on 04/09/18.
//  Copyright © 2018 Sptd. All rights reserved.
//

import WatchKit
import Foundation
import Expression

extension String {
  var expression: NSExpression {
    return NSExpression(format: self)
  }
}

class InterfaceController: WKInterfaceController {

  @IBOutlet var resultLabel: WKInterfaceLabel!
  @IBOutlet var historyLabel: WKInterfaceLabel!
  var currentHistory: String = ""
  
  override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
  
  @IBAction func one() {
    currentHistory = "\(currentHistory)1"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func two() {
    currentHistory = "\(currentHistory)2"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func three() {
    currentHistory = "\(currentHistory)3"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func four() {
    currentHistory = "\(currentHistory)4"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func five() {
    currentHistory = "\(currentHistory)5"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func six() {
    currentHistory = "\(currentHistory)6"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func seven() {
    currentHistory = "\(currentHistory)7"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func eight() {
    currentHistory = "\(currentHistory)8"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func nine() {
    currentHistory = "\(currentHistory)9"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func zero() {
    currentHistory = "\(currentHistory)0"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func comma() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory)."
      historyLabel.setText(currentHistory)
    }
  }
  
  
  @IBAction func backspace() {
    currentHistory = "\(currentHistory.dropLast())"
    historyLabel.setText(currentHistory)
    if currentHistory == "" {
      resultLabel.setText("")
    }
    calculate()
  }
  
  @IBAction func plus() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory) + "
      historyLabel.setText(currentHistory)
    }
  }
  
  @IBAction func minus() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory) - "
      historyLabel.setText(currentHistory)
    }
  }
  
  @IBAction func multiply() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory) x "
      historyLabel.setText(currentHistory)
    }
  }
  
  @IBAction func divide() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory) ÷ "
      historyLabel.setText(currentHistory)
    }
  }
  
  
  @IBAction func parentesisLeft() {
    currentHistory = "\(currentHistory)("
    historyLabel.setText(currentHistory)
  }
  
  @IBAction func parentesisRight() {
    currentHistory = "\(currentHistory))"
    historyLabel.setText(currentHistory)
  }
  
  @IBAction func pi() {
    currentHistory = "\(currentHistory)π"
    historyLabel.setText(currentHistory)
    calculate()
  }
  
  @IBAction func percent() {
    if (differentFromSpecial()){
      currentHistory = "\(currentHistory)%"
      historyLabel.setText(currentHistory)
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
      resultLabel.setText("\(result)")
      print("Result: \(result)")
    } catch {
      print("Error: \(error)")
    }
  }
  
}
