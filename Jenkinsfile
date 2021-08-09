properties([parameters([choice(choices: ['test_kafka', 'test_ssh', 'test_redis'], name: 'request')])])

pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                echo 'checkout'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/WaseemSayara/robot-tests.git']]])
            }
        }
        
        stage('build_libraries') {
            steps {
                echo 'build'
                script{
                    
                try{
                bat 'rmdir libraries'
                bat 'mkdir libraries'
                }
                catch (ERROR) {
                         echo ERROR.getMessage()
                         
                     }
                }
                dir("libraries"){
                git branch: 'main', url: 'https://github.com/WaseemSayara/test-libraries.git'
                bat 'dir'
                }

            }
        }
        
         stage('build_robot') {
            steps {
                echo 'build'
                git branch: 'main', url: 'https://github.com/WaseemSayara/robot-tests.git'
                bat 'dir'

            }
        }
         stage('test') {
             steps {
                 script{
                     try{
                    withPythonEnv('python') {
                        bat 'pip install kafka-python'
                        bat 'pip install redis'
                        bat 'pip install robotframework'
                        bat 'pip install paramiko'
                        echo "hi ${params.request}"
                       
                        bat "robot ${params.request}"
                        
                    }
                     }
                     catch (ERROR) {
                         echo ERROR.getMessage()
                         
                     }
                     echo currentBuild.result
             }
             }
        }
    }
}