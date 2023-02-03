RFR: 
https://zipkin.io/pages/quickstart  
https://github.com/openzipkin/sleuth-webmvc-example  
https://cloud.spring.io/spring-cloud-sleuth/reference/html/  



```shell
mkdir ~/Desktop/zipkin && cd ~/Desktop/zipkin && curl -sSL https://zipkin.io/quickstart.sh | bash -s  && java -jar zipkin.jar

```
http://127.0.0.1:9411/zipkin/

# Setup with Spring boot + mysql

build.gradle
```shell
    // https://www.baeldung.com/tracing-services-with-zipkin
    compile group: 'org.springframework.cloud', name: 'spring-cloud-starter-zipkin', version: '2.1.2.RELEASE'
    compile group: 'io.opentracing.brave', name: 'brave-opentracing', version: '0.34.2'
    // https://mvnrepository.com/artifact/io.zipkin.brave/brave-instrumentation-mysql8
    compile group: 'io.zipkin.brave', name: 'brave-instrumentation-mysql8', version: '5.6.10'
 ```
 
 application.properties
 
 ```shell
 #NOTE: By default spring.sleuth.sampler.probability=0.1
# which means only 10% of tracing information will be exported to Zipkin.
# Make it to your desired percentage.
spring.sleuth.sampler.probability=1
spring.zipkin.base-url=http://localhost:9411/

#update datasource url as below
#https://github.com/openzipkin/brave/tree/master/instrumentation/mysql8
spring.datasource.url=jdbc:mysql://localhost:3306/test?queryInterceptors=brave.mysql8.TracingQueryInterceptor&exceptionInterceptors=brave.mysql8.TracingExceptionInterceptor&zipkinServiceName=myDatabaseService

```

![image](https://github.com/dineshbhagat/mac-configurations/blob/8697478fe3a5cfaa6fed09164ac2f1d61939415c/apm/images/Screenshot%202019-08-21%20at%206.20.32%20PM.png)
