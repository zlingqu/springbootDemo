FROM docker.dm-ai.cn/devops/base-image-mvn:0.1.2 as build
WORKDIR /app
ADD . .
RUN package -Dmaven.test.skip=true -P ${deployEnv}
FROM docker.dm-ai.cn/devops/base-image-java8:server-jre-8u261
ENV TZ=Asia/Shanghai
WORKDIR /app
COPY --from=/app/target/build /app/deploy /app
EXPOSE 80
CMD ["sh", "./start.sh"]