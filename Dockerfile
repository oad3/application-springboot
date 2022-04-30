FROM openjdk:11

# アプリケーションディレクトリを作成
WORKDIR /usr/src/myapp

# アプリケーション配置
COPY ./build/libs/application-springboot-0.0.1-SNAPSHOT.jar ./application-springboot-0.0.1-SNAPSHOT.jar

# EXPOSE によりコンテナのポートを公開
EXPOSE 8080

# アプリケーション起動
CMD [ "java", "-jar", "application-springboot-0.0.1-SNAPSHOT.jar" ]
