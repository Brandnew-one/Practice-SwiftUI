//
//  ColorExtension.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/05.
//

import Foundation
import SwiftUI

// TODO: Lazy Property로 만드는게 더 효율적일지 생각해보기
extension Color {
  static var random: Color {
    Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
    )
  }
}

struct Theme {

  static func myTextColor(scheme: ColorScheme) -> Color {
    let lightColor = Color.black
    let darkColor = Color.white

    switch scheme {
    case .light:
      return lightColor
    case .dark:
      return darkColor
    @unknown default:
      return lightColor
    }
  }
}
