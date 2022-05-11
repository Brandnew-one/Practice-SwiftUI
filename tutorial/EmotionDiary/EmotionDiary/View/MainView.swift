//
//  MainView.swift
//  EmotionDiary
//
//  Created by Bran on 2022/05/10.
//

import SwiftUI

struct MainView: View {
  @StateObject
  var viewModel = EmotionViewModel()

  @ViewBuilder
  func emotionRowView(
    index: Int
  ) -> some View {
    HStack {
      Spacer()

      EmotionView(
        emotionViewModel: viewModel,
        emtionImage: ImageSet(rawValue: index)!,
        emotionIndex: index
      )

      EmotionView(
        emotionViewModel: viewModel,
        emtionImage: ImageSet(rawValue: index + 1)!,
        emotionIndex: index + 1
      )

      EmotionView(
        emotionViewModel: viewModel,
        emtionImage: ImageSet(rawValue: index + 2)!,
        emotionIndex: index + 2
      )

      Spacer()
    }
  }

  var body: some View {
    VStack {
      emotionRowView(index: 0)

      emotionRowView(index: 3)

      emotionRowView(index: 6)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
