//
//  SettingView.swift
//  DrinkWaterSwiftUI
//
//  Created by 신상원 on 2022/04/23.
//

import SwiftUI

// TODO: ViewModel이 있는데 nick, height, weight를 따로 선언할 필요가 있을까?
struct SettingView: View {
  
  let deviceWidth = UIScreen.main.bounds.width
  var viewModel: MainViewModel
  
  @State
  var nickName: String = UserDefaults.standard.string(forKey: UserDefaultKey.name) ?? "홍길동"
  @State
  var height: String = "\(UserDefaults.standard.double(forKey: UserDefaultKey.height))"
  @State
  var weight: String = "\(UserDefaults.standard.double(forKey: UserDefaultKey.weight))"
  
  init(viewModel: MainViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    ZStack {
      Color(UIColor.systemGreen)
        .ignoresSafeArea()
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
                action: { viewModel.saveButtonClicked(name: nickName, height: height, weight: weight) },
                label: { Label("저장", systemImage: "person")
                    .labelStyle(.titleOnly)
                    .foregroundColor(.white)
                }
              )
            }
          }
      }
      .background(Color(UIColor.systemGreen))
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
        Divider() // 유용
          .frame(height: 1)
          .background(Color.white)
      }
      Spacer(minLength: 30)
    }
    .foregroundColor(.white)
  }
}

//struct SettingView_Previews: PreviewProvider {
//  static var previews: some View {
//    SettingView()
//  }
//}
