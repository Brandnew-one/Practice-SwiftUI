//
//  BounceButton.swift
//  EmotionDiary
//
//  Created by Bran on 2022/05/10.
//

import SwiftUI

// MARK: Custom ButtonStyle
private struct BounceButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .scaleEffect(configuration.isPressed ? 1.2 : 1)
      .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: configuration.isPressed)
  }
}

// MARK: 버튼래핑을 위한 Modifier
private struct BounceButtonViewModifier: ViewModifier {
  let action: () -> Void

  init(action: @escaping () -> Void) {
    self.action = action
  }

  func body(content: Content) -> some View {
    Button(
      action: action,
      label: { content }
    )
    .buttonStyle(BounceButtonStyle())
  }
}

extension View {
  func makeBounceButton(action: @escaping () -> Void) -> some View {
    modifier(BounceButtonViewModifier(action: action))
  }
}
