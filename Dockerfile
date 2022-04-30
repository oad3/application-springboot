FROM openjdk:11

# �A�v���P�[�V�����f�B���N�g�����쐬
WORKDIR /usr/src/myapp

# �A�v���P�[�V�����z�u
COPY ./build/libs/application-springboot-0.0.1-SNAPSHOT.jar ./application-springboot-0.0.1-SNAPSHOT.jar

# EXPOSE �ɂ��R���e�i�̃|�[�g�����J
EXPOSE 8080

# �A�v���P�[�V�����N��
CMD [ "java", "-jar", "application-springboot-0.0.1-SNAPSHOT.jar" ]
