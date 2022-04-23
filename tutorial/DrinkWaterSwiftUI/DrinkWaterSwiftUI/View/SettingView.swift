//
//  SettingView.swift
//  DrinkWaterSwiftUI
//
//  Created by 신상원 on 2022/04/23.
//

import SwiftUI

struct SettingView: View {
  
  let deviceWidth = UIScreen.main.bounds.width
  
  @State
  var nickName: String = "닉네임"
  @State
  var height: String = "172"
  @State
  var weight: String = "65"
  
  var body: some View {
    VStack(spacing: 18) {
      Spacer()
      Image("1-1")
        .resizable()
        .frame(width: deviceWidth * 0.3, height: deviceWidth * 0.3)
      makeTextView(title: "닉네임을 설정해주세요", text: $nickName)
      makeTextView(title: "키(cm)를 설정해주세요", text: $height)
      makeTextView(title: "몸무게(kg)를 설정해주세요", text: $weight)
      Spacer(minLength: 300)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(
            action: { print("save") },
            label: { Label("저장", systemImage: "person")
                .labelStyle(.titleOnly)
                .foregroundColor(.white)
            }
          )
        }
      }
    }
  }
  
  @ViewBuilder
  func makeTextView(title: String, text: Binding<String>) -> some View {
    HStack {
      Spacer(minLength: 30)
      VStack(alignment: .leading, spacing: 3) {
        Text(title)
          .font(.footnote)
        TextField("\(text.wrappedValue)", text: text)
        Divider()
          .frame(height: 1)
          .background(Color.green)
      }
      Spacer(minLength: 30)
    }
  }
}

struct SettingView_Previews: PreviewProvider {
  static var previews: some View {
    SettingView()
  }
}
