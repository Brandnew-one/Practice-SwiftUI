//
//  NewlyWordView.swift
//  NewlyWord
//
//  Created by Bran on 2022/05/21.
//

import SwiftUI

// MARK: - MainView
struct NewlyWordView: View {
  @State
  var findWord: String = ""

  @State
  var wordMeaning: String = ""

  let viewModel = NewlyWordViewModel(csv: "NewlyCoinedWords")

  @ViewBuilder
  func boardView(_ wordMeaning: String) -> some View {
    Image("background") // TODO: - 가로모드 대응필요
      .resizable()
      .frame(maxWidth: .infinity)
      .aspectRatio(nil, contentMode: .fit)
      .overlay(
        Text(wordMeaning)
          .font(.title2)
          .padding()
      )
  }

  var body: some View {
    VStack(spacing: 8) {
      SearchView(
        wordMeaning: $wordMeaning,
        viewModel: viewModel
      )
        .padding(.top)

      RandomWordView(
        wordMeaning: $wordMeaning,
        viewModel: viewModel
      )

      Spacer()

      boardView(wordMeaning)

      Spacer()
    }
  }
}

struct NewlyWordView_Previews: PreviewProvider {
  static var previews: some View {
    NewlyWordView()
  }
}
