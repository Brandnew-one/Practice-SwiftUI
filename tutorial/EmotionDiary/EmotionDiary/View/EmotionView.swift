//
//  EmotionView.swift
//  EmotionDiary
//
//  Created by Bran on 2022/05/11.
//

import SwiftUI

struct EmotionView: View {
  @ObservedObject
  var emotionViewModel: EmotionViewModel

  var emtionImage: ImageSet
  var emotionIndex: Int

  var body: some View {
    VStack {
      emtionImage.emotionImage
        .resizable()
        .frame(width: 100, height: 100)
        .makeBounceButton {
          emotionViewModel.updateEmotionNumber(index: emotionIndex)
        }

      HStack(alignment: .center, spacing: 1) {
        Text(emotionViewModel.emotionString[emotionIndex])

        Text("\(emotionViewModel.emotionNumbers[emotionIndex])")
      }
    }
  }
}

struct EmotionView_Previews: PreviewProvider {
  static var previews: some View {
    EmotionView(
      emotionViewModel: EmotionViewModel(),
      emtionImage: .mono_slime1,
      emotionIndex: 0
    )
  }
}
