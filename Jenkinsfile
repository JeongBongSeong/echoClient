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
            sh 'docker build -t jarc .'//&& /*sudo */docker tag jarc qhdtjd0104/jarc:latest && /*sudo */docker push qhdtjd0104/jarc'
        }
        else{
            bat 'docker build -t jarc . && docker tag jarc localhost:5000/jarc:latest && docker push localhost:5000/jarc'
        }
    }
}
