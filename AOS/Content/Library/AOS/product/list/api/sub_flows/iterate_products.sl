namespace: AOS.product.list.api.sub_flows
flow:
  name: iterate_products
  inputs:
    - json
    - category_name
    - category_id
    - product_id
    - file_path
  workflow:
    - get_product_name:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${ json}'
            - json_path: "${'$.*.products[?(@.productId == '+product_id+')].productName'}"
        publish:
          - product_name: '${return_result[2:-2]}'
        navigate:
          - SUCCESS: get_product_price
          - FAILURE: on_failure
    - get_product_price:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${ json}'
            - json_path: "${'$.*.products[?(@.productId == '+product_id+')].price'}"
        publish:
          - product_price: '${return_result[1:-1]}'
        navigate:
          - SUCCESS: get_color_code
          - FAILURE: on_failure
    - get_color_code:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${ json}'
            - json_path: "${'$.*.products[?(@.productId == '+product_id+')].colors.*.code'}"
        publish:
          - color_codes: "${filter(lambda ch: ch not in '\"', return_result)[1:-1]}"
        navigate:
          - SUCCESS: add_text_to_file
          - FAILURE: on_failure
    - add_text_to_file:
        do:
          io.cloudslang.base.filesystem.add_text_to_file:
            - file_path: '${file_path}'
            - text: "${\"|\"+\"|\".join([category_id.rjust(13),category_name.ljust(15),product_id.rjust(12),product_name.ljust(51),product_price.rjust(15),color_codes.ljust(60)])+\"|\\n\"}"
        publish: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_product_price:
        x: 241
        'y': 43
      get_product_name:
        x: 34
        'y': 45
      get_color_code:
        x: 23
        'y': 217
      add_text_to_file:
        x: 229
        'y': 219
        navigate:
          5873d782-a2b7-db6c-c286-d34bc16ae59b:
            targetId: 8fc8054c-7897-f831-bf21-b929eebc4036
            port: SUCCESS
    results:
      SUCCESS:
        8fc8054c-7897-f831-bf21-b929eebc4036:
          x: 432
          'y': 189
