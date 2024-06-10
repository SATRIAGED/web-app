def appName = 'web-app'
def namespace = 'web'


pipeline {

agent any
 stages {
     stage("Checkout code") {
         steps {
             checkout scm
         }
     }
     stage("Build image") {
         steps {
             script {
                 dockerImage = docker.build('varunmanik/httpd:v1-blue')
             }
         }
     }
 stage("Deploy Kubernetes") {

     steps {
                 script {
     withKubeConfig([credentialsId: 'kubeconfig']) 
         {
       sh "kubectl apply -f deployment.yaml"
       sh "kubectl apply -f service.yaml"
       }                
     }
       //kubernetesDeploy(configs: "deployment.yml", "service.yml")
       }                
     }

   }
 }

