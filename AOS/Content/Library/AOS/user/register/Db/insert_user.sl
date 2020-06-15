namespace: AOS.user.register.Db
flow:
  name: insert_user
  inputs:
    - login_name: Darshan
    - password: 'Admin@!23'
    - email: darshan.a@microfocus.com
    - first_name: Darshan
    - last_name: Anand
  workflow:
    - hash_password:
        do:
          AOS.user.register.Db.subflows.sha1:
            - text: '${password}'
        publish:
          - password_sha1: '${sha1}'
        navigate:
          - SUCCESS: hash_name_password
    - hash_name_password:
        do:
          AOS.user.register.Db.subflows.sha1:
            - text: '${login_name[::-1]+password_sha1}'
        publish:
          - username_password_sha1: '${sha1}'
        navigate:
          - SUCCESS: random_user_id
    - random_user_id:
        do:
          io.cloudslang.base.math.random_number_generator:
            - min: '100000000'
            - max: '1000000000'
        publish:
          - user_id: '${random_number}'
        navigate:
          - SUCCESS: insert_user
          - FAILURE: on_failure
    - insert_user:
        do:
          io.cloudslang.base.database.sql_command:
            - db_server_name: "${get_sp('db_host')}"
            - db_type: PostgreSQL
            - username: "${get_sp('db_user')}"
            - password:
                value: "${get_sp('db_password')}"
                sensitive: true
            - database_name: adv_account
            - command: "${\"INSERT INTO account (user_id, user_type, active, agree_to_receive_offers, defaultpaymentmethodid, email, internallastsuccesssullogin, internalunsuccessfulloginattempts, internaluserblockedfromloginuntil, first_name, last_name, login_name, password, country_id, address, city_name) VALUES ('\"+user_id+\"', 20, 'Y', true, 0, '\"+email+\"', 0, 0, 0, '\"+first_name+\"', '\"+last_name+\"', '\"+login_name+\"', '\"+username_password_sha1+\"', 210, '', '');\"}"
            - trust_all_roots: 'true'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      hash_password:
        x: 76
        'y': 88
      hash_name_password:
        x: 84
        'y': 256
      random_user_id:
        x: 212
        'y': 78
      insert_user:
        x: 254
        'y': 253
        navigate:
          f3bdb879-b09b-7aea-4650-4792a3dd8ae7:
            targetId: c7a23700-0630-aa98-0aee-2aaf7a6e43d6
            port: SUCCESS
    results:
      SUCCESS:
        c7a23700-0630-aa98-0aee-2aaf7a6e43d6:
          x: 413
          'y': 193
