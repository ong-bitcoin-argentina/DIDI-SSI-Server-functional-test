@didi-server
Feature: SMS Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: validate cell phone
    Given A account <request>
    When I send POST request to /sendSmsValidator
    Then I get response code 200

    Examples:
      | request                               |
      | {"cellphoneNumber": "+5493513261149"} |

  Scenario Outline: validate sms code of six digits
    Given A token <request>
    When I send POST request to /verifySmsCode
    Then I get response code 200

    Examples:
      | request                                                         |
      | {"validationCode": "123456","did": "sd","cellphoneNumber": "sd"}|


  Scenario Outline: send Mail Validator
    Given A account <request>
    When I send POST request to /sendMailValidator
    Then I get response code 200

    Examples:
      | request                               |
      | {"eMail":"gaston.genaud@didi.org.ar"} |

  Scenario Outline: verify mail code
    Given A account <request>
    When I send POST request to /verifyMailCode
    Then I get response code 200

    Examples:
      | request                                                                                                                                                                     |
      | {"validationCode": "123456","did": "sd","eMail": "sd"}|
