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
                    sh 'docker build -t vkulkarni0303/spring .'
                }
            }
    }
      stage("push image to hub") {
        steps {
          scripts{
            withCredentials([string(credentialsId: 'vkulkarni0303', variable: 'dockerhubpwd')]) {
              sh "docker login -u vkulkarni0303 -p ${dockerhubpwd}"

              sh "docker push vkulkarni0303/spring"
            }
          }
        }
}
            
}
}
