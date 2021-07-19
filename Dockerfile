FROM gowt/base_image
ADD target/webapp.jar webapp.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "webapp.jar"]
