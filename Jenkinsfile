pipeline {
     agent any
     stages {
          stage("Compile") {
               steps {
                    sh "./gradlew compileJava"
               }
          }
         
		   //stage("Code coverage") {
  //   steps {
         // sh "./gradlew jacocoTestReport"
         // sh "./gradlew jacocoTestCoverageVerification"
     //}
//}
		  
stage("Package") {
     steps {
          sh "./gradlew build"
     }
}

stage("Docker build") {
     steps {
	     
          sh "docker build -t ram423/calculator_1 ."
     }
}

stage("Docker push") {
     steps {
	  sh "docker login -u ram423 -p reeloff423"

          sh "docker push ram423/calculator_1"
     }
}
stage("Deploy to staging") {
     steps {
	
      //    sh "docker run -d --rm -p 8765:8080 --name calculator_1 ram423/calculator_1"
		 sh "docker-compose up -d"
     }
}

stage("Acceptance test") {
     steps {
          sleep 60
          sh "./acceptance_test_docker.sh"
     }
}
     }
	 post {
     always {
         sh "docker-compose down"
     }
}
}
