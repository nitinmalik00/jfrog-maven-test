node('deb7-mvn3-gradle2-java8-pyth27') {
   //checkout scm
   properties([
  parameters([
    string(name: 'submodule', defaultValue: ''),
    string(name: 'submodule_branch', defaultValue: ''),
    string(name: 'commit_sha', defaultValue: ''),
  ])
])
   stage 'Stage 1'
         sh("ls -l")
         sh("pwd")
         sh("ls -l /var/lib/jenkins/workspace/buildinfra_demo_multibranchPipeline/")
   		echo 'Hello World 1'
         echo params.submodule
   stage 'Stage 2'
   		echo 'Hello World 2'
   stage 'Last stage'
   		echo 'This is last stage'
}
