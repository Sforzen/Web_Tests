Feature: Check estate listings on Redfin
    check estate listings on redfin and make sure criteria match

    Scenario Outline: Check estate listing criteria
        Given I want <number_beds> beds and <number_baths> and at the max price of $1M in <city>
        When I search for listings on Redfin with my criteria
        Then I should be <result> and only see results based on my criteria

    Examples:
        | number_beds | number_baths | max_price       | city          | result       |
        | 2           | 2            | "$1M"           | Irvine, CA    | "successful" |
        | 3           | 2            | "$2M"           | Santa Ana, CA | "successful" |
