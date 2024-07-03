- dashboard: dataminr_alerts_drilldown
  title: Dataminr Alerts Drilldown
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: LccmS1vRtjjtJW69epOG1g
  elements:
  - title: Untitled
    name: Untitled
    model: dataminr_project
    explore: events
    type: looker_google_map
    fields: [events.event__location, events.location_count]
    sorts: [events.location_count desc 0]
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
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    map_marker_color: ["#7b56db"]
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    title_hidden: true
    listen:
      Select Time Range: events.event_timestamp_date_time
      Location: events.principal__location__country_or_region
      Source: alerts_by_source.alert_by_source_value_filter
      Company: company_name.company_name_value
      Severity: events__about__labels__alert_type_name.value
      Topic: events__security_result__category_details.events__security_result__category_details_filter
      Watchlist: watchlist_name.watchlist_name_value
    row: 2
    col: 0
    width: 12
    height: 8
  - title: Untitled
    name: Untitled (2)
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events.event_timestamp_in_week, events__security_result__category_details.events__security_result__category_details,
      count_of_metadata_id]
    filters:
      events__security_result__category_details.events__security_result__category_details: "-NULL"
    sorts: [events__security_result__category_details.events__security_result__category_details,
      events.event_timestamp_in_week desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: if(${events__security_result__category_details.events__security_result__category_details}
        = offset(${events__security_result__category_details.events__security_result__category_details},-2),
        ${count_of_metadata_id} - offset(${count_of_metadata_id}, -2), if (${events__security_result__category_details.events__security_result__category_details}
        = offset(${events__security_result__category_details.events__security_result__category_details},-1),
        ${count_of_metadata_id} - offset(${count_of_metadata_id}, -1),null))
      label: Week Trend
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: week_trend
      _type_hint: number
    - category: table_calculation
      expression: if(${events__security_result__category_details.events__security_result__category_details}
        = offset(${events__security_result__category_details.events__security_result__category_details},-2),
        offset(${count_of_metadata_id}, -2), if (${events__security_result__category_details.events__security_result__category_details}
        = offset(${events__security_result__category_details.events__security_result__category_details},-1),
        offset(${count_of_metadata_id}, -1),null))
      label: p_count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: p_count
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
      events__security_result__category_details.events__security_result__category_details: Topic
      count_of_metadata_product_log_id: Count
      events.event_timestamp_in_week: Time
      count_of_metadata_id: Count
    series_column_widths:
      events.event_timestamp_in_week: 81.81100000000004
      events__security_result__category_details.events__security_result__category_details: 410
    series_cell_visualizations:
      count_of_metadata_product_log_id:
        is_active: false
    defaults_version: 1
    hidden_fields: [events.event_timestamp_in_week, p_count]
    hidden_pivots: {}
    title_hidden: true
    listen:
      Select Time Range: events.event_timestamp_date_time
      Location: events.principal__location__country_or_region
      Source: alerts_by_source.alert_by_source_value_filter
      Company: company_name.company_name_value
      Severity: events__about__labels__alert_type_name.value
      Topic: events__security_result__category_details.events__security_result__category_details_filter
      Watchlist: watchlist_name.watchlist_name_value
    row: 2
    col: 12
    width: 12
    height: 8
  - title: Untitled
    name: Untitled (3)
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events.metadata__description, events.event_timestamp_date_time, events__target__labels.key,
      events__target__labels.value, events.external_cyber_link]
    filters:
      events__target__labels.key: '"post_link"'
    sorts: [events.event_timestamp_date_time desc]
    limit: 5000
    column_limit: 50
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
    column_order: ["$$$_row_numbers_$$$", events.metadata__description, events.event_timestamp_date_time,
      events__target__labels.value]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.metadata__description: Caption
      events.event_timestamp_date_time: Time
      events__target__labels.value: Source Link
      events.external_cyber_link: Link to Source
    series_column_widths:
      events.metadata__description: 984.629
      events.event_timestamp_date_time: 132
      events__target__labels.value: 656
    defaults_version: 1
    hidden_fields: [events__target__labels.key]
    title_hidden: true
    listen:
      Select Time Range: events.event_timestamp_date_time
      Location: events.principal__location__country_or_region
      Source: alerts_by_source.alert_by_source_value_filter
      Company: company_name.company_name_value
      Severity: events__about__labels__alert_type_name.value
      Topic: events__security_result__category_details.events__security_result__category_details_filter
      Watchlist: watchlist_name.watchlist_name_value
    row: 10
    col: 0
    width: 24
    height: 9
  - title: Alerts by Source
    name: Alerts by Source
    model: dataminr_project
    explore: events
    type: looker_pie
    fields: [alerts_by_source.alert_by_source_value, events.alert_by_source_count]
    filters:
      alerts_by_source.alert_by_source_value: "-NULL"
    sorts: [events.alert_by_source_count desc 0]
    limit: 10
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
    value_labels: labels
    label_type: lab
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Select Time Range: events.event_timestamp_date_time
      Location: events.principal__location__country_or_region
      Source: alerts_by_source.alert_by_source_value_filter
      Company: company_name.company_name_value
      Severity: events__about__labels__alert_type_name.value
      Topic: events__security_result__category_details.events__security_result__category_details_filter
      Watchlist: watchlist_name.watchlist_name_value
    row: 19
    col: 0
    width: 12
    height: 7
  - title: Alerts by Channel
    name: Alerts by Channel
    model: dataminr_project
    explore: events
    type: looker_pie
    fields: [alert_source.alert_source_value, events.alert_source_count]
    filters:
      alert_source.alert_source_value: "-NULL"
    sorts: [events.alert_source_count desc 0]
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
    value_labels: labels
    label_type: lab
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Select Time Range: events.event_timestamp_date_time
      Location: events.principal__location__country_or_region
      Source: alerts_by_source.alert_by_source_value_filter
      Company: company_name.company_name_value
      Severity: events__about__labels__alert_type_name.value
      Topic: events__security_result__category_details.events__security_result__category_details_filter
      Watchlist: watchlist_name.watchlist_name_value
    row: 19
    col: 12
    width: 12
    height: 7
  - title: Top Trending CVEs
    name: Top Trending CVEs
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events__extensions__vulns__vulnerabilities.cve_id, events.ip_count, events.ip_count_percent]
    filters:
      events__extensions__vulns__vulnerabilities.cve_id: "-EMPTY"
    sorts: [events.ip_count desc 0]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_product_log_id
      based_on: events.metadata__product_log_id
      expression: ''
      label: Count of Metadata Product Log ID
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
      count_of_metadata_product_log_id: count
      events__extensions__vulns__vulnerabilities.cve_id: CVE
      events.ip_count: count
      events.ip_count_percent: percent
    series_cell_visualizations:
      count_of_metadata_product_log_id:
        is_active: false
    defaults_version: 1
    listen:
      Select Time Range: events.event_timestamp_date_time
      Location: events.principal__location__country_or_region
      Source: alerts_by_source.alert_by_source_value_filter
      Company: company_name.company_name_value
      Severity: events__about__labels__alert_type_name.value
      Topic: events__security_result__category_details.events__security_result__category_details_filter
      Watchlist: watchlist_name.watchlist_name_value
    row: 26
    col: 8
    width: 8
    height: 6
  - title: Top Open Ports
    name: Top Open Ports
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events.principal__port, events.ip_count, events.ip_count_percent]
    filters:
      events.principal__port: NOT NULL
    sorts: [events.ip_count_percent desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_product_log_id
      based_on: events.metadata__product_log_id
      expression: ''
      label: Count of Metadata Product Log ID
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
      count_of_metadata_product_log_id: count
      events.principal__port: Port
      events.ip_count: count
      events.ip_count_percent: percent
    series_cell_visualizations:
      count_of_metadata_product_log_id:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Select Time Range: events.event_timestamp_date_time
      Location: events.principal__location__country_or_region
      Source: alerts_by_source.alert_by_source_value_filter
      Company: company_name.company_name_value
      Severity: events__about__labels__alert_type_name.value
      Topic: events__security_result__category_details.events__security_result__category_details_filter
      Watchlist: watchlist_name.watchlist_name_value
    row: 26
    col: 16
    width: 8
    height: 6
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"h3","children":[{"text":"An overview of your Dataminr alerts
      stored in Splunk."}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Top Exploiting IP Addresses
    name: Top Exploiting IP Addresses
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events.ip_count, events.ip_count_percent, events__principal__ip.events__principal__ip__regex]
    filters:
      events__principal__ip.events__principal__ip__regex: "-NULL"
    sorts: [events.ip_count desc 0]
    limit: 5000
    column_limit: 50
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
      events.ip_count: count
      events__principal__ip.events__principal__ip__regex: IP
      events.ip_count_percent: percent
    series_cell_visualizations:
      events.ip_count:
        is_active: false
    defaults_version: 1
    listen:
      Select Time Range: events.event_timestamp_date_time
      Location: events.principal__location__country_or_region
      Source: alerts_by_source.alert_by_source_value_filter
      Company: company_name.company_name_value
      Severity: events__about__labels__alert_type_name.value
      Topic: events__security_result__category_details.events__security_result__category_details_filter
      Watchlist: watchlist_name.watchlist_name_value
    row: 26
    col: 0
    width: 8
    height: 6
  filters:
  - name: Select Time Range
    title: Select Time Range
    type: field_filter
    default_value: 24 hour
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: dataminr_project
    explore: events
    listens_to_filters: []
    field: events.event_timestamp_date_time
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: dataminr_project
    explore: events
    listens_to_filters: []
    field: events.principal__location__country_or_region
  - name: Source
    title: Source
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: dataminr_project
    explore: events
    listens_to_filters: []
    field: alerts_by_source.alert_by_source_value_filter
  - name: Company
    title: Company
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: dataminr_project
    explore: events
    listens_to_filters: []
    field: company_name.company_name_value
  - name: Severity
    title: Severity
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: dataminr_project
    explore: events
    listens_to_filters: []
    field: events__about__labels__alert_type_name.value
  - name: Topic
    title: Topic
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: dataminr_project
    explore: events
    listens_to_filters: []
    field: events__security_result__category_details.events__security_result__category_details_filter
  - name: Watchlist
    title: Watchlist
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: dataminr_project
    explore: events
    listens_to_filters: []
    field: watchlist_name.watchlist_name_value
