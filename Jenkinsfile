pipeline {
    agent any
     
    parameters { string(name: 'BRANCH', defaultValue: 'main', description: '') }
  
    stages {
      
       stage("github download"){
          
           steps{
               checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git-ssh-auth-cred', url: 'git@github.com:Talent-devops20/talent-eks.git']])
           }
        }
       
       stage("initialize"){
           steps{
               
               sh 'terraform init -migrate-state'
           }
       }
       stage("validation"){
           steps{
               
               sh 'terraform validate'
           }
       }
       stage("planning"){
           steps{
               
               sh 'terraform plan'
           }
       }
       stage("deploy"){
           steps{
               
               sh 'terraform apply --auto-approve'
           }
       }
       
    }
    post{
        
        always{
            emailext attachLog: true, body: '''Hi ,

The jenkins job status.
jenkins url: $BUILD_URL

Thanks
DevOps Team''', subject: 'Jenkins Build Status: $BUILD_NUMBER', to: 'malleshdevops2021@outlook.com'
        }
       
          
    }
}

