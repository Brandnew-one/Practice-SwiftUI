//
//  RandomWordView.swift
//  NewlyWord
//
//  Created by Bran on 2022/05/21.
//

import SwiftUI

struct RandomWordView: View {
  let viewModel: NewlyWordViewModel

  @ViewBuilder
  func wordView() -> some View {
    Button(
      action: {
        print("") // VM 통신 -> 외부로 값
      },
      label: {
        Text("ㅠㅠ") // VM 통신
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
      wordView()
      wordView()
      wordView()
      wordView()

      Spacer()
    }
    .padding(.leading)
  }
}

struct RandomWordView_Previews: PreviewProvider {
  static var previews: some View {
    RandomWordView(viewModel: NewlyWordViewModel(csv: "NewlyCoinedWords"))
  }
}
