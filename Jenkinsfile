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
             sh 'docker version'
             sh 'docker image list'
         }
     }
     stage("ssh Kubernetes") {
      def remote = [:]
      remote.name = 'k8s-master'
      remote.host = '192.168.0.26'
      remote.user = 'devops'
      remote.password = '123123'
      remote.allowAnyHosts = true
     }
     stage('Put'){
      sshPut remote: remote, from: 'deployment.yaml', into: '.'
     }
     stage('deploy'){
      sshCommand remote: remote, command: "kubectl apply -f deployment.yaml"
     }
    // when {
    //   branch 'main'
    // }
    //  steps {
    //   withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'kubeconfig', namespace: 'default', restrictKubeConfigAccess: false, serverUrl: 'https://192.168.0.26:6443') {
      // sh 'kubectl apply -f deployment.yaml'
      // sh 'kubectl apply -f service.yaml'
      // sh "mkdir -p ~/.kube/"
    // some block
      
      // withKubeConfig([credentialsId: 'kubeconfig']) {
      //     sh 'cat deployment.yaml | sed "s/{{BUILD_NUMBER}}/$BUILD_NUMBER/g" | kubectl apply -f -'
      //     sh 'kubectl apply -f service.yaml'
      //   }
        // kubernetesDeploy(
        //   kubeconfigId: 'kubeconfig',
        //   configs: 'deployment.yaml',
        //   enableConfigSubstitution: true
        // )
        // kubernetesDeploy(
        //   kubeconfigId: 'kubeconfig',
        //   configs: 'service.yaml',
        //   enableConfigSubstitution: true
        // )
        // kubeconfig(caCertificate: 'kubecertif', credentialsId: 'kubeconfig', serverUrl: 'https://192.168.0.26:6443') {
        //   sh "kubectl apply -f deployment.yaml"
        //   sh "kubectl apply -f service.yaml"
          // kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
        //}
      //    {
      //  sh "kubectl apply -f deployment.yaml"
      //  sh "kubectl apply -f service.yaml"
      //  }                
       //kubernetesDeploy(configs: "deployment.yml", "service.yml")
       }                
     }