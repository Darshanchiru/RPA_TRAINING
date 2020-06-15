namespace: AOS.product.list.api
flow:
  name: get_products
  inputs:
    - aos_url: 'http://rpa.mf-te.com:8080'
    - file_path: "c:\\\\temp\\\\products.xls"
  workflow:
    - http_client_get:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: '${aos_url+"/catalog/api/v1/categories/all_data"}'
        publish:
          - json: '${return_result}'
        navigate:
          - SUCCESS: is_true
          - FAILURE: on_failure
    - write_to_header:
        do:
          io.cloudslang.base.filesystem.write_to_file:
            - file_path: '${file_path}'
            - text: "${'+'+'+'.join([''.center(13,'-'),''.center(15,'-'),''.center(12,'-'),''.center(51,'-'),''.center(15,'-'),''.center(60,'-')])+'+\\n'+\\\n'|'+'|'.join(['Category ID'.center(13),'Category Name'.center(15),'Product ID'.center(12),'Product Name'.center(51),'Product Price'.center(15),'Color Codes'.center(60)])+'|\\n'+\\\n'+'+'+'.join([''.center(13,'-'),''.center(15,'-'),''.center(12,'-'),''.center(51,'-'),''.center(15,'-'),''.center(60,'-')])+'+\\n'}"
        navigate:
          - SUCCESS: get_product
          - FAILURE: on_failure
    - get_product:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: '$.*.categoryId'
        publish:
          - category_id_list: '${return_result[1:-1]}'
        navigate:
          - SUCCESS: iterate_categories
          - FAILURE: on_failure
    - iterate_categories:
        loop:
          for: category_id in category_id_list
          do:
            AOS.product.list.api.sub_flows.iterate_categories:
              - json: '${json}'
              - category_id: '${category_id}'
              - file_path: '${file_path}'
          break: []
        navigate:
          - FAILURE: FAILURE
          - SUCCESS: SUCCESS
    - is_true:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: '${str(file_path.endswith("xls") or file_path.endswith("xlsx"))}'
        navigate:
          - 'TRUE': delete
          - 'FALSE': write_to_header
    - delete:
        do:
          io.cloudslang.base.filesystem.delete:
            - source: '${file_path}'
        navigate:
          - SUCCESS: New_Excel_Document
          - FAILURE: New_Excel_Document
    - New_Excel_Document:
        do_external:
          9d21ca68-7d03-4fb3-9478-03956532bf6f:
            - excelFileName: '${file_path}'
            - worksheetNames: products
            - delimiter: ','
        navigate:
          - failure: on_failure
          - success: get_product
  outputs:
    - return_result: '${json}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      http_client_get:
        x: 13
        'y': 91
      write_to_header:
        x: 323
        'y': 69
      New_Excel_Document:
        x: 458
        'y': 236
      iterate_categories:
        x: 585
        'y': 77
        navigate:
          47fe8710-32f8-18ef-21b0-5f69e61721b6:
            targetId: aa8d440a-331c-497e-5b25-f3c49c10f06d
            port: SUCCESS
          adefe9d0-094f-a3cf-f22d-ac55044281c0:
            targetId: cf7df6c2-51bc-dcd1-94c9-e3c9342a5d95
            port: FAILURE
      is_true:
        x: 130
        'y': 249
      delete:
        x: 319
        'y': 251
      get_product:
        x: 442
        'y': 77
    results:
      SUCCESS:
        aa8d440a-331c-497e-5b25-f3c49c10f06d:
          x: 756
          'y': 51
      FAILURE:
        cf7df6c2-51bc-dcd1-94c9-e3c9342a5d95:
          x: 604
          'y': 266
