namespace: AOS.product.purchase.api
flow:
  name: add_product_to_cart
  inputs:
    - url: 'http://rpa.mf-te.com:8080'
    - username: darshan
    - password: Admin@123
    - product_id: '29'
    - color_code: '414141'
  workflow:
    - authenticate:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: "${url+'/accountservice/AccountLoginRequest'}"
            - body: "${'<?xml version=\"1.0\" encoding=\"UTF-8\"?><soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"><soap:Body><AccountLoginRequest xmlns=\"com.advantage.online.store.accountservice\"><email></email><loginUser>%s</loginUser><loginPassword>%s</loginPassword></AccountLoginRequest></soap:Body></soap:Envelope>' % (username, password)}"
            - content_type: text/xml
        publish:
          - soap: '${return_result}'
        navigate:
          - SUCCESS: get_user_id
          - FAILURE: on_failure
    - get_auth_token:
        do:
          io.cloudslang.base.xml.xpath_query:
            - xml_document: '${soap}'
            - xpath_query: '//ns2:t_authorization/text()'
        publish:
          - token: '${selected_value}'
        navigate:
          - SUCCESS: add_product_to_cart
          - FAILURE: on_failure
    - get_user_id:
        do:
          io.cloudslang.base.xml.xpath_query:
            - xml_document: '${soap}'
            - xpath_query: '//ns2:userId/text()'
        publish:
          - user_id: '${selected_value}'
        navigate:
          - SUCCESS: get_auth_token
          - FAILURE: on_failure
    - add_product_to_cart:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: '${"%s/order/api/v1/carts/%s/product/%s/color/%s" % (url, user_id, product_id, color_code)}'
            - auth_type: anonymous
            - headers: '${"Authorization: Basic "+token}'
        publish:
          - cart_json: '${return_result}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - cart_json: '${cart_json}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      authenticate:
        x: 64
        'y': 88
      get_user_id:
        x: 85
        'y': 226
      get_auth_token:
        x: 264
        'y': 235
      add_product_to_cart:
        x: 268
        'y': 92
        navigate:
          e4b41610-5655-66dc-54af-0e6c0ddbdca9:
            targetId: b9504053-94b4-70e7-9d46-dba3df6b8fc2
            port: SUCCESS
    results:
      SUCCESS:
        b9504053-94b4-70e7-9d46-dba3df6b8fc2:
          x: 413
          'y': 73
