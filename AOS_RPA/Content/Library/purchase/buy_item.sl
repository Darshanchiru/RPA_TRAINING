namespace: purchase
flow:
  name: buy_item
  inputs:
    - aos_url: 'http://rpa.mf-te.com:8080/'
    - username: joe.doe
    - password: Cloud@joe1
    - catalog: MICE
    - item: HP Z4000 WIRELESS MOUSE
  workflow:
    - buy_item:
        do:
          rpa_Activity.buy_item:
            - url: '${aos_url}'
            - username: '${username}'
            - password: '${password}'
            - catalog: '${catalog}'
            - item: '${item}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      buy_item:
        x: 38
        'y': 99
        navigate:
          86ed22c2-8d59-c29d-c92f-f169db5e9c6f:
            targetId: bba36d83-2007-339e-cb97-873fb065fc72
            port: SUCCESS
          e545894e-e75c-b4ed-8c14-99a5996c042c:
            targetId: bba36d83-2007-339e-cb97-873fb065fc72
            port: WARNING
    results:
      SUCCESS:
        bba36d83-2007-339e-cb97-873fb065fc72:
          x: 241
          'y': 84
