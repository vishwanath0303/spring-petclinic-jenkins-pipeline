pipeline {
  agent any 
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/vishwanath0303/spring-petclinic-jenkins-pipeline.git'
      }
    }
   // stage('Compile') {
      // steps {
      // bat 'mvn compile' //only compilation of the code
     //  }
   // }
    stage('mvn build') {
      steps {
        sh '''
        mvn clean install
        ls
        pwd
        ''' 
        //if the code is compiled, we test and package it in its distributable format; run IT and store in local repository
      }
    }
           stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t spring:$BUILD_NUMBER .'
                }
            }
    }
         stage ("Stop and remove") {
           steps {
             script{
               sh 'docker ps -a -q'
               sh 'docker stop spring '
               sh 'docker rm spring '
             }
           }
        }
        stage('Start image'){
            steps{
                script{
                    sh 'docker run -d -p 8181:8181 --name spring spring:$BUILD_NUMBER '
                }
            }
    }
    stage('Status'){
            steps{
                script{
                    sh 'docker ps '
                }
            }
    }
    // stage (" email notification") {
    //  steps{
      // mail bcc: '', body: 'Hello', cc: '', from: '', replyTo: '', subject: 'Hi this pipeline is successfull', to: 'test.jenkins.nisum@gmail.com'
//  }
// }
}
 post {
  always{
    mail bcc: '', body: """'Docker: ${env.JOB_NAME}  <br> build number: {$env.BUILD_NUMBER} <br/> URL: ${env.BUILD_URL}'""", cc: '', from: '', replyTo: '', subject: "'${currentBuild.result}'", to: 'test.jenkins.nisum@gmail.com'
}
}
}
