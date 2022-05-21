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
  var wordMeaning: String = "테스트"

  let viewModel = NewlyWordViewModel(csv: "NewlyCoinedWords")

  @ViewBuilder
  func boardView(_ wordMeaning: String) -> some View {
    ZStack(alignment: .center) {
      Image("background") // TODO: - 가로모드 대응필요
        .resizable()
        .scaledToFit()

      Text(wordMeaning)
        .font(.title2)
    }
  }

  var body: some View {
    VStack(spacing: 8) {
      SearchView(findWord: $findWord)
        .padding(.top)

      RandomWordView(viewModel: viewModel)

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
