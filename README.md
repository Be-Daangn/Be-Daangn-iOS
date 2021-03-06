# Be-Daangn-iOS
🥕 ﹤ 🍎 당근마켓 최강 아요 ~~~~

<br />

- **클디 합동세미나 : 당근마켓 리디자인 + Client_iOS**

- **진행 기간(5차 세미나) : 2021.05.15 ~ 2021.05.21**

<br><br>

## 📺 최종 구현 화면 (끝났다아아아아)


### 🍎 박익범 (홈 뷰)
- 🙋🏻‍♂️ 제자신의 부족함을 한번더 느끼고, 발전하는 기회가 되었습니다. 훌륭한 개발자가 되기위해 항상 노력하겠습니다. 같이 고생한 iOS파트원분들, 디자이너분들, 안드분들 모두 수고하셨습니다~!!~!

	<img width="250" alt="home" src="https://user-images.githubusercontent.com/61109660/118929335-58660c00-b97f-11eb-9f34-8a7dc0b482c7.gif">

### 🍎 김혜수 (소식 뷰)

- 🙋🏻‍♂️ 더 발전하는 기회가 된 것 같습니다!

	<img width="250" alt="news" src="https://user-images.githubusercontent.com/61109660/118929375-6582fb00-b97f-11eb-94dd-bbd629d35b7a.gif">

### 🍎 김태현 (추천 가게 뷰, 저장됨 뷰)

- 🙋🏻‍♂️ 짱짱맨들~~

	<img width="250" alt="recommend" src="https://user-images.githubusercontent.com/61109660/118929416-73388080-b97f-11eb-8d27-32a1e987e7b9.gif">
	<img width="250" alt="saved" src="https://user-images.githubusercontent.com/61109660/118929436-792e6180-b97f-11eb-8a09-0c2bfba31e41.gif">



## ⚙️ 개발 환경

- iOS 13.0+

- Xcode 12.5 (3명 통일 하기로..!🙋🏻‍♂️)

<br><br>

## 📄 라이브러리

| 라이브러리(Library) | 목적(Purpose)    | 버전(Version) |
| :------------------ | :--------------- | ------------- |
| Alamofire           | 서버 통신(6차 세미나)   | 5.2           |

<br><br>

## 🗂 폴더링

```markdown
🥕 Be-Daangn-iOS 프로젝트 구조


🗂 Configuration/

  - Constants.swift : API Constants 저장, 싱글턴으로 변수 생성

  - Base/ 🗂 : 뷰 컨트롤러에서 공통되는 부분 분리 (클래스 상속해서 사용)
			
    - BaseViewController.swift (ex. class HomeViewController: BaseViewController {} )

  - Extension/ 🗂 : Extension을 통해 기능 확장한 파일 저장

    - UIColor+.swift
    - UIButton+.swift
    - UIView+MakeAlert.swift
    - ...

  - Secret/ 🗂 : git에 올라가면 안되는 파일 저장 (ex. token)

  - CommonClass/ 🗂 : 커스텀 클래스, 스트럭트 저장
			
    - Device.swift : ex) 디바이스 크기, 여백 정보 담은 struct

🗂 Sources/
	
  - Home/ 🗂  : 뷰 단위로 폴더링                       
		
    - HomeStoryboard.storyboard : 스토리보드

    - HomeViewController.swift : 뷰 컨트롤러 (스토리보드와 1대1 매칭)

    - Cell/ 🗂 : 셀 관련 파일 저장 like CollectionView Cells, TableView Cells 
      
      - (ex. ~CVC.swift, ~TVC.swift, ~CVC.xib, ~TVC.xib)
			
    - Service/ 🗂  : 네트워크 파일 저장 (ex. ~DataService.swift)

    - Model/ 🗂 : 데이터 모델 저장 (ex. ~DataModel.swift)
		
  - Recommend/ 🗂
		
  - News/ 🗂
		
  - ...

- AppDelegate.swift

- SceneDelegate.swift

- Assets.xcassets

- LaunchScreen.storyboard

- Info.plist
```

<br> <br>

## 커밋 컨벤션

**[Commit Type] 추가한 기능 설명**

- 기능 하나 구현하고 커밋하기
- 커밋메시지에 구현 중 절대❌❌❌❌❌❌❌❌❌❌❌

### Commit Type

- feat - 기능추가시
- fix - 버그 수정
- docs - 문서 수정
- style - 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
- refactor -  코드 리팩토링 (이해하기 쉬운 구조로 변경하며 기능의 변경은 없다.)
- test - 테스트 코드, 리팩토링 테스트 코드 추가
- chore - 빌드 업무 수정, 패키지 매니저 수정

### 추가 기능 설명

- 한글로쓰기
