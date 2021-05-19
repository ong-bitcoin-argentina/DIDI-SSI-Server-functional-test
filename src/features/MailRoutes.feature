@didi-server
Feature: Mail Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Email validation
    Given A account <request>
    When I send POST request to /sendMailValidator
    Then I get response code 200 and status success

    Examples:
      | request                                                                                                                                    |
      | {"eMail":"gaston.genaud@didi.org.ar"} |

  Scenario Outline: Resend email validation
    Given A token <request>
    When I send POST request to /reSendMailValidator
    Then I get response code 200

    Examples:
      | request                              |
      | {"eMail":"gaston.genaud@didi.org.ar"}|


  Scenario Outline: verify email Code
    Given A account <request>
    When I send POST request to /verifyMailCode
    Then I get response code 200

    Examples:
      | request                                                                                                                                                                     |
      | {"eMail":"gaston.genaud@didi.org.ar","validationCode": "1243", "did":"20"} |
