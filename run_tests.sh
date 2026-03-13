
rm -rf allure-results allure-report

robot --listener allure_robotframework:allure-results \
      --outputdir results \
      tests/

allure generate allure-results -o allure-report --clean
allure open allure-report