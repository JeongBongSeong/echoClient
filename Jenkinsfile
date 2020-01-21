node {
    stage ('clone') {
        checkout scm
    }
    stage ('gradlew build') {
        if(isUnix()) {
            sh './gradlew clean build'
        }
        else{
            bat 'gradlew.bat clean build'
        }
    }
    stage ('Packaging'){
        if(isUnix()) {
            sh './gradlew clean bootjar'
        }
        else{
            bat 'gradlew.bat clean bootjar'
        }
    }
    stage ('Docker Build'){
        if(isUnix()) {
            sh '/*sudo */docker build -t echoClient .'
        }
        else{
            bat 'docker build -t jarc .'
        }
    }
    stage ('Docker push'){
        sh 'docker push qhdtjd0104/jarc:0.1'
    }
}
