//
//  SearchView.swift
//  NewlyWord
//
//  Created by Bran on 2022/05/21.
//

import SwiftUI

// TODO: - 가로, 세로모드를 동시에 지원할 수 있는 뷰를 구성
// TODO: - 텍스트필드안에 버튼이미지 좀 예쁘게 넣기
struct SearchView: View {
  @Binding
  var findWord: String

  var body: some View {
    ZStack(alignment: .trailing) {

      TextField("", text: $findWord)
        .textFieldStyle(.roundedBorder)
        .multilineTextAlignment(.leading)
        .padding([.leading, .trailing])


      if findWord.isEmpty == false {
        Button(
          action: {
            findWord = "" // TODO: - ViewModel 통신
          },
          label: {
            Image(systemName: "magnifyingglass.circle.fill")
            // TODO: - 크기 조절이 생각처럼 되지 않음
          }
        )
        .padding()
      }
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView(findWord: .constant(""))
  }
}
