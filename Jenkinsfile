pipeline {
    agent { label 'dev' }

    stages {
        stage('Pull SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/ywow-ai/idn-simple-apps.git'
            }
        }
        
        stage('Build') {
            steps {
                sh'''
                cd app
                yarn install
                '''
            }
        }
        
        stage('Testing') {
            steps {
                sh'''
                cd app
                APP_PORT=5500 yarn run test
                APP_PORT=5500 yarn run run test:coverage
                '''
            }
        }
        
        stage('Code Review') {
            steps {
                sh'''
                cd app
                sonar-scanner   -Dsonar.projectKey=simple-apps   -Dsonar.sources=.   -Dsonar.host.url=http://172.23.3.112:9000   -Dsonar.token=sqp_139076d67bde0856bcb2efe26b8228bd040ff995
                '''
            }
        }
        
        stage('Deploy') {
            steps {
                sh'''
                docker compose up --build -d
                '''
            }
        }
        
        stage('Backup') {
            steps {
                 sh 'docker compose push' 
            }
        }
    }
}