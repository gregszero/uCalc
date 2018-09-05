//
//  Calculator.swift
//  uCalc WatchKit Extension
//
//  Created by Gregory Mendes on 05/09/18.
//  Copyright © 2018 Sptd. All rights reserved.
//

import Foundation
import Expression

class Calculator {
  
  static func calculate(currentHistory: String) -> String {
    saveHistory(currentHistory: currentHistory)
    do {
      let result = try Expression(currentHistory
        .replacingOccurrences(of: "÷", with: "/")
        .replacingOccurrences(of: "x", with: "*")
        .replacingOccurrences(of: "π", with: " pi "))
        .evaluate()
      return "\(result)"
    } catch {
      if ("\(error)" != "Empty expression") {
        return "\(error)".replacingOccurrences(of: "/", with: "÷")
          .replacingOccurrences(of: "*", with: "x")
          .replacingOccurrences(of: "pi", with: "π")
      } else {
        return ""
      }
    }
  }
  
  static func differentFromSpecial(currentHistory: String) -> Bool {
    if (currentHistory.last != nil && currentHistory.last != "+" &&
      currentHistory.last != "-" && currentHistory.last != "x" &&
      currentHistory.last != "," && currentHistory.last != "÷" &&
      currentHistory.last != " "){
      return true
    }
    return false
  }
  
  static func saveHistory(currentHistory: String) {
    UserDefaults.standard.set(currentHistory, forKey:"history");
    UserDefaults.standard.synchronize();
  }

}
