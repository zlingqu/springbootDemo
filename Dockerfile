FROM docker.dm-ai.cn/devops/base-image-mvn:0.1.2 as build
WORKDIR /app
ADD . .
RUN mvn package
FROM docker.dm-ai.cn/devops/base-image-java8:server-jre-8u261
ENV TZ=Asia/Shanghai
WORKDIR /app
COPY --from=build /app/target/*.jar /app/springbootDemo.jar
EXPOSE 80
CMD ["java", "-jar","springbootDemo.jar","--spring.profiles.active=${DEPLOY_ENV}"]