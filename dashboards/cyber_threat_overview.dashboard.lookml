- dashboard: cyber_threat_overview
  title: Cyber Threat Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: wFC5zbO2xe4S3jlO4qeGfn
  elements:
  - title: Threat Actor Activities
    name: Threat Actor Activities
    model: dataminr_project
    explore: events
    type: dataminr_project::cyber_viz
    fields: [events.event_timestamp_date_month, count_of_metadata_id]
    filters:
      events.metadata__description: "-NULL"
      events.metadata__product_log_id: "-NULL"
      events__security_result__category_details.events__security_result__category_details: Advanced
        Persistent Threats,Ransomware,Hacktivists
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.event_timestamp_date_month desc]
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
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
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
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 0
    col: 0
    width: 6
    height: 6
  - title: Trending Threat Actor Topics
    name: Trending Threat Actor Topics
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events__security_result__category_details.events__security_result__category_details,
      events__security_result__detection_fields.key, events__security_result__detection_fields.value,
      events.selectedtopic_count]
    filters:
      events__security_result__detection_fields.key: '"categories_id"'
      events__security_result__category_details.events__security_result__category_details: Advanced
        Persistent Threats,Ransomware,Hacktivists
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.selectedtopic_count desc 0]
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
      count_of_metadata_product_log_id: count
      events__security_result__category_details.events__security_result__category_details: selectedTopics
      count_of_metadata_id: count
      events.selectedtopic_count: count
    series_cell_visualizations:
      count_of_metadata_product_log_id:
        is_active: true
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
    hidden_pivots: {}
    hidden_fields: [events__security_result__detection_fields.key, events__security_result__detection_fields.value]
    series_column_widths:
      events__security_result__category_details.events__security_result__category_details: 441
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 6
    col: 0
    width: 6
    height: 6
  - title: Cyber Alert Distributions
    name: Cyber Alert Distributions
    model: dataminr_project
    explore: events
    type: looker_map
    fields: [events.event__location, count_of_metadata_id]
    filters:
      events.metadata__product_log_id: "-NULL"
      events__about__labels__watchlist_name.value: "-NULL"
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [count_of_metadata_id desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_description
      based_on: events.metadata__description
      expression: ''
      label: Count of Metadata Description
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_metadata_product_log_id
      based_on: events.metadata__product_log_id
      expression: ''
      label: Count of Metadata Product Log ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_metadata_product_log_id_2
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
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    map_marker_color: ["#800080"]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 24
    col: 0
    width: 24
    height: 12
  - title: Cyber Attacks
    name: Cyber Attacks
    model: dataminr_project
    explore: events
    type: dataminr_project::cyber_viz
    fields: [events.event_timestamp_date_month, count_of_metadata_id]
    filters:
      events.metadata__description: "-NULL"
      events.metadata__product_log_id: "-NULL"
      events__security_result__category_details.events__security_result__category_details: Malware,Network
        Disruptions,Phishing,DDoS,Defacement,Network Scans,Domain Impersonation
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.event_timestamp_date_month desc]
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
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
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
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 0
    col: 6
    width: 6
    height: 6
  - title: Data Breaches
    name: Data Breaches
    model: dataminr_project
    explore: events
    type: dataminr_project::cyber_viz
    fields: [events.event_timestamp_date_month, count_of_metadata_id]
    filters:
      events.metadata__description: "-NULL"
      events.metadata__product_log_id: "-NULL"
      events__security_result__category_details.events__security_result__category_details: Data
        Exposure and Breaches,Doxxing and Leaked Credentials
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.event_timestamp_date_month desc]
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
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
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
    defaults_version: 0
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 0
    col: 12
    width: 6
    height: 6
  - title: Vulnerabilities
    name: Vulnerabilities
    model: dataminr_project
    explore: events
    type: dataminr_project::cyber_viz
    fields: [events.event_timestamp_date_month, count_of_metadata_id]
    filters:
      events.metadata__description: "-NULL"
      events.metadata__product_log_id: "-NULL"
      events__security_result__category_details.events__security_result__category_details: Email
        and Web Servers,Encryption and Certificates,Remote Access and Management Systems,Vulnerability
        Disclosures,Exploits,Bug Bounties
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.event_timestamp_date_month desc]
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
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
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
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 0
    col: 18
    width: 6
    height: 6
  - title: Threat Actor Activity
    name: Threat Actor Activity
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events.event_timestamp_date_time, events.metadata__description, events__security_result__category_details.events__security_result__category_details,
      events__about__labels__alert_type_name.cyber_severity, events.src__application,
      events__security_result.about__resource__name, events.metadata__product_log_id,
      events.external_cyber_link]
    filters:
      events__security_result__category_details.events__security_result__category_details: Advanced
        Persistent Threats,Hacktivists,Ransomware
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.event_timestamp_date_time desc]
    limit: 500
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
      events.external_cyber_link: Raw Logs
      events.event_timestamp_date_time: Event Time
      events.metadata__description: caption
      events__security_result__category_details.events__security_result__category_details: selectedTopics
      events__about__labels__alert_type_name.cyber_severity: severity
      events.src__application: eventSource
    series_column_widths:
      events.event_timestamp_date_time: 157
      events.metadata__description: 1235
      events__security_result__category_details.events__security_result__category_details: 219
      events.src__application: 123
    defaults_version: 1
    hidden_fields: [events__security_result.about__resource__name, events.metadata__product_log_id]
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 12
    col: 0
    width: 12
    height: 6
  - title: Cyber Attacks
    name: Cyber Attacks (2)
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events.event_timestamp_date_time, events.metadata__description, events__security_result__category_details.events__security_result__category_details,
      events__about__labels__alert_type_name.cyber_severity, events.src__application,
      events__security_result.about__resource__name, events.metadata__product_log_id,
      events.external_cyber_link]
    filters:
      events__security_result__category_details.events__security_result__category_details: Malware,Network
        Disruptions,Phishing,DDoS,Defacement,Domain Impersonation,Network Scans
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.event_timestamp_date_time desc]
    limit: 500
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
      events.external_cyber_link: Raw Logs
      events.event_timestamp_date_time: Event Time
      events.metadata__description: caption
      events__security_result__category_details.events__security_result__category_details: selectedTopics
      events__about__labels__alert_type_name.cyber_severity: severity
      events.src__application: eventSource
      events__security_result.about__resource__name: company
    series_column_widths:
      events.event_timestamp_date_time: 160
      events.metadata__description: 1750
      events__security_result__category_details.events__security_result__category_details: 146
      events.src__application: 112
      events__security_result.about__resource__name: 152
    defaults_version: 1
    hidden_fields: [events.metadata__product_log_id]
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 12
    col: 12
    width: 12
    height: 6
  - title: Vulnerabilities
    name: Vulnerabilities (2)
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events.event_timestamp_date_time, events.metadata__description, events__security_result__category_details.events__security_result__category_details,
      events__about__labels__alert_type_name.cyber_severity, events.src__application,
      events__security_result.about__resource__name, events.metadata__product_log_id,
      events.external_cyber_link]
    filters:
      events__security_result__category_details.events__security_result__category_details: Email
        and Web Servers,Encryption and Certificates,Remote Access and Management Systems,Vulnerability
        Disclosures,Exploits,Bug Bounties
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.event_timestamp_date_time desc]
    limit: 500
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
      events.external_cyber_link: Raw Logs
      events.event_timestamp_date_time: Event Time
      events.metadata__description: caption
      events__security_result__category_details.events__security_result__category_details: selectedTopics
      events__about__labels__alert_type_name.cyber_severity: severity
      events.src__application: eventSource
      events__security_result.about__resource__name: company
    series_column_widths:
      events.event_timestamp_date_time: 157
      events.metadata__description: 1285
      events__security_result__category_details.events__security_result__category_details: 260
      events.src__application: 123
      events__security_result.about__resource__name: 138
    defaults_version: 1
    hidden_fields: [events.metadata__product_log_id]
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 18
    col: 12
    width: 12
    height: 6
  - title: Data Breaches
    name: Data Breaches (2)
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events.event_timestamp_date_time, events.metadata__description, events__security_result__category_details.events__security_result__category_details,
      events__about__labels__alert_type_name.cyber_severity, events.src__application,
      events__security_result.about__resource__name, events.metadata__product_log_id,
      events.external_cyber_link]
    filters:
      events__security_result__category_details.events__security_result__category_details: Data
        Exposure and Breaches,Doxxing and Leaked Credentials
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.event_timestamp_date_time desc]
    limit: 500
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
      events.external_cyber_link: Raw Logs
      events.event_timestamp_date_time: Event Time
      events.metadata__description: caption
      events__security_result__category_details.events__security_result__category_details: selectedTopics
      events__about__labels__alert_type_name.cyber_severity: severity
      events.src__application: eventSource
      events__security_result.about__resource__name: company
    series_column_widths:
      events.event_timestamp_date_time: 155
      events.metadata__description: 1336
      events__security_result__category_details.events__security_result__category_details: 197
      events.src__application: 136
      events__security_result.about__resource__name: 140
    defaults_version: 1
    hidden_fields: [events.metadata__product_log_id]
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 18
    col: 0
    width: 12
    height: 6
  - title: Trending Data Breaches
    name: Trending Data Breaches
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events__security_result__category_details.events__security_result__category_details,
      events__security_result__detection_fields.key, events__security_result__detection_fields.value,
      events.selectedtopic_count]
    filters:
      events__security_result__detection_fields.key: '"categories_id"'
      events__security_result__category_details.events__security_result__category_details: Data
        Exposure and Breaches,Doxxing and Leaked Credentials
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.selectedtopic_count desc 0]
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
      count_of_metadata_product_log_id: count
      events__security_result__category_details.events__security_result__category_details: selectedTopics
      count_of_metadata_id: count
      events.selectedtopic_count: count
    series_cell_visualizations:
      count_of_metadata_product_log_id:
        is_active: true
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
    hidden_pivots: {}
    hidden_fields: [events__security_result__detection_fields.key, events__security_result__detection_fields.value]
    series_column_widths:
      events__security_result__category_details.events__security_result__category_details: 620
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 6
    col: 12
    width: 6
    height: 6
  - title: Trending Cyber Attacks Topics
    name: Trending Cyber Attacks Topics
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events__security_result__category_details.events__security_result__category_details,
      events__security_result__detection_fields.key, events__security_result__detection_fields.value,
      events.selectedtopic_count]
    filters:
      events__security_result__detection_fields.key: '"categories_id"'
      events__security_result__category_details.events__security_result__category_details: Malware,Network
        Disruptions,Phishing,DDoS,Defacement,Domain Impersonation,Network Scans
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.selectedtopic_count desc 0]
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
      count_of_metadata_product_log_id: count
      events__security_result__category_details.events__security_result__category_details: selectedTopics
      count_of_metadata_id: count
      events.selectedtopic_count: count
    series_cell_visualizations:
      count_of_metadata_product_log_id:
        is_active: true
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
    hidden_pivots: {}
    hidden_fields: [events__security_result__detection_fields.key, events__security_result__detection_fields.value]
    series_column_widths:
      events__security_result__category_details.events__security_result__category_details: 460
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 6
    col: 6
    width: 6
    height: 6
  - title: Trending Vulnerabilities
    name: Trending Vulnerabilities
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events__security_result__category_details.events__security_result__category_details,
      events__security_result__detection_fields.key, events__security_result__detection_fields.value,
      events.selectedtopic_count]
    filters:
      events__security_result__detection_fields.key: '"categories_id"'
      events__security_result__category_details.events__security_result__category_details: Email
        and Web Servers,Encryption and Certificates,Remote Access and Management Systems,Vulnerability
        Disclosures,Bug Bounties,Exploits
      watchlist_name.watchlist_name_value_filter: "-NULL"
    sorts: [events.selectedtopic_count desc 0]
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
      count_of_metadata_product_log_id: count
      events__security_result__category_details.events__security_result__category_details: selectedTopics
      count_of_metadata_id: count
      events.selectedtopic_count: count
    series_cell_visualizations:
      count_of_metadata_product_log_id:
        is_active: true
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
    hidden_pivots: {}
    hidden_fields: [events__security_result__detection_fields.key, events__security_result__detection_fields.value]
    series_column_widths:
      events__security_result__category_details.events__security_result__category_details: 484
    listen:
      Select Time Range: events.event_timestamp_date_time
      Watchlist: watchlist_name.watchlist_name_value
    row: 6
    col: 18
    width: 6
    height: 6
  filters:
  - name: Select Time Range
    title: Select Time Range
    type: field_filter
    default_value: 14 day
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
