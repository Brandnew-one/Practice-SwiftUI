//
//  drwNoView.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/05.
//

import SwiftUI

struct drwNoView: View {

  @ObservedObject
  var viewModel: LotteryViewModel

  @ViewBuilder
  func textFieldLabel(str: Binding<String>) -> some View {
    TextField(
      "회차를 입력하세요",
      text: str
    )
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 10)
      .stroke(
        Color.black,
        lineWidth: 1
      )
    )
  }

  var body: some View {
    HStack(spacing: 8) {
      textFieldLabel(str: $viewModel.drwNo)

      Button(
        action: {
          print("ViewModel Function Call")
        }) {
          VStack {
            Image(systemName: "heart.fill")
            Text("확인")
          }
          .foregroundColor(.black)
          .padding()
        }
    }
  }
}

struct drwNoView_Previews: PreviewProvider {
  static var previews: some View {
    drwNoView(viewModel: LotteryViewModel())
  }
}
