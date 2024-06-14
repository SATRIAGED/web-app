def appName = 'web-app'
def namespace = 'web'


pipeline {

agent { dockerfile true }
 stages {
     stage("Checkout code") {
         steps {
             checkout scm
         }
     }
     stage('Git clone') {
      steps {
        git branch: 'main', credentialsId: 'usnmepswdGIT',
          url: 'https://github.com/SATRIAGED/web-app.git'
      }
    }
     stage("Build image") {
         steps {
             sh 'php -v'
             sh 'apache2 -v'
         }
     }
 stage("Deploy Kubernetes") {

     steps {
                 script {
     withKubeConfig([credentialsId: 'kubeconfig']) 
         {
       sh "$(which kubectl) apply -f deployment.yaml"
       sh "$(which kubectl) apply -f service.yaml"
       }                
     }
       //kubernetesDeploy(configs: "deployment.yml", "service.yml")
       }                
     }

   }
 }
