//
//  NewlyWordViewModel.swift
//  NewlyWord
//
//  Created by Bran on 2022/05/21.
//

import Foundation
import SwiftUI

// TODO: - VM이 Observable 할 필요 없을것 같음
public class NewlyWordViewModel {
  let nwManager: NewlyWordManager

  public init(csv fileName: String) {
    self.nwManager = NewlyWordManager(csv: fileName)
  }

  // TODO: - 유효하지 않은 key값에 대응 필요
  func getValue(_ key: String) -> String {
    return ""
  }

  func getRandomWord() -> String {
    return ""
  }
}
