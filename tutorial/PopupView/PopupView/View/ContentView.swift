//
//  ContentView.swift
//  PopupView
//
//  Created by Bran on 2022/05/08.
//

import SwiftUI

// MARK: 네비게이션 다음 화면에서 팝업을 보여주고 싶은 경우
struct ContentView: View {
  @StateObject
  var viewModel = PopupViewModel()

  var body: some View {
    ZStack {
      NavigationView {
        NavigationLink(
          destination: { NextPageView(viewModel: viewModel) },
          label: {
            Text("Go To NextPage")
              .font(.title2)
          }
        )
      }

      PopupView(viewModel: viewModel)
        .ignoresSafeArea()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
