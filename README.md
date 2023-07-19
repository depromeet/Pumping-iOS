# Pumping

<img src="https://github.com/depromeet/Pumping-iOS/assets/77970826/e79cdec1-b673-42a9-bb9a-5a9f46565b54">

<img src="https://github.com/depromeet/Pumping-iOS/assets/77970826/958cd820-8610-4104-b0fc-79777e9baff8">

<img src="https://github.com/depromeet/Pumping-iOS/assets/77970826/adaa63d2-17fb-4e17-bd7c-0db60fbdca8e">

<img src="https://github.com/depromeet/Pumping-iOS/assets/77970826/666891a5-f48d-4a7a-9d10-541412b5ab0f">

<img src="https://github.com/depromeet/Pumping-iOS/assets/77970826/bae86b0f-86e6-4684-8fd2-f1d62adbc0af">

<br>

<p align="center">
<a href="https://apps.apple.com/app/id6451131066" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en-us?size=250x83&amp;releaseDate=1641254400&h=ddfff0c3bd61d9f88f53494b401881d3" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;"></a>
</p>




# Micro Feature Architecture

>Micro Feature Architecture은 백엔드의 Micro Service([Martinfowler 공식문서](https://martinfowler.com/articles/microservices.html))의 개념으로부터 유래되었습니다. [Tuist 공식문서](https://docs.tuist.io/building-at-scale/microfeatures/)에서 개괄적인 개념을 확인할 수 있습니다.

## 개요

"어라 그거 백엔드 개념 아니야 ?"  
"겨우 사이드에서 그딴게 왜 필요해 ?"

저희 팀은 대규모 서비스를 위한 Micro Feature Architecture을 구성하였습니다. 굳이 할 필요 없는 작업이라고 생각이 들 수 있습니다. 당시에 참고할 만한 샘플이 존재하지 않았고 저희는 샘플앱이 되고자 했고, 노력의 과정을 기록하고자 합니다. 앞으로 리펙토링을 할지 말지는 결정된 사항이 없습니다. 누군가 이 샘플을 통해서 계속해서 발전시켜 나갔으면 합니다. 

이상입니다 -

[Tuist로 Micro Architecture 적용하기](https://medium.com/@mooyoung2309/tuist%EB%A1%9C-micro-architecture-%EC%A0%81%EC%9A%A9%ED%95%98%EA%B8%B0-aa0ca97a4f4d) 저희가 작성한 블로그에서 자세한 내용을 모두 확인할 수 있습니다.

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