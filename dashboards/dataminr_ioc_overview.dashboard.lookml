- dashboard: dataminr_ioc_overview
  title: Dataminr IOC Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: DRqbijjoC8z7bX0oGC8z0o
  elements:
  - title: Vulnerable IP Addresses
    name: Vulnerable IP Addresses
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip__regex, count_of_metadata_id]
    filters:
      events__principal__ip.events__principal__ip__regex: "-NULL"
    sorts: [count_of_metadata_id desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_product_log_id
      based_on: events.metadata__product_log_id
      expression: ''
      label: Count of Metadata Product Log ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__principal__ip.events__principal__ip__regex: IP Address
      count_of_metadata_product_log_id: Alert Count
      count_of_metadata_id: Alert Count
    series_cell_visualizations:
      count_of_metadata_product_log_id:
        is_active: false
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_column_widths:
      events__principal__ip.events__principal__ip__regex: 149.42000000000007
    listen:
      Select Time Range: events.event_timestamp_date_time
    row: 8
    col: 0
    width: 6
    height: 6
  - title: Vulnerable Hashes
    name: Vulnerable Hashes
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events__security_result_for.about__file__hash, count_of_metadata_id]
    filters:
      events__security_result_for.about__file__hash: "-EMPTY"
    sorts: [count_of_metadata_id desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Alert Count
      value_format:
      value_format_name:
      based_on: events.metadata__product_log_id
      _kind_hint: measure
      measure: alert_count
      type: count_distinct
      _type_hint: number
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__security_result_for.about__file__hash: Hash
      count_of_metadata_id: Alert Count
    series_column_widths:
      events__security_result_for.about__file__hash: 448
    series_cell_visualizations:
      alert_count:
        is_active: false
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Select Time Range: events.event_timestamp_date_time
    row: 8
    col: 6
    width: 6
    height: 6
  - title: Vulnerable Domains
    name: Vulnerable Domains
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events__security_result.about__url__domain, count_of_metadata_id]
    filters:
      events__security_result.about__url__domain: "-NULL"
    sorts: [count_of_metadata_id desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_product_log_id
      based_on: events.metadata__product_log_id
      expression: ''
      label: Count of Metadata Product Log ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__security_result.about__url__domain: Domain
      count_of_metadata_product_log_id: Alert Count
      count_of_metadata_id: Alert Count
    series_column_widths:
      events__security_result.about__url__domain: 170
    series_cell_visualizations:
      count_of_metadata_product_log_id:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Select Time Range: events.event_timestamp_date_time
    row: 8
    col: 12
    width: 6
    height: 6
  - title: Vulnerable Malware
    name: Vulnerable Malware
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events__security_result__associations.name, count_of_metadata_id]
    filters:
      events__security_result__associations.name: "-NULL"
    sorts: [count_of_metadata_id desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_product_log_id
      based_on: events.metadata__product_log_id
      expression: ''
      label: Count of Metadata Product Log ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__security_result__associations.name: Malware
      count_of_metadata_product_log_id: Alert Count
      count_of_metadata_id: Alert Count
    series_column_widths:
      events__security_result__associations.name: 140
    series_cell_visualizations:
      count_of_metadata_product_log_id:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Select Time Range: events.event_timestamp_date_time
    row: 8
    col: 18
    width: 6
    height: 6
  - title: Affected IP Addresses
    name: Affected IP Addresses
    model: dataminr_project
    explore: events
    type: dataminr_project::ioc_viz
    fields: [events.event_timestamp_date_time, events__principal__ip.events__principal__ip__regex,
      count_of_metadata_id]
    filters:
      events__principal__ip.events__principal__ip__regex: "-NULL"
    sorts: [events.event_timestamp_date_time desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    hidden_fields: [events__principal__ip.events__principal__ip__regex]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#7CB342"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    listen:
      Select Time Range: events.event_timestamp_date_time
    row: 2
    col: 0
    width: 6
    height: 6
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"h3","children":[{"text":"This dashboards shows Indicator
      of Compromise in the current Splunk environment."}],"id":1697018359819}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Affected Hashes
    name: Affected Hashes
    model: dataminr_project
    explore: events
    type: dataminr_project::ioc_viz
    fields: [events.event_timestamp_date_time, count_of_metadata_id, events__security_result_for.about__file__hash]
    filters:
      events__security_result_for.about__file__hash: "-NULL"
    sorts: [events.event_timestamp_date_time desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#7CB342"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    listen:
      Select Time Range: events.event_timestamp_date_time
    row: 2
    col: 6
    width: 6
    height: 6
  - title: Affected Domain
    name: Affected Domain
    model: dataminr_project
    explore: events
    type: dataminr_project::ioc_viz
    fields: [events.event_timestamp_date_time, count_of_metadata_id, events__security_result.about__url__domain]
    filters:
      events__security_result.about__url__domain: "-NULL"
    sorts: [events.event_timestamp_date_time desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#7CB342"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    listen:
      Select Time Range: events.event_timestamp_date_time
    row: 2
    col: 12
    width: 6
    height: 6
  - title: Detected Malware
    name: Detected Malware
    model: dataminr_project
    explore: events
    type: dataminr_project::ioc_viz
    fields: [events.event_timestamp_date_time, count_of_metadata_id, events__security_result__associations.name]
    filters:
      events__security_result__associations.name: "-NULL"
    sorts: [events.event_timestamp_date_time desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#7CB342"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    listen:
      Select Time Range: events.event_timestamp_date_time
    row: 2
    col: 18
    width: 6
    height: 6
  filters:
  - name: Select Time Range
    title: Select Time Range
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: dataminr_project
    explore: events
    listens_to_filters: []
    field: events.event_timestamp_date_time
