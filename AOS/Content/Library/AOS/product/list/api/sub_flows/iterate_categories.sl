namespace: AOS.product.list.api.sub_flows
flow:
  name: iterate_categories
  inputs:
    - json
    - category_id
    - file_path
  workflow:
    - get_catergory:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: '${"$[?(@.categoryId == "+category_id+")]"}'
        publish:
          - category_json: '${return_result}'
        navigate:
          - SUCCESS: get_category_name
          - FAILURE: on_failure
    - get_category_name:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${category_json}'
            - json_path: '$.*.categoryName'
        publish:
          - category_name: '${return_result[2:-2]}'
        navigate:
          - SUCCESS: get_product_id
          - FAILURE: on_failure
    - get_product_id:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: '$.*.products.*.productId'
        publish:
          - product_ids: '${return_result[1:-1]}'
        navigate:
          - SUCCESS: iterate_products
          - FAILURE: on_failure
    - iterate_products:
        loop:
          for: product_id in product_ids
          do:
            AOS.product.list.api.sub_flows.iterate_products:
              - json: '${category_json}'
              - category_name: '${category_name}'
              - category_id: '${category_id}'
              - product_id: '${product_id}'
              - file_path: '${file_path}'
          break: []
        navigate:
          - FAILURE: FAILURE
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_category_name:
        x: 211
        'y': 49
      get_catergory:
        x: 31
        'y': 52
      get_product_id:
        x: 215
        'y': 234
      iterate_products:
        x: 363
        'y': 242
        navigate:
          285289a3-cae8-dfbe-3b19-868c3496edea:
            targetId: 8199deb4-f56c-7edf-e437-c0b36dbe373b
            port: SUCCESS
          20b20040-9f9b-f8b2-5679-2c639f33ec69:
            targetId: 5a2be4c1-fac3-7d35-71ea-55910e17751f
            port: FAILURE
    results:
      SUCCESS:
        8199deb4-f56c-7edf-e437-c0b36dbe373b:
          x: 514
          'y': 221
      FAILURE:
        5a2be4c1-fac3-7d35-71ea-55910e17751f:
          x: 380
          'y': 67
