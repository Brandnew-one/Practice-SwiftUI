//
//  PickerView.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/08.
//

import SwiftUI

struct PickerView: View {

  @ObservedObject
  var viewModel: LotteryViewModel

  @Binding
  var pickedValue: String

  var drwNumbers = Array(
    (1...1003).map{"\($0)"} // FIXME: 최신회차도 반영할 수 있도록 수정하기!
  )

  var body: some View {
    Picker("", selection: $pickedValue) {
      ForEach(drwNumbers, id: \.self) { num in
        Text(num)
      }
    }
    .pickerStyle(.wheel)
  }
}

struct PickerView_Previews: PreviewProvider {
  static var previews: some View {
    PickerView(
      viewModel: LotteryViewModel(),
      pickedValue: .constant("")
    )
  }
}
