//
//  LandmarkDetail.swift
//  SwiftUITutorial1
//
//  Created by 신상원 on 2022/04/16.
//

import SwiftUI

struct LandmarkDetail: View {
  var landmark: Landmark
  
  var body: some View {
    ScrollView {
      CustomTextView(landmark: landmark)
    }
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkDetail(landmark: landmarks[0])
  }
}
