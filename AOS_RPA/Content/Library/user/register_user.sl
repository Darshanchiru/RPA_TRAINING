namespace: user
flow:
  name: register_user
  inputs:
    - url: 'http://rpa.mf-te.com:8080/'
    - username: Mahesh
    - password: Mahesh@123
    - email: Mahesh@gmail.com
    - firstname: Mahesh
    - lastname: Gupta
  workflow:
    - register_user:
        do:
          rpa_Activity.register_user:
            - url: '${url}'
            - username: '${username}'
            - email: '${email}'
            - password: '${password}'
            - firstname: '${firstname}'
            - lastname: '${lastname}'
        publish:
          - create_user
        navigate:
          - SUCCESS: check_whether_user_created
          - WARNING: check_whether_user_created
          - FAILURE: on_failure
    - check_whether_user_created:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${create_user}'
            - second_string: '${username}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      register_user:
        x: 100
        'y': 69
      check_whether_user_created:
        x: 159
        'y': 219
        navigate:
          81712fb1-5dab-355e-26ff-a8f2ad8455de:
            targetId: f0cc3d22-71a5-765c-6cd5-b8cef7a93172
            port: SUCCESS
    results:
      SUCCESS:
        f0cc3d22-71a5-765c-6cd5-b8cef7a93172:
          x: 266
          'y': 77
