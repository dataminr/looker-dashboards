- dashboard: close_proximity_overview
  title: Close Proximity Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: gG3aWqVl5XaKCF931NjZxW
  elements:
  - title: Configured Important Locations
    name: Configured Important Locations
    model: dataminr_project
    explore: csvstaticdata
    type: looker_grid
    fields: [csvstaticdata.asset_name, csvstaticdata.asset_type, csvstaticdata.asset_description,
      csvstaticdata.alerting_distance_miles, csvstaticdata.asset_lat, csvstaticdata.asset_long]
    sorts: [csvstaticdata.asset_name]
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    minimum_column_width: 75
    series_column_widths:
      csvstaticdata.asset_description: 426
      csvstaticdata.asset_name: 135
      csvstaticdata.asset_lat: 93
      csvstaticdata.asset_long: 95
    listen: {}
    row: 16
    col: 0
    width: 24
    height: 5
  - title: Table2
    name: Table2
    model: dataminr_project
    explore: events
    type: looker_grid
    fields: [events.asset_name, events.asset_type, events.metadata__description, events.metadata__product_log_id,
      events.asset_distance_miles, events.external_link, alert_name_not_null.alert_name]
    filters:
      events.principal__location__region_coordinates__latitude: NOT NULL
      events.principal__location__region_coordinates__longitude: NOT NULL
      events.asset_distance_miles: NOT NULL
      alert_name_not_null.alert_name: "-NULL"
    sorts: [events.asset_name]
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
      events.external_link: Raw Logs
      events.asset_name: asset_name
      events.asset_type: asset_type
      events.metadata__description: caption
      events.metadata__product_log_id: alertId
      events.asset_distance_miles: asset_distance_miles
      alert_name_not_null.alert_name: alertType
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", events.asset_name, events.asset_type, events.metadata__description,
      events.metadata__product_log_id, alert_name_not_null.alert_name, events.asset_distance_miles,
      events.external_link]
    series_column_widths:
      events.asset_distance_miles: 159
      events.metadata__product_log_id: 327
      events.asset_name: 127
      events.metadata__description: 1178
    title_hidden: true
    listen:
      Select Time Range: events.event_timestamp_date_time
    row: 2
    col: 12
    width: 12
    height: 14
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"h3","align":"start","children":[{"text":"This dashboards
      shows Dataminr alerts within threshold miles from important customer locations."}],"id":1697088043430}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Alerts in Close Proximity
    name: Alerts in Close Proximity
    model: dataminr_project
    explore: close_proxymity_map
    type: looker_map
    fields: [close_proxymity_map.static_location, close_proxymity_map.proximity_alert_type]
    sorts: [close_proxymity_map.static_location]
    limit: 500
    column_limit: 50
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
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: false
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude:
    map_longitude:
    map_zoom:
    map_value_colors: ["#F0BE1B", "#FF8800", "#D25B3B", "#323232"]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Select Time Range: close_proxymity_map.time_derived
    row: 2
    col: 0
    width: 12
    height: 9
  filters:
  - name: Select Time Range
    title: Select Time Range
    type: field_filter
    default_value: 7 day
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
