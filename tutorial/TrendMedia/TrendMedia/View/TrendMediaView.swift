//
//  TrendMediaView.swift
//  TrendMedia
//
//  Created by Bran on 2022/05/15.
//

import SwiftUI

struct TrendMediaView: View {

  @ViewBuilder
  func titleRow() -> some View {
    let device = UIScreen.main.bounds

    VStack(alignment: .center, spacing: -20) {
      ZStack(alignment: .center) {
        Rectangle()
          .foregroundColor(.orange)
          .frame(height: device.height / 5)

        Text("Trend Media")
          .font(.system(size: 40, weight: .heavy))
          .foregroundColor(.red)
      }

      HStack(spacing: 18) {
        Spacer()

        Image(systemName: "ticket")
          .resizable()
          .foregroundColor(.green)

        Image(systemName: "tv")
          .resizable()
          .foregroundColor(.blue)

        Image(systemName: "book.closed")
          .resizable()
          .foregroundColor(.yellow)

        Spacer()
      }
      .frame(height: device.height * 0.08)
    }
  }

  var body: some View {
    NavigationView {
      titleRow()
        .navigationTitle("Trend Media")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(
              action: {
                print("Hello")
              },
              label: {
                Image(systemName: "list.bullet")
              }
            )
          }

          ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(
              destination: {
                ContentView()
              },
              label: {
                Image(systemName: "magnifyingglass")
              }
            )
          }

        }
    }
  }
}

struct TrendMediaView_Previews: PreviewProvider {
  static var previews: some View {
    TrendMediaView()
  }
}
