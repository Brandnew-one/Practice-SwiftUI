//
//  ContentView.swift
//  SwiftUITutorial1
//
//  Created by 신상원 on 2022/04/16.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Spacer()
      Text("Spacer")
        .background(.yellow)
    }
    .background(.blue)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
