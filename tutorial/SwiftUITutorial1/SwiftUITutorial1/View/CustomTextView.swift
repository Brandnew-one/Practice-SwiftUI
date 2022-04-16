//
//  CustomTextView.swift
//  SwiftUITutorial1
//
//  Created by 신상원 on 2022/04/13.
//

import SwiftUI

struct CustomTextView: View {
  var landmark: Landmark
  
  var body: some View {
    // SwiftUI Inspector 를 통해서 변경할 수 있음 -> StoryBoard에서 Inspector 랑 유사
    // Modifiers 를 통해서 View 를 커스터마이즈 할 수도 있음
    VStack {
      MapView(coordinate: landmark.locationCoordinate)
        .ignoresSafeArea(edges: .top)
        .frame(height: 300) //alignment 는 center가 기본값
      
      CustomImageView(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack(alignment: .leading) {
        Text(landmark.name)
          .font(.title)
          .foregroundColor(.green)
        
        HStack {
          Text(landmark.park)
            .font(.subheadline)
          Spacer()
          Text(landmark.state)
            .font(.subheadline)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        
        Divider()
        Text("About \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
      }
      .padding() // default 값이 상,하,좌,우
      Spacer()
    }
  }
}

struct CustomTextView_Previews: PreviewProvider {
  static var previews: some View {
    CustomTextView(landmark: landmarks[0])
  }
}
