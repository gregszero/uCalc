//
//  Extras.swift
//  uCalc WatchKit Extension
//
//  Created by Gregory Mendes on 05/09/18.
//  Copyright © 2018 Sptd. All rights reserved.
//

import WatchKit
import Foundation
import Expression

class ExtrasController: WKInterfaceController {
  
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
  
  @IBAction func parentesisLeft() {
    if (currentHistory.last == " "){
      currentHistory = "\(currentHistory)("
      historyLabel.setText(currentHistory)
      Calculator.saveHistory(currentHistory: currentHistory)
    } else {
      historyLabel.setText("Needs operator before '(' ")
    }
  }
  
  @IBAction func parentesisRight() {
    currentHistory = "\(currentHistory))"
    historyLabel.setText(currentHistory)
    Calculator.calculate(currentHistory: currentHistory)
  }
  
  @IBAction func pi() {
    if (currentHistory.last != "π" && currentHistory.last == " "){
      currentHistory = "\(currentHistory)π"
      historyLabel.setText(currentHistory)
      resultLabel.setText(Calculator.calculate(currentHistory: currentHistory))
    } else {
      historyLabel.setText("Needs operator before 'π' ")
    }
  }
  
  @IBAction func percent() {
    if (currentHistory.last != "%"){
      if (Calculator.differentFromSpecial(currentHistory: currentHistory)){
        currentHistory = "\(currentHistory)%"
        historyLabel.setText(currentHistory)
        Calculator.calculate(currentHistory: currentHistory)
      }
    }
  }
  
}
