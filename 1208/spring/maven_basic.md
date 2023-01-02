# Maven이란?

- 앱을 개발하기 위해 반복적으로 진행했던 작업들을 지원하기 위해 등장한 도구
- 빌드, 패키징, 문서화, 테스트와 테스트 리포팅, git, 의존성 관리, svn과 같은 형상 관리 서버와 연동 / 배포 등의 작업을 손쉽게 할 수 있음.
- CoC : 일종의 관습(Convention)
- 장점
    - 편리한 의존성 라이브러리 관리
        - Maven에 설정한 대로 모든 개발자가 일관된 방식으로 빌드를 수행할 수 있음
        - 다양한 플러그인을 제공해줘서 많은 일들을 자동화 시킬 수 있음

### Maven 기본 형태

---

Archetype을 이용하여 Maven 기반 프로젝트를 생성할 경우

생성된 프로젝트 하위에 pom.xml 파일이 생성됨

- POM이란?

  **P**roject **O**bject **M**odel**의 약자로,**

  **프로젝트의 중요한 정보를 정의하고 정리하기 위한 곳**


---

`예제`

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>kr.or.connect</groupId>
    <artifactId>examples</artifactId>
    <packaging>jar</packaging>
    <version>1.0-SNAPSHOT</version>
    <name>mysample</name>
```

- project
    - 최상위 루트 엘리먼트(Root Element)
- model Version
    - POM model의 버전
- groupid
    - 프로젝트를 생성하는 조직의 고유 아이디를 결정
        - 일반적으로 도메인 모델을 거꾸로 적음
- artifactid
    - 해당 프로젝트에 의하여 생성되는 artifact의 고유 아이디를 결정, Maven을 이용하여 pom.xml을 빌드할 경우 다음과 같은 규칙으로 artifact가 생성됨
- packaging
    - 해당 프로젝트를 어떤 형태로 packaging할 것인지 결정
- version
    - 프로젝트의 현재 버전, 프로젝트가 개발 중일 때는 SNAPSHOT을 접미사로 사용함
- name
    - 프로젝트의 이름
- url
    - 프로젝트의 사이트가 있다면 사이트 URL을 등록하는 것이 가능