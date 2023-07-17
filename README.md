# Pumping

<img src="https://github.com/depromeet/Pumping-iOS/assets/77970826/e79cdec1-b673-42a9-bb9a-5a9f46565b54">

<img src="https://github.com/depromeet/Pumping-iOS/assets/77970826/958cd820-8610-4104-b0fc-79777e9baff8">

<img src="https://github.com/depromeet/Pumping-iOS/assets/77970826/adaa63d2-17fb-4e17-bd7c-0db60fbdca8e">

<img src="https://github.com/depromeet/Pumping-iOS/assets/77970826/666891a5-f48d-4a7a-9d10-541412b5ab0f">

<img src="https://github.com/depromeet/Pumping-iOS/assets/77970826/bae86b0f-86e6-4684-8fd2-f1d62adbc0af">

<br>

<p align="center">
<a href="https://testflight.apple.com/join/XRtozfBk" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en-us?size=250x83&amp;releaseDate=1641254400&h=ddfff0c3bd61d9f88f53494b401881d3" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;"></a>
</p>

# Micro Feature Architecture
대규모 서비스를 위한 마이크로 Feature Architecture를 구성하였습니다. 

시행착오가 많을 예정이어서 블로그에 따로 정리하려고 합니다.

[🚀 블로그](https://medium.com/@mooyoung2309/tuist%EB%A1%9C-micro-architecture-%EC%A0%81%EC%9A%A9%ED%95%98%EA%B8%B0-aa0ca97a4f4d) 도 놀러오세요 !

## 4 Layer
계층 구조는 다음과 같습니다.
- Feature: 기능
- Domain: 모델
- Core: 템플릿
- Shared: 공용 모듈

## Target Type
타겟 타입은 다음과 같습니다.
- Example: 샘플 앱
- Implement: 구현부
- Tests: 테스트
- Testing: 테스트를 위한 목업
- Interface: 인터페이스

## Dependencies Graph
디펜던시 그래프는 다음과 같습니다.

<img src="graph.png">