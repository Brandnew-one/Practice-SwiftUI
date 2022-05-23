//
//  APIService.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/05.
//

import Foundation

// TODO: Alamofire로 변경하기
// TODO: API Key가 존재하는 경우 어떻게 관리할지? -(파일, plist)
class APIService {
  static let shared = APIService()
  let baseURL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo="

  private init() { }

  // TODO: Reulst 타입 사용하기, async-await 적용시켜보기!
  func requestLottery(drwNo: String, completion: @escaping (Lottery) -> Void) {
    let url = URL(string: baseURL + drwNo)!
    URLSession.shared.dataTask(with: url) { data, response, error in
      DispatchQueue.main.async {
        guard
          let response = response as? HTTPURLResponse,
          let data = data
        else {
          print("Network Error(Response OR data)")
          return
        }

        if let lotteryData = try? JSONDecoder().decode(Lottery.self, from: data) {
          completion(lotteryData)
        } else {
          print("Decode Error")
        }
      }
    }
    .resume()
  }

  enum NetworkError: Error {
    case basic
    case decodeError
  }

  // Result Type -> Succeess, Failure
  // 2개가 둘다 enum
  func requestLotteryWithResultType(
    drwNo: String,
    completion: @escaping (Result<Lottery, NetworkError>) -> Void
  ) {
    let url = URL(string: baseURL + drwNo)!
    URLSession.shared.dataTask(with: url) { data, response, error in
      DispatchQueue.main.async {
        guard
          let response = response as? HTTPURLResponse,
          let data = data
        else {
          completion(.failure(.basic))
          return
        }
        if let lotteryData = try? JSONDecoder().decode(Lottery.self, from: data) {
          completion(.success(lotteryData))
        } else {
          completion(.failure(.decodeError))
        }
      }
    }
    .resume()
  }
}
