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
                sh'./gradlew test jacocoTestReport check'
            }
        }
        stage('CodeQuality') {
            steps {
                echo 'Code Quality..'
                sh'./gradlew sonarqube'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy..'
                sh'./gradlew -b deploy.gradle deploy -Pdev_server=10.28.109.116 -Pwar_name=JR_simple-web-app -Pwar_path=build/libs/ -Pkey_path=/home/jindevops.pem'
            }
        } 

        stage('Acceptance') {
            steps {
                sh './acceptance/gradlew clean test -p acceptance/'
            }	
               
    }
    post {
		always {
			junit 'build/test-results/test/*.xml'
            publishHTML (target: [
              allowMissing: false,
              alwaysLinkToLastBuild: false,
              keepAll: true,
              reportDir: 'build/reports/tests/test',
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
             ])
            publishHTML(target: [allowMissing: true, 
              alwaysLinkToLastBuild: false,  
              keepAll: true, 
              reportDir: 'build/reports/checkstyle', 
              reportFiles: 'main.html', 
              reportTitles: "Checkstyle report",
              reportName: 'CheckstyleReport'
              ])
            publishHTML(target: [allowMissing: true, 
              alwaysLinkToLastBuild: false,  
              keepAll: true, 
              reportDir: 'build/reports/findbugs', 
              reportFiles: 'main.html', 
              reportTitles: "Bugs Report",
              reportName: 'BugReport'
              ])
            publishHTML(target: [allowMissing: true, 
              alwaysLinkToLastBuild: false,  
              keepAll: true, 
              reportDir: 'build/reports/pmd', 
              reportFiles: 'main.html', 
              reportTitles: "source code analyzer",
              reportName: 'PmdReport'
              ])
            }
            publishHTML (target: [
              allowMissing: false,
			  alwaysLinkToLastBuild: false,
			  keepAll: true,
			  reportDir: 'acceptance/build/reports/cucumber-reports/cucumber-html-reports/',
			  reportFiles: 'overview-features.html',
			  reportName: "Cucumber Report"
			  ])	

        success {
			archiveArtifacts artifacts: 'build/libs/*.war', fingerprint: true
        }
    }
}
