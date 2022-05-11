//
//  ImageSet.swift
//  EmotionDiary
//
//  Created by Bran on 2022/05/11.
//

import Foundation
import SwiftUI

enum ImageSet: Int {
  case mono_slime1 = 0
  case mono_slime2 = 1
  case mono_slime3 = 2
  case mono_slime4 = 3
  case mono_slime5 = 4
  case mono_slime6 = 5
  case mono_slime7 = 6
  case mono_slime8 = 7
  case mono_slime9 = 8

  //  var emotionImage: Image {
  //    Image(self.rawValue)
  //  }
}

// MARK: Index만을 이용해서 초기화 할 수 있도록 설정
extension ImageSet {
  var emotionImage: Image {
    switch self {
    case .mono_slime1:
      return Image("mono_slime1")
    case .mono_slime2:
      return Image("mono_slime2")
    case .mono_slime3:
      return Image("mono_slime3")
    case .mono_slime4:
      return Image("mono_slime4")
    case .mono_slime5:
      return Image("mono_slime5")
    case .mono_slime6:
      return Image("mono_slime6")
    case .mono_slime7:
      return Image("mono_slime7")
    case .mono_slime8:
      return Image("mono_slime8")
    case .mono_slime9:
      return Image("mono_slime9")
    }
  }
}

