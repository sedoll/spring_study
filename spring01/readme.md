# 해당 코드는 spring framework 5.3.20, mybatis, mapper(sqlSession 안씀) 를 이용했다.

<br>

# mvc 패턴
> view -> controller -> service -> mapper(interface) -> mapper.xml -> db <br>
view <- controller <- service <- mapper(interface) <- mapper.xml <- db

<br> 

# 내가 기존 코드에 올린거와 변경되거나 다른 점

<br> 

## aplicationContext.xml
### db 연결
> 이유는 뭔지 모르겠는데 기존의 driverClassName, url을 사용하니까 인식이 안되는 현상이 있어서 그냥 이렇게 수정함
```
<!-- 데이터베이스 설정 -->
<!-- spring-jdbc-5.3.20.jar 안의 드라이버매니저 연결 -->
<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="org.mariadb.jdbc.Driver"/>
    <property name="url" value="jdbc:mariadb://localhost:3306/spring01"/>
    <property name="username" value="root" />
    <property name="password" value="1234" />
</bean>
```

<br> 

### mybatis config
> 에러 현상 <br> warn : org.springframework.web.context.support.xmlwebapplicationcontext - exception encountered during context initialization - cancelling refresh attempt: org.springframework.beans.factory.unsatisfieddependencyexception: error creating bean with name 'boardservice': unsatisfied dependency expressed through field 'boardmapper'; nested exception is org.springframework.beans.factory.nosuchbeandefinitionexception: no qualifying bean of type 'com.spring01.mapper.boardmapper' available: expected at least 1 bean which qualifies as autowire candidate. dependency annotations: {@org.springframework.beans.factory.annotation.autowired(required=true)}%0d%0aerror: org.springframework.web.context.contextloader - context initialization failed%0d%0aorg.springframework.beans.factory.unsatisfieddependencyexception: error creating bean with name 'boardservice': unsatisfied dependency expressed through field 'boardmapper'; nested exception is org.springframework.beans.factory.nosuchbeandefinitionexception: no qualifying bean of type 'com.spring01.mapper.boardmapper' available: expected at least 1 bean which qualifies as autowire candidate. dependency annotations: {@org.springframework.beans.factory.annotation.autowired(required=true)}%0d%0a%09

```
<!-- mapper 전체 빈 등록 -->
<mybatis-spring:scan base-package="com.spring01.mapper" />
```

[참고사이트](https://mybatis.org/spring/ko/mappers.html)