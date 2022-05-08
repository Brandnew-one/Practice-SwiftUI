//
//  NextPageView.swift
//  PopupView
//
//  Created by Bran on 2022/05/08.
//

import SwiftUI

struct NextPageView: View {
  @ObservedObject
  var viewModel: PopupViewModel

  var body: some View {
    VStack {
      Text("This is NextPage")
        .font(.title2)
      
      Button(
        action: {
          viewModel.isHidden = false
        },
        label: {
          Text("show Popup")
            .font(.title2)
        }
      )
    }
  }
}

struct NextPageView_Previews: PreviewProvider {
  static var previews: some View {
    NextPageView(viewModel: PopupViewModel())
  }
}
