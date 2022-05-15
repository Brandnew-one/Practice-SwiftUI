//
//  EmotionViewModel.swift
//  EmotionDiary
//
//  Created by Bran on 2022/05/10.
//

import Foundation
import SwiftUI

class EmotionViewModel: ObservableObject {
  let emotionString: [String] = [
    "행복해", "퇴근해", "좋아해",
    "당황해", "속상해", "우울해",
    "심심해", "불행해", "출근해"
  ]

  let userDefaultsKey: [String] = [
    "zero", "one", "two",
    "three", "four", "five",
    "six", "seven", "eight"
  ]

  @Published
  var emotionNumbers = [Int](repeating: 0, count: 9)

  @Published
  var isHidden: Bool = true

  init() {
    loadEmotionNumbers()
  }

// https://developer.apple.com/documentation/foundation/userdefaults#//apple_ref/occ/instm/NSUserDefaults/integerForKey
  func loadEmotionNumbers() {
    for i in 0...8 {
      if UserDefaults.standard.integer(forKey: userDefaultsKey[i]) == 0 {
        UserDefaults.standard.set(0, forKey: userDefaultsKey[i])
        emotionNumbers[i] = 0
      } else {
        emotionNumbers[i] = UserDefaults.standard.integer(forKey: userDefaultsKey[i])
      }
    }
  }

  func updateEmotionNumber(index: Int) {
    let currentVal = UserDefaults.standard.integer(forKey: userDefaultsKey[index])
    UserDefaults.standard.set(currentVal + 1, forKey: userDefaultsKey[index])
    emotionNumbers[index] = currentVal + 1
  }

  func resetEmotionNumbers() {
    for i in 0...8 {
      UserDefaults.standard.set(0, forKey: userDefaultsKey[i])
    }
    loadEmotionNumbers()
  }

  func showPopupView() {
    self.isHidden = false
  }

  func dismissPopupView() {
    self.isHidden = true
  }

}
