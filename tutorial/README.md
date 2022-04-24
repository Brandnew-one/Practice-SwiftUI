`SwiftUI`를 이용해 간단한 토이 프로젝트를 만들고 과정중에 겪었던 시행착오들을 정리하고 있습니다.

## Tutorial 1


## Drink Water

| 메인화면 | 설정화면 |
| :-: | :-: |
| <img src =  https://user-images.githubusercontent.com/88618825/164960317-7b918b6f-1c33-4983-ba5b-05cbceb4cc0a.png size = "50%"> | <img src = https://user-images.githubusercontent.com/88618825/164960332-3a7e2bc9-dd3a-4aaf-b31f-8ae2d49b447d.png size = "50%"> |

### 새로 알게된것들

* `ZStack` 을 이용한 Backround 색 설정
* `.toolbar -> Toolbaritem` 을 이용한 네비게이션 아이템 설정
* `Spacer`를 이용한 레이아웃 설정
* `Divider()`를 이용한 line 

### 더 고려해야할 것들

* 키보드 대응 : SwiftUI 에서 `endEditing` 적용하기
* 다크모드 대응 : `Environment` 학습필요
* `MVVM 구조`

처음에는 나름 구조를 신경쓰면서 만들고 있었는데 역시 시간을 정하고 결과물을 뽑아내려다 보니 구조가 형편없는것 같다.

ViewModel에 로직들고 모델변수들으 넣으면서 분명 View에서느 @State 한 변수들을 줄일 수 있을 거 같은데 여전히 학습이 많이 부족하다 ㅠ

SwiftUI 의 뷰와 데이터 흐름이 아직 머리속에 둥둥 떠나니는 상태라 학습을 좀 더 해보고 구조를 빨리 수정해야겠다.
