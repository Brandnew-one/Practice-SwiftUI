//
//  RGBGameApp.swift
//  RGBGame
//
//  Created by Bran on 2022/05/02.
//

import SwiftUI

// @main: Entry Point
// App Protocol
@main
struct RGBGameApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(
        guess: RGB()
      )
    }
  }
}
