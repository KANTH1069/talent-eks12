pipeline {
    agent any
     
    parameters { string(name: 'BRANCH', defaultValue: 'main', description: '') }
  
    stages {
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
DevOps Team''', subject: 'Jenkins Build Status: $BUILD_NUMBER', to: 'balla.laxmikanth2012@gamil.com'
        }
       
          
    }
}

