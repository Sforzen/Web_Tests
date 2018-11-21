Feature: Login With Credentials to Redfin
    Access to Redfin with credentials provided

    Scenario Outline: Login with credentials
        Given <username> and <password>
        When I login to Redfin with Google Chrome
        Then I should be <result>

    Examples:
        | username                  | password         | result       |
        | "dang.bdd92@gmail.com"    | "supersecure1!"  | "successful" |
        | "my.fake.email@gmail.com" | "fakepass11!"    | "fail"       |
