//
//  ContentView.swift
//  NewlyWord
//
//  Created by Bran on 2022/05/21.
//

import SwiftUI

struct ContentView: View {
  var data = NewlyWordManager(csv: "NewlyCoinedWords")

  var body: some View {
    Text(data.newlyWordDic["삼귀다"] ?? "")
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
