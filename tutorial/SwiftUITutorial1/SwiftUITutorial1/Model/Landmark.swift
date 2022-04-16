//
//  Landmark.swift
//  SwiftUITutorial1
//
//  Created by 신상원 on 2022/04/16.
//

import CoreLocation
import Foundation
import SwiftUI

// 각 프로토콜 분석!
struct Landmark: Hashable, Codable, Identifiable {
  var id: Int
  var name: String
  var park: String
  var state: String
  var description: String
  
  private var imageName: String
  var image: Image {
    Image(imageName)
  }
  
  private var coordinates: Coordinates
  var locationCoordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude)
  }
  
  struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
  }
}
