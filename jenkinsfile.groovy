node {
    stage ('clone') {
        checkout scm
    }
    stage ('gradlew build') {
        if(isUnix()) {
            sh './gradlew build'
        }
        else{
            bat 'gradlew.bat build'
        }
    }
}
