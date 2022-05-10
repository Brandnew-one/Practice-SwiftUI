//
//  EmotionRowView.swift
//  EmotionDiary
//
//  Created by Bran on 2022/05/10.
//

import SwiftUI

struct EmotionRowView: View {

  @ViewBuilder
  func emtionView(
    emtionImage: Image,
    emtionTitle: String
  ) -> some View {
    VStack {
      emtionImage
        .resizable()
        .frame(width: 100, height: 100)
        .makeBounceButton {
          print("Hello")
        }

      HStack(alignment: .center, spacing: 1) {
        Text(emtionTitle)

        Text("1")
      }
    }
  }

  var body: some View {
    HStack {
      Spacer()
      emtionView(emtionImage: Image("mono_slime1"), emtionTitle: "행복해")
      emtionView(emtionImage: Image("mono_slime1"), emtionTitle: "행복해")
      emtionView(emtionImage: Image("mono_slime1"), emtionTitle: "행복해")
      Spacer()
    }
  }
}

struct EmotionView_Previews: PreviewProvider {
  static var previews: some View {
    EmotionRowView()
  }
}
