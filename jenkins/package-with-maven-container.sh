echo 'Packaging on Petclinic Application'
docker run --rm -v $HOME/.m2:/root/.m2 -v $WORKSPACE:/app -w /app maven:3.9-eclipse-temurin-17 mvn clean package