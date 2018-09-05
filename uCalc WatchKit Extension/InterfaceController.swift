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
    if let hist = UserDefaults.standard.string(forKey: "history") {
      currentHistory = hist
      historyLabel.setText(currentHistory)
      resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
    }
  }
  
  override func didDeactivate() {
    super.didDeactivate()
    historyLabel.setText("")
    resultLabel.setText("")
  }
  
  @IBAction func one() {
    currentHistory = "\(currentHistory)1"
    historyLabel.setText(currentHistory)
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func two() {
    currentHistory = "\(currentHistory)2"
    historyLabel.setText(currentHistory)
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func three() {
    currentHistory = "\(currentHistory)3"
    historyLabel.setText(currentHistory)
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func four() {
    currentHistory = "\(currentHistory)4"
    historyLabel.setText(currentHistory)
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func five() {
    currentHistory = "\(currentHistory)5"
    historyLabel.setText(currentHistory)
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func six() {
    currentHistory = "\(currentHistory)6"
    historyLabel.setText(currentHistory)
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func seven() {
    currentHistory = "\(currentHistory)7"
    historyLabel.setText(currentHistory)
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func eight() {
    currentHistory = "\(currentHistory)8"
    historyLabel.setText(currentHistory)
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func nine() {
    currentHistory = "\(currentHistory)9"
    historyLabel.setText(currentHistory)
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func zero() {
    currentHistory = "\(currentHistory)0"
    historyLabel.setText(currentHistory)
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func comma() {
    if (currentHistory.last != "."){
      if (Calculator.differentFromSpecial(currentHistory: currentHistory)){
        currentHistory = "\(currentHistory)."
        historyLabel.setText(currentHistory)
        Calculator.saveHistory(currentHistory: currentHistory)
      }
    }
  }
  
  @IBAction func backspace() {
    if (currentHistory.last == " "){
      currentHistory = "\(currentHistory.dropLast().dropLast().dropLast())"
      historyLabel.setText(currentHistory)
    } else {
      currentHistory = "\(currentHistory.dropLast())"
      historyLabel.setText(currentHistory)
    }
    if currentHistory == "" {
      resultLabel.setText("")
      Calculator.saveHistory(currentHistory: currentHistory)
    }
    resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
  }
  
  @IBAction func plus() {
    if (Calculator.differentFromSpecial(currentHistory: currentHistory)){
      currentHistory = "\(currentHistory) + "
      historyLabel.setText(currentHistory)
      Calculator.saveHistory(currentHistory: currentHistory)
    }
  }
  
  @IBAction func minus() {
    if (Calculator.differentFromSpecial(currentHistory: currentHistory)){
      currentHistory = "\(currentHistory) - "
      historyLabel.setText(currentHistory)
      Calculator.saveHistory(currentHistory: currentHistory)
    }
  }
  
  @IBAction func multiply() {
    if (Calculator.differentFromSpecial(currentHistory: currentHistory)){
      currentHistory = "\(currentHistory) x "
      historyLabel.setText(currentHistory)
      Calculator.saveHistory(currentHistory: currentHistory)
    }
  }
  
  @IBAction func divide() {
    if (Calculator.differentFromSpecial(currentHistory: currentHistory)){
      currentHistory = "\(currentHistory) ÷ "
      historyLabel.setText(currentHistory)
      Calculator.saveHistory(currentHistory: currentHistory)
    }
  }
  
  
  override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
    print(segueIdentifier)
    return nil
  }
  
  
}
