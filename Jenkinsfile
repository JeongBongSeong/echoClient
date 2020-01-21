node {
    stage ('clone') {
        checkout scm
    }
    stage ('gradlew build') {
        if(isUnix()) {
            sh '/*sudo */./gradlew clean build'
        }
        else{
            bat 'gradlew.bat clean build'
        }
    }
    stage ('Packaging'){
        if(isUnix()) {
            sh '/*sudo */./gradlew clean bootjar'
        }
        else{
            bat 'gradlew.bat clean bootjar'
        }
    }
    stage ('Docker Build'){
        if(isUnix()) {
            sh '/*sudo */docker build -t jarc .'//&& /*sudo */docker tag jarc qhdtjd0104/jarc:latest && /*sudo */docker push qhdtjd0104/jarc'
        }
        else{
            bat 'docker build -t jarc .'// &&/*//젠킨스에서는 쓸 수 없는 명령어 docker login*/ && docker tag jarc qhdtjd0104/jarc:latest && docker push qhdtjd0104/jarc'
        }
    }
}
