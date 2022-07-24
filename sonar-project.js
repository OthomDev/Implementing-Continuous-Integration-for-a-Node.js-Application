const scanner = require('sonarqube-scanner');

scanner(
  {
    serverUrl : 'http://localhost:9000/',
    token : "squ_1cfb716bc4f48244f76d30cfa4d16b405010f86c",
    options: {
      'sonar.projectName': 'Project_1',
      'sonar.projectDescription': '',
      'sonar.sources': 'dist',
      'sonar.tests': 'specs'
    }
  },
  () => process.exit()
)
