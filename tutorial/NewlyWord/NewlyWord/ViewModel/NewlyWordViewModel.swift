//
//  NewlyWordViewModel.swift
//  NewlyWord
//
//  Created by Bran on 2022/05/21.
//

import Foundation
import SwiftUI

public class NewlyWordViewModel {
  let nwManager: NewlyWordManager

  public init(csv fileName: String) {
    self.nwManager = NewlyWordManager(csv: fileName)
  }

  func getValue(_ key: String) -> String {
    guard
      let meaning = nwManager.newlyWordDic[key] else {
      return "아재요.. 그런말은 없습니다."
    }
    return meaning
  }

  // TODO: - 스펙상 4개의 단어가 달라야 함
  func getRandomWord() -> String {
    guard
      let randomWord = nwManager.newlyWordDic.randomElement()?.key
    else {
      return ""
    }
    return randomWord
  }
}
