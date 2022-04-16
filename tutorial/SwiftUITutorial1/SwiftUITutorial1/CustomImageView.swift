//
//  CustomImageView.swift
//  SwiftUITutorial1
//
//  Created by 신상원 on 2022/04/16.
//

import SwiftUI

struct CustomImageView: View {
  var body: some View {
    Image("sini")
      .resizable() // frame 이후에 선언하면 오류가 발생
      .scaledToFit()
    //      .frame(width: 200, height: 200, alignment: .center)
      .clipShape(Circle())
      .overlay {
        Circle().stroke(.blue, lineWidth: 4)
      }
      .shadow(radius: 7)
  }
}

struct CustomImageView_Previews: PreviewProvider {
  static var previews: some View {
    CustomImageView()
  }
}
