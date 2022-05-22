//
//  RandomWordView.swift
//  NewlyWord
//
//  Created by Bran on 2022/05/21.
//

import SwiftUI

struct RandomWordView: View {

  @Binding
  var wordMeaning: String

  let viewModel: NewlyWordViewModel

  @ViewBuilder
  func wordView(_ word: String) -> some View {
    Button(
      action: {
        wordMeaning = viewModel.getValue(word)
      },
      label: {
        Text(word)
          .padding([.top, .leading, .trailing, .bottom], 8)
          .foregroundColor(.black)
          .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(Color.black, lineWidth: 3)
          )
      }
    )
  }

  var body: some View {
    HStack(alignment: .center, spacing: 8) {
      wordView(viewModel.getRandomWord())
      wordView(viewModel.getRandomWord())
      wordView(viewModel.getRandomWord())
      wordView(viewModel.getRandomWord())

      Spacer()
    }
    .padding(.leading)
  }
}

struct RandomWordView_Previews: PreviewProvider {
  static var previews: some View {
    RandomWordView(
      wordMeaning: .constant(""),
      viewModel: NewlyWordViewModel(csv: "NewlyCoinedWords")
    )
  }
}
