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
    stage ('analysis'){
        if(isUnix()) {
            sh './gradlew check'
            checkstyle canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/build/reports/checkstyle/main.xml', unHealthy: ''
            pmd canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/build/reports//pmd/main.xml', unHealthy: ''
        }
        else{
            bat 'gradlew.bat check'
            checkstyle canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/build/reports/checkstyle/main.xml', unHealthy: ''
            pmd canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/build/reports//pmd/main.xml', unHealthy: ''
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
            sh 'docker build -t jarc . && docker tag jarc localhost:5000/jarc:latest && docker push localhost:5000/jarc'
        }
        else{
            bat 'docker build -t jarc . && docker tag jarc:latest localhost:5000/jarc:latest && docker push localhost:5000/jarc'
        }
    }
}
