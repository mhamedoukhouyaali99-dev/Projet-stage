pipeline {
    agent any
    stages {
        stage('1. Install Dependances') {
            steps {
                echo 'Installation des librairies'
                bat 'python -m pip install -r requirements.txt'
            }
        }
        stage('2. Lancer Tous Les Tests') {
            steps {
                echo 'Execution de run_all_tests.bat'
                bat 'call run_all_tests.bat'
            }
        }
        
    }
    post {
        always { 
            echo 'Publication du rapport'
            publishHTML(target: [
                reportDir: 'results/api',
                reportFiles: 'report.html',
                reportName: 'Rapport API QA',
                alwaysLinkToLastBuild:true,
                keepAll:true,
                allowMissing:true
            ])
            publishHTML(target: [
                reportDir: 'results/ihm',
                reportFiles: 'report.html',
                reportName: 'Rapport IHM QA',
                alwaysLinkToLastBuild:true,
                keepAll:true,
                allowMissing:true
            ])
        }
        success { echo 'BUILD REUSSI ok'}
        failure {echo 'BUILD ECHOUE ko'}
    }

    
}