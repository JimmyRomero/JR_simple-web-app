pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh'./gradlew clean assemble'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh'./gradlew test jacocoTestReport'
            }
        }
        stage('CodeQuality') {
            steps {
                echo 'Code Quality..'
                sh'./gradlew sonarqube'
            }
        } 
               
    }
    post {
		always {
			junit '/build/test-results/test/*.xml'
            publishHTML (target: [
              allowMissing: false,
              alwaysLinkToLastBuild: false,
              keepAll: true,
              reportDir: '/build/reports/tests/test',
              reportFiles: 'index.html',
              reportName: "Junit Reports"
              ])
            publishHTML (target: [
             allowMissing: false,
             alwaysLinkToLastBuild: false,
             keepAll: true,
             reportDir: 'build/reports/jacoco',
             reportFiles: 'index.html',
             reportName: "Code Coverage Jacoco"
            }

        success {
			archiveArtifacts artifacts: 'build/libs/*.war', fingerprint: true
        }
    }
}
