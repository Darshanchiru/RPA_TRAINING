namespace: SAP.RPA_ACTIVITIES
flow:
  name: create_user
  inputs:
    - username: DA_user7
    - firstname: Sharuk
    - lastname: khan
    - email: sharuk@gmail.com
    - password: Admin@123
  workflow:
    - createUser:
        do:
          SAP.RPA_ACTIVITIES.createUser:
            - username: '${username}'
            - lastname: '${lastname}'
            - firstname: '${firstname}'
            - email: '${email}'
            - password: '${password}'
        publish:
          - user_status
        navigate:
          - SUCCESS: string_equals
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - string_equals:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${user_status}'
            - second_string: '${"User "+username+" created"}'
            - ignore_case: 'true'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
    - CUSTOM
extensions:
  graph:
    steps:
      createUser:
        x: 135
        'y': 26
        navigate:
          5b4bf6d5-2c0e-0d35-a92a-e19f969fb254:
            targetId: 0fe9425e-aa59-6da9-6260-370c29020bf3
            port: WARNING
      string_equals:
        x: 180
        'y': 116
        navigate:
          f915cb39-8f95-dc66-aaa0-2bd7cd8f6055:
            targetId: a8a83661-e97c-181f-e19c-f4807cfd18ce
            port: SUCCESS
    results:
      SUCCESS:
        a8a83661-e97c-181f-e19c-f4807cfd18ce:
          x: 343
          'y': 43
      CUSTOM:
        0fe9425e-aa59-6da9-6260-370c29020bf3:
          x: -8
          'y': 59
