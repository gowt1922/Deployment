node ('Master'){
    def mvnhome = tool 'Maven3'
    stage('Checkout') {
        
       checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/gowt1922/Deployment.git']]]) 
    }
 
    stage('build') {
        sh 'mvn -f Deployment/app.xml clean install'
    }   
    
    stage('build docker image') {
        withDockerRegistry([credentialsID: dockerhub, url: "https://index.dockerhub.io"])
        image = docker.build("Deployment/Webapp", "Deployment")
        image.push()
    }
    
    stage('deploykube') {
        kubernetesDeploy(
            configs: 'Deployment/app_dep.yml',
            kubeconfigid: 'kube',
            enableconfigsubstitution: true
            )
            
    }
