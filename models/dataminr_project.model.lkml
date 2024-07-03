connection: "chronicle"

# include all the views
include: "/views/**/*.view.lkml"
include: "/dashboards/**/*.dashboard"

datagroup: dataminr_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dataminr_default_datagroup

explore: csvstaticdata {}
explore: close_proxymity_map {}

explore: events {
    sql_always_where: ${metadata__log_type} = "DATAMINR_ALERT" ;;
    join: alert_name_not_null {
      type: left_outer
      sql_on: ${events.metadata__id} = ${alert_name_not_null.alert_name_metadata_id} ;;
      relationship: one_to_many
    }
    join: events__about {
      view_label: "Events: About"
      sql: LEFT JOIN UNNEST(${events.about}) as events__about ;;
      relationship: one_to_many
    }
    join: events__src__ip {
      view_label: "Events: Src Ip"
      sql: LEFT JOIN UNNEST(${events.src__ip}) as events__src__ip ;;
      relationship: one_to_many
    }
    join: events__src__mac {
      view_label: "Events: Src Mac"
      sql: LEFT JOIN UNNEST(${events.src__mac}) as events__src__mac ;;
      relationship: one_to_many
    }
    join: events__about__ip {
      view_label: "Events: About Ip"
      sql: LEFT JOIN UNNEST(${events__about.ip}) as events__about__ip ;;
      relationship: one_to_many
    }
    join: events__about__mac {
      view_label: "Events: About Mac"
      sql: LEFT JOIN UNNEST(${events__about.mac}) as events__about__mac ;;
      relationship: one_to_many
    }
    join: events__target__ip {
      view_label: "Events: Target Ip"
      sql: LEFT JOIN UNNEST(${events.target__ip}) as events__target__ip ;;
      relationship: one_to_many
    }
    join: events__src__nat_ip {
      view_label: "Events: Src Nat Ip"
      sql: LEFT JOIN UNNEST(${events.src__nat_ip}) as events__src__nat_ip ;;
      relationship: one_to_many
    }
    join: events__target__mac {
      view_label: "Events: Target Mac"
      sql: LEFT JOIN UNNEST(${events.target__mac}) as events__target__mac ;;
      relationship: one_to_many
    }
    join: events__observer__ip {
      view_label: "Events: Observer Ip"
      sql: LEFT JOIN UNNEST(${events.observer__ip}) as events__observer__ip ;;
      relationship: one_to_many
    }
    join: events__principal__ip {
      view_label: "Events: Principal Ip"
      sql: LEFT JOIN UNNEST(${events.principal__ip}) as events__principal__ip ;;
      relationship: one_to_many
    }
    join: events__observer__mac {
      view_label: "Events: Observer Mac"
      sql: LEFT JOIN UNNEST(${events.observer__mac}) as events__observer__mac ;;
      relationship: one_to_many
    }
    join: events__src__asset__ip {
      view_label: "Events: Src Asset Ip"
      sql: LEFT JOIN UNNEST(${events.src__asset__ip}) as events__src__asset__ip ;;
      relationship: one_to_many
    }
    join: events__about__nat_ip {
      view_label: "Events: About Nat Ip"
      sql: LEFT JOIN UNNEST(${events__about.nat_ip}) as events__about__nat_ip ;;
      relationship: one_to_many
    }
    join: events__intermediary {
      view_label: "Events: Intermediary"
      sql: LEFT JOIN UNNEST(${events.intermediary}) as events__intermediary ;;
      relationship: one_to_many
    }
    join: events__principal__mac {
      view_label: "Events: Principal Mac"
      sql: LEFT JOIN UNNEST(${events.principal__mac}) as events__principal__mac ;;
      relationship: one_to_many
    }
    join: events__src__file__tags {
      view_label: "Events: Src File Tags"
      sql: LEFT JOIN UNNEST(${events.src__file__tags}) as events__src__file__tags ;;
      relationship: one_to_many
    }
    join: events__src__asset__mac {
      view_label: "Events: Src Asset Mac"
      sql: LEFT JOIN UNNEST(${events.src__asset__mac}) as events__src__asset__mac ;;
      relationship: one_to_many
    }
    join: events__target__nat_ip {
      view_label: "Events: Target Nat Ip"
      sql: LEFT JOIN UNNEST(${events.target__nat_ip}) as events__target__nat_ip ;;
      relationship: one_to_many
    }
    join: events__src__file__names {
      view_label: "Events: Src File Names"
      sql: LEFT JOIN UNNEST(${events.src__file__names}) as events__src__file__names ;;
      relationship: one_to_many
    }
    join: events__src__labels {
      view_label: "Events: Src Labels"
      sql: LEFT JOIN UNNEST(${events.src__labels}) as events__src__labels ;;
      relationship: one_to_many
    }
    join: events__about__asset__ip {
      view_label: "Events: About Asset Ip"
      sql: LEFT JOIN UNNEST(${events__about.asset__ip}) as events__about__asset__ip ;;
      relationship: one_to_many
    }
    join: events__observer__nat_ip {
      view_label: "Events: Observer Nat Ip"
      sql: LEFT JOIN UNNEST(${events.observer__nat_ip}) as events__observer__nat_ip ;;
      relationship: one_to_many
    }
    join: events__about__file__tags {
      view_label: "Events: About File Tags"
      sql: LEFT JOIN UNNEST(${events__about.file__tags}) as events__about__file__tags ;;
      relationship: one_to_many
    }
    join: events__about__asset__mac {
      view_label: "Events: About Asset Mac"
      sql: LEFT JOIN UNNEST(${events__about.asset__mac}) as events__about__asset__mac ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip {
      view_label: "Events: Intermediary Ip"
      sql: LEFT JOIN UNNEST(${events__intermediary.ip}) as events__intermediary__ip ;;
      relationship: one_to_many
    }
    join: events__security_result_for {
      view_label: "Events: Security Result for"
      type: left_outer
      relationship: one_to_many
      sql_on: ${events.metadata__id}=${events__security_result_for.log__id} ;;
    }
    join: events__security_result {
      view_label: "Events: Security Result"
      sql: LEFT JOIN UNNEST(${events.security_result}) as events__security_result;;
      # sql: LEFT JOIN UNNEST(${events.security_result}) as events__security_result ON  ARRAY_LENGTH(${events__security_result.category_details}) > 0;;
      # sql: LEFT JOIN UNNEST(${events.security_result}) as events__security_result ON ${events__security_result.about__resource__name} IS NOT NULL;;
      relationship: one_to_many
    }

    join: events__security_result_for__category_details {
      view_label: "Events: Security Result For Category Details"
      sql: LEFT JOIN UNNEST(${events.security_result}) as events__security_result_for__category_details ON  ARRAY_LENGTH(${events__security_result_for__category_details.category_details}) > 0;;
      relationship: one_to_many
    }
    join: events__security_result_for__about_resource_name {
      view_label: "Events: Security Result For About Resource Name"
      # sql: LEFT JOIN UNNEST(${events.security_result}) as events__security_result ON  ARRAY_LENGTH(${events__security_result.category_details}) > 0;;
      sql: LEFT JOIN UNNEST(${events.security_result}) as events__security_result_for__about_resource_name ON ${events__security_result_for__about_resource_name.about__resource__name} IS NOT NULL;;
      relationship: one_to_many
    }
    join: events__target__asset__ip {
      view_label: "Events: Target Asset Ip"
      sql: LEFT JOIN UNNEST(${events.target__asset__ip}) as events__target__asset__ip ;;
      relationship: one_to_many
    }
    join: events__principal__nat_ip {
      view_label: "Events: Principal Nat Ip"
      sql: LEFT JOIN UNNEST(${events.principal__nat_ip}) as events__principal__nat_ip ;;
      relationship: one_to_many
    }
    join: events__src__asset__nat_ip {
      view_label: "Events: Src Asset Nat Ip"
      sql: LEFT JOIN UNNEST(${events.src__asset__nat_ip}) as events__src__asset__nat_ip ;;
      relationship: one_to_many
    }
    join: events__about__file__names {
      view_label: "Events: About File Names"
      sql: LEFT JOIN UNNEST(${events__about.file__names}) as events__about__file__names ;;
      relationship: one_to_many
    }
    join: events__about__labels {
      view_label: "Events: About Labels"
      sql: LEFT JOIN UNNEST(${events__about.labels}) as events__about__labels ;;
      relationship: one_to_many
    }
    join: events__about__labels__alert_type_name {
      view_label: "Events: About Labels Alert Type Name"
      sql: LEFT JOIN UNNEST(${events__about.labels}) as events__about__labels__alert_type_name ON ${events__about__labels__alert_type_name.key} = 'alertType_name' ;;
      fields: [events__about__labels__alert_type_name.value, events__about__labels__alert_type_name.cyber_severity, events__about__labels__alert_type_name.alert_type]
      relationship: one_to_many
    }
    join: events__about__labels__watchlist_id {
      view_label: "Events: About Labels Watchlist Id"
      sql: LEFT JOIN UNNEST(${events__about.labels}) as events__about__labels__watchlist_id ON ${events__about__labels__watchlist_id.key} = 'watchlistsMatchedByType_id' ;;
      fields: [events__about__labels__watchlist_id.value]
      relationship: one_to_many
    }
    join: events__about__labels__watchlist_name {
      view_label: "Events: About Labels Watchlist Name"
      sql: LEFT JOIN UNNEST(${events__about.labels}) as events__about__labels__watchlist_name ON ${events__about__labels__watchlist_name.key} = 'watchlistsMatchedByType_name' ;;
      fields: [events__about__labels__watchlist_name.value]
      relationship: one_to_many
    }
    join: events__intermediary__mac {
      view_label: "Events: Intermediary Mac"
      sql: LEFT JOIN UNNEST(${events__intermediary.mac}) as events__intermediary__mac ;;
      relationship: one_to_many
    }
    join: events__target__file__tags {
      view_label: "Events: Target File Tags"
      sql: LEFT JOIN UNNEST(${events.target__file__tags}) as events__target__file__tags ;;
      relationship: one_to_many
    }
    join: events__target__asset__mac {
      view_label: "Events: Target Asset Mac"
      sql: LEFT JOIN UNNEST(${events.target__asset__mac}) as events__target__asset__mac ;;
      relationship: one_to_many
    }
    join: events__network__email__cc {
      view_label: "Events: Network Email Cc"
      sql: LEFT JOIN UNNEST(${events.network__email__cc}) as events__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__observer__asset__ip {
      view_label: "Events: Observer Asset Ip"
      sql: LEFT JOIN UNNEST(${events.observer__asset__ip}) as events__observer__asset__ip ;;
      relationship: one_to_many
    }
    join: events__target__file__names {
      view_label: "Events: Target File Names"
      sql: LEFT JOIN UNNEST(${events.target__file__names}) as events__target__file__names ;;
      relationship: one_to_many
    }
    join: events__target__labels {
      view_label: "Events: Target Labels"
      sql: LEFT JOIN UNNEST(${events.target__labels}) as events__target__labels ;;
      relationship: one_to_many
    }
    join: events__target__labels_publisher_category_name {
      view_label: "Events: Target Labels Publisher Category Name"
      sql: LEFT JOIN UNNEST(${events.target__labels}) as events__target__labels_publisher_category_name ON ${events__target__labels_publisher_category_name.key} = 'publisherCategory_name' ;;
      fields: [events__target__labels_publisher_category_name.value]
      relationship: one_to_many
    }
    join: events__network__email__bcc {
      view_label: "Events: Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events.network__email__bcc}) as events__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__principal__asset__ip {
      view_label: "Events: Principal Asset Ip"
      sql: LEFT JOIN UNNEST(${events.principal__asset__ip}) as events__principal__asset__ip ;;
      relationship: one_to_many
    }
    join: events__observer__file__tags {
      view_label: "Events: Observer File Tags"
      sql: LEFT JOIN UNNEST(${events.observer__file__tags}) as events__observer__file__tags ;;
      relationship: one_to_many
    }
    join: events__observer__asset__mac {
      view_label: "Events: Observer Asset Mac"
      sql: LEFT JOIN UNNEST(${events.observer__asset__mac}) as events__observer__asset__mac ;;
      relationship: one_to_many
    }
    join: events__about__asset__nat_ip {
      view_label: "Events: About Asset Nat Ip"
      sql: LEFT JOIN UNNEST(${events__about.asset__nat_ip}) as events__about__asset__nat_ip ;;
      relationship: one_to_many
    }
    join: events__network__email__to {
      view_label: "Events: Network Email To"
      sql: LEFT JOIN UNNEST(${events.network__email__to}) as events__network__email__to ;;
      relationship: one_to_many
    }
    join: events__principal__file__tags {
      view_label: "Events: Principal File Tags"
      sql: LEFT JOIN UNNEST(${events.principal__file__tags}) as events__principal__file__tags ;;
      relationship: one_to_many
    }
    join: events__principal__asset__mac {
      view_label: "Events: Principal Asset Mac"
      sql: LEFT JOIN UNNEST(${events.principal__asset__mac}) as events__principal__asset__mac ;;
      relationship: one_to_many
    }
    join: events__observer__file__names {
      view_label: "Events: Observer File Names"
      sql: LEFT JOIN UNNEST(${events.observer__file__names}) as events__observer__file__names ;;
      relationship: one_to_many
    }
    join: events__observer__labels {
      view_label: "Events: Observer Labels"
      sql: LEFT JOIN UNNEST(${events.observer__labels}) as events__observer__labels ;;
      relationship: one_to_many
    }
    join: events__src__user__department {
      view_label: "Events: Src User Department"
      sql: LEFT JOIN UNNEST(${events.src__user__department}) as events__src__user__department ;;
      relationship: one_to_many
    }
    join: events__intermediary__nat_ip {
      view_label: "Events: Intermediary Nat Ip"
      sql: LEFT JOIN UNNEST(${events__intermediary.nat_ip}) as events__intermediary__nat_ip ;;
      relationship: one_to_many
    }
    join: events__target__asset__nat_ip {
      view_label: "Events: Target Asset Nat Ip"
      sql: LEFT JOIN UNNEST(${events.target__asset__nat_ip}) as events__target__asset__nat_ip ;;
      relationship: one_to_many
    }
    join: events__principal__file__names {
      view_label: "Events: Principal File Names"
      sql: LEFT JOIN UNNEST(${events.principal__file__names}) as events__principal__file__names ;;
      relationship: one_to_many
    }
    join: events__principal__labels {
      view_label: "Events: Principal Labels"
      sql: LEFT JOIN UNNEST(${events.principal__labels}) as events__principal__labels ;;
      relationship: one_to_many
    }
    join: events__src__network__email__cc {
      view_label: "Events: Src Network Email Cc"
      sql: LEFT JOIN UNNEST(${events.src__network__email__cc}) as events__src__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__src__ip_location {
      view_label: "Events: Src Ip Location"
      sql: LEFT JOIN UNNEST(${events.src__ip_location}) as events__src__ip_location ;;
      relationship: one_to_many
    }
    join: events__src__asset__labels {
      view_label: "Events: Src Asset Labels"
      sql: LEFT JOIN UNNEST(${events.src__asset__labels}) as events__src__asset__labels ;;
      relationship: one_to_many
    }
    join: events__network__smtp__rcpt_to {
      view_label: "Events: Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events.network__smtp__rcpt_to}) as events__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__observer__asset__nat_ip {
      view_label: "Events: Observer Asset Nat Ip"
      sql: LEFT JOIN UNNEST(${events.observer__asset__nat_ip}) as events__observer__asset__nat_ip ;;
      relationship: one_to_many
    }
    join: events__src__network__email__bcc {
      view_label: "Events: Src Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events.src__network__email__bcc}) as events__src__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__src__file__embedded_ips {
      view_label: "Events: Src File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events.src__file__embedded_ips}) as events__src__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: week_trend_table {
      type: left_outer
      sql_on: ${events__security_result__new_category_details.events__security_result__new_category_details} = ${week_trend_table.topic} ;;
      relationship: many_to_one
    }
    join: alert_source {
      type: left_outer
      sql_on: ${alert_source.alert_source_id} = ${events.metadata__id} ;;
      relationship: one_to_one
    }
    join: alerts_by_source {
      type: left_outer
      sql_on: ${events.metadata__id} = ${alerts_by_source.alert_by_source_id} ;;
      relationship: one_to_one
    }
    join: watchlist_name{
      type: left_outer
      sql_on: ${events.metadata__id} = ${watchlist_name.watchlist_name_metadata_id} ;;
      relationship: one_to_one
    }
    join: company_name{
      type: left_outer
      sql_on: ${events.metadata__id} = ${company_name.company_name_metadata_id} ;;
      relationship: one_to_one
    }
    join: company_name_null{
      type: left_outer
      sql_on: ${events.metadata__id} = ${company_name_null.company_name_metadata_id} ;;
      relationship: one_to_many
    }
    join: selectedTopics {
      type: left_outer
      sql_on: ${selectedTopics.metadata__id_derived} = ${events.metadata__id} ;;
      relationship: one_to_many
    }
    join: company_derived {
      type: left_outer
      sql_on: ${company_derived.metadata__id_derived} = ${events.metadata__id} ;;
      relationship: one_to_many
    }
    join: occurrence_trend{
      type: left_outer
      sql_on: ${events.metadata__id} = ${occurrence_trend.occurrence_trend_metadata_id} ;;
      relationship: one_to_many
    }
    join: events__src__process__file__tags {
      view_label: "Events: Src Process File Tags"
      sql: LEFT JOIN UNNEST(${events.src__process__file__tags}) as events__src__process__file__tags ;;
      relationship: one_to_many
    }
    join: events__additional__fields {
      view_label: "Events: Additional Fields"
      sql: LEFT JOIN UNNEST(${events.additional__fields}) as events__additional__fields ;;
      relationship: one_to_many
    }
    join: events__about__user__department {
      view_label: "Events: About User Department"
      sql: LEFT JOIN UNNEST(${events__about.user__department}) as events__about__user__department ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__ip {
      view_label: "Events: Intermediary Asset Ip"
      sql: LEFT JOIN UNNEST(${events__intermediary.asset__ip}) as events__intermediary__asset__ip ;;
      relationship: one_to_many
    }
    join: events__network__email__subject {
      view_label: "Events: Network Email Subject"
      sql: LEFT JOIN UNNEST(${events.network__email__subject}) as events__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__principal__asset__nat_ip {
      view_label: "Events: Principal Asset Nat Ip"
      sql: LEFT JOIN UNNEST(${events.principal__asset__nat_ip}) as events__principal__asset__nat_ip ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact {
      view_label: "Events: Src Ip Geo Artifact"
      sql: LEFT JOIN UNNEST(${events.src__ip_geo_artifact}) as events__src__ip_geo_artifact ;;
      relationship: one_to_many
    }
    join: events__src__network__email__to {
      view_label: "Events: Src Network Email To"
      sql: LEFT JOIN UNNEST(${events.src__network__email__to}) as events__src__network__email__to ;;
      relationship: one_to_many
    }
    join: events__src__file__embedded_urls {
      view_label: "Events: Src File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events.src__file__embedded_urls}) as events__src__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__src__process__file__names {
      view_label: "Events: Src Process File Names"
      sql: LEFT JOIN UNNEST(${events.src__process__file__names}) as events__src__process__file__names ;;
      relationship: one_to_many
    }
    join: events__src__domain__name_server {
      view_label: "Events: Src Domain Name Server"
      sql: LEFT JOIN UNNEST(${events.src__domain__name_server}) as events__src__domain__name_server ;;
      relationship: one_to_many
    }
    join: events__src__asset__hardware {
      view_label: "Events: Src Asset Hardware"
      sql: LEFT JOIN UNNEST(${events.src__asset__hardware}) as events__src__asset__hardware ;;
      relationship: one_to_many
    }
    join: events__src__user__phone_numbers {
      view_label: "Events: Src User Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.src__user__phone_numbers}) as events__src__user__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__about__network__email__cc {
      view_label: "Events: About Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__about.network__email__cc}) as events__about__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__about__ip_location {
      view_label: "Events: About Ip Location"
      sql: LEFT JOIN UNNEST(${events__about.ip_location}) as events__about__ip_location ;;
      relationship: one_to_many
    }
    join: events__about__asset__labels {
      view_label: "Events: About Asset Labels"
      sql: LEFT JOIN UNNEST(${events__about.asset__labels}) as events__about__asset__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__tags {
      view_label: "Events: Intermediary File Tags"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__tags}) as events__intermediary__file__tags ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__mac {
      view_label: "Events: Intermediary Asset Mac"
      sql: LEFT JOIN UNNEST(${events__intermediary.asset__mac}) as events__intermediary__asset__mac ;;
      relationship: one_to_many
    }
    join: events__security_result__action {
      view_label: "Events: Security Result Action"
      sql: LEFT JOIN UNNEST(${events__security_result.action}) as events__security_result__action ;;
      relationship: one_to_many
    }
    join: events__target__user__department {
      view_label: "Events: Target User Department"
      sql: LEFT JOIN UNNEST(${events.target__user__department}) as events__target__user__department ;;
      relationship: one_to_many
    }
    join: events__metadata__tags__tenant_id {
      view_label: "Events: Metadata Tags Tenant Id"
      sql: LEFT JOIN UNNEST(${events.metadata__tags__tenant_id}) as events__metadata__tags__tenant_id ;;
      relationship: one_to_many
    }
    join: events__src__asset__software {
      view_label: "Events: Src Asset Software"
      sql: LEFT JOIN UNNEST(${events.src__asset__software}) as events__src__asset__software ;;
      relationship: one_to_many
    }
    join: events__about__network__email__bcc {
      view_label: "Events: About Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__about.network__email__bcc}) as events__about__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__about__file__embedded_ips {
      view_label: "Events: About File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__about.file__embedded_ips}) as events__about__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__about__process__file__tags {
      view_label: "Events: About Process File Tags"
      sql: LEFT JOIN UNNEST(${events__about.process__file__tags}) as events__about__process__file__tags ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__names {
      view_label: "Events: Intermediary File Names"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__names}) as events__intermediary__file__names ;;
      relationship: one_to_many
    }
    join: events__intermediary__labels {
      view_label: "Events: Intermediary Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.labels}) as events__intermediary__labels ;;
      relationship: one_to_many
    }
    join: events__target__network__email__cc {
      view_label: "Events: Target Network Email Cc"
      sql: LEFT JOIN UNNEST(${events.target__network__email__cc}) as events__target__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__target__ip_location {
      view_label: "Events: Target Ip Location"
      sql: LEFT JOIN UNNEST(${events.target__ip_location}) as events__target__ip_location ;;
      relationship: one_to_many
    }
    join: events__target__asset__labels {
      view_label: "Events: Target Asset Labels"
      sql: LEFT JOIN UNNEST(${events.target__asset__labels}) as events__target__asset__labels ;;
      relationship: one_to_many
    }
    join: events__network__dns__answers {
      view_label: "Events: Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events.network__dns__answers}) as events__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__observer__user__department {
      view_label: "Events: Observer User Department"
      sql: LEFT JOIN UNNEST(${events.observer__user__department}) as events__observer__user__department ;;
      relationship: one_to_many
    }
    join: events__src__network__smtp__rcpt_to {
      view_label: "Events: Src Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events.src__network__smtp__rcpt_to}) as events__src__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__src__user__email_addresses {
      view_label: "Events: Src User Email Addresses"
      sql: LEFT JOIN UNNEST(${events.src__user__email_addresses}) as events__src__user__email_addresses ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact {
      view_label: "Events: About Ip Geo Artifact"
      sql: LEFT JOIN UNNEST(${events__about.ip_geo_artifact}) as events__about__ip_geo_artifact ;;
      relationship: one_to_many
    }
    join: events__about__network__email__to {
      view_label: "Events: About Network Email To"
      sql: LEFT JOIN UNNEST(${events__about.network__email__to}) as events__about__network__email__to ;;
      relationship: one_to_many
    }
    join: events__about__file__embedded_urls {
      view_label: "Events: About File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__about.file__embedded_urls}) as events__about__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__about__process__file__names {
      view_label: "Events: About Process File Names"
      sql: LEFT JOIN UNNEST(${events__about.process__file__names}) as events__about__process__file__names ;;
      relationship: one_to_many
    }
    join: events__about__domain__name_server {
      view_label: "Events: About Domain Name Server"
      sql: LEFT JOIN UNNEST(${events__about.domain__name_server}) as events__about__domain__name_server ;;
      relationship: one_to_many
    }
    join: events__about__asset__hardware {
      view_label: "Events: About Asset Hardware"
      sql: LEFT JOIN UNNEST(${events__about.asset__hardware}) as events__about__asset__hardware ;;
      relationship: one_to_many
    }
    join: events__about__user__phone_numbers {
      view_label: "Events: About User Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__about.user__phone_numbers}) as events__about__user__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip {
      view_label: "Events: Security Result About Ip"
      sql: LEFT JOIN UNNEST(${events__security_result.about__ip}) as events__security_result__about__ip ;;
      relationship: one_to_many
    }
    join: events__security_result__category {
      view_label: "Events: Security Result Category"
      sql: LEFT JOIN UNNEST(${events__security_result.category}) as events__security_result__category ;;
      relationship: one_to_many
    }
    join: events__target__network__email__bcc {
      view_label: "Events: Target Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events.target__network__email__bcc}) as events__target__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__target__file__embedded_ips {
      view_label: "Events: Target File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events.target__file__embedded_ips}) as events__target__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__target__process__file__tags {
      view_label: "Events: Target Process File Tags"
      sql: LEFT JOIN UNNEST(${events.target__process__file__tags}) as events__target__process__file__tags ;;
      relationship: one_to_many
    }
    join: events__principal__user__department {
      view_label: "Events: Principal User Department"
      sql: LEFT JOIN UNNEST(${events.principal__user__department}) as events__principal__user__department ;;
      relationship: one_to_many
    }
    join: events__observer__network__email__cc {
      view_label: "Events: Observer Network Email Cc"
      sql: LEFT JOIN UNNEST(${events.observer__network__email__cc}) as events__observer__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__observer__ip_location {
      view_label: "Events: Observer Ip Location"
      sql: LEFT JOIN UNNEST(${events.observer__ip_location}) as events__observer__ip_location ;;
      relationship: one_to_many
    }
    join: events__observer__asset__labels {
      view_label: "Events: Observer Asset Labels"
      sql: LEFT JOIN UNNEST(${events.observer__asset__labels}) as events__observer__asset__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__auth__mechanism {
      view_label: "Events: Extensions Auth Mechanism"
      sql: LEFT JOIN UNNEST(${events.extensions__auth__mechanism}) as events__extensions__auth__mechanism ;;
      relationship: one_to_many
    }
    join: events__src__network__email__subject {
      view_label: "Events: Src Network Email Subject"
      sql: LEFT JOIN UNNEST(${events.src__network__email__subject}) as events__src__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__src__file__embedded_domains {
      view_label: "Events: Src File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events.src__file__embedded_domains}) as events__src__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__src__resource_ancestors {
      view_label: "Events: Src Resource Ancestors"
      sql: LEFT JOIN UNNEST(${events.src__resource_ancestors}) as events__src__resource_ancestors ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors {
      view_label: "Events: Src Process Ancestors"
      sql: LEFT JOIN UNNEST(${events.src__process_ancestors}) as events__src__process_ancestors ;;
      relationship: one_to_many
    }
    join: events__about__asset__software {
      view_label: "Events: About Asset Software"
      sql: LEFT JOIN UNNEST(${events__about.asset__software}) as events__about__asset__software ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__nat_ip {
      view_label: "Events: Intermediary Asset Nat Ip"
      sql: LEFT JOIN UNNEST(${events__intermediary.asset__nat_ip}) as events__intermediary__asset__nat_ip ;;
      relationship: one_to_many
    }
    join: events__security_result__about__mac {
      view_label: "Events: Security Result About Mac"
      sql: LEFT JOIN UNNEST(${events__security_result.about__mac}) as events__security_result__about__mac ;;
      relationship: one_to_many
    }
    join: events__security_result__campaigns {
      view_label: "Events: Security Result Campaigns"
      sql: LEFT JOIN UNNEST(${events__security_result.campaigns}) as events__security_result__campaigns ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact {
      view_label: "Events: Target Ip Geo Artifact"
      sql: LEFT JOIN UNNEST(${events.target__ip_geo_artifact}) as events__target__ip_geo_artifact ;;
      relationship: one_to_many
    }
    join: events__target__network__email__to {
      view_label: "Events: Target Network Email To"
      sql: LEFT JOIN UNNEST(${events.target__network__email__to}) as events__target__network__email__to ;;
      relationship: one_to_many
    }
    join: events__target__file__embedded_urls {
      view_label: "Events: Target File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events.target__file__embedded_urls}) as events__target__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__target__process__file__names {
      view_label: "Events: Target Process File Names"
      sql: LEFT JOIN UNNEST(${events.target__process__file__names}) as events__target__process__file__names ;;
      relationship: one_to_many
    }
    join: events__target__domain__name_server {
      view_label: "Events: Target Domain Name Server"
      sql: LEFT JOIN UNNEST(${events.target__domain__name_server}) as events__target__domain__name_server ;;
      relationship: one_to_many
    }
    join: events__target__asset__hardware {
      view_label: "Events: Target Asset Hardware"
      sql: LEFT JOIN UNNEST(${events.target__asset__hardware}) as events__target__asset__hardware ;;
      relationship: one_to_many
    }
    join: events__target__user__phone_numbers {
      view_label: "Events: Target User Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.target__user__phone_numbers}) as events__target__user__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__network__dns__authority {
      view_label: "Events: Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events.network__dns__authority}) as events__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__network__dhcp__options {
      view_label: "Events: Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events.network__dhcp__options}) as events__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__principal__network__email__cc {
      view_label: "Events: Principal Network Email Cc"
      sql: LEFT JOIN UNNEST(${events.principal__network__email__cc}) as events__principal__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__principal__ip_location {
      view_label: "Events: Principal Ip Location"
      sql: LEFT JOIN UNNEST(${events.principal__ip_location}) as events__principal__ip_location ;;
      relationship: one_to_many
    }
    join: events__principal__asset__labels {
      view_label: "Events: Principal Asset Labels"
      sql: LEFT JOIN UNNEST(${events.principal__asset__labels}) as events__principal__asset__labels ;;
      relationship: one_to_many
    }
    join: events__observer__network__email__bcc {
      view_label: "Events: Observer Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events.observer__network__email__bcc}) as events__observer__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__observer__file__embedded_ips {
      view_label: "Events: Observer File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events.observer__file__embedded_ips}) as events__observer__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__tags {
      view_label: "Events: Observer Process File Tags"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__tags}) as events__observer__process__file__tags ;;
      relationship: one_to_many
    }
    join: events__src__file__capabilities_tags {
      view_label: "Events: Src File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events.src__file__capabilities_tags}) as events__src__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__src__security_result__action {
      view_label: "Events: Src Security Result Action"
      sql: LEFT JOIN UNNEST(${events.src__security_result__action}) as events__src__security_result__action ;;
      relationship: one_to_many
    }
    join: events__src__domain__tech__department {
      view_label: "Events: Src Domain Tech Department"
      sql: LEFT JOIN UNNEST(${events.src__domain__tech__department}) as events__src__domain__tech__department ;;
      relationship: one_to_many
    }
    join: events__src__domain__zone__department {
      view_label: "Events: Src Domain Zone Department"
      sql: LEFT JOIN UNNEST(${events.src__domain__zone__department}) as events__src__domain__zone__department ;;
      relationship: one_to_many
    }
    join: events__src__investigation__comments {
      view_label: "Events: Src Investigation Comments"
      sql: LEFT JOIN UNNEST(${events.src__investigation__comments}) as events__src__investigation__comments ;;
      relationship: one_to_many
    }
    join: events__src__user__group_identifiers {
      view_label: "Events: Src User Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.src__user__group_identifiers}) as events__src__user__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__about__network__smtp__rcpt_to {
      view_label: "Events: About Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__about.network__smtp__rcpt_to}) as events__about__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__about__user__email_addresses {
      view_label: "Events: About User Email Addresses"
      sql: LEFT JOIN UNNEST(${events__about.user__email_addresses}) as events__about__user__email_addresses ;;
      relationship: one_to_many
    }
    join: events__target__asset__software {
      view_label: "Events: Target Asset Software"
      sql: LEFT JOIN UNNEST(${events.target__asset__software}) as events__target__asset__software ;;
      relationship: one_to_many
    }
    join: events__network__dns__additional {
      view_label: "Events: Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events.network__dns__additional}) as events__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__network__dns__questions {
      view_label: "Events: Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events.network__dns__questions}) as events__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__principal__network__email__bcc {
      view_label: "Events: Principal Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events.principal__network__email__bcc}) as events__principal__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__principal__file__embedded_ips {
      view_label: "Events: Principal File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events.principal__file__embedded_ips}) as events__principal__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__tags {
      view_label: "Events: Principal Process File Tags"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__tags}) as events__principal__process__file__tags ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact {
      view_label: "Events: Observer Ip Geo Artifact"
      sql: LEFT JOIN UNNEST(${events.observer__ip_geo_artifact}) as events__observer__ip_geo_artifact ;;
      relationship: one_to_many
    }
    join: events__observer__network__email__to {
      view_label: "Events: Observer Network Email To"
      sql: LEFT JOIN UNNEST(${events.observer__network__email__to}) as events__observer__network__email__to ;;
      relationship: one_to_many
    }
    join: events__observer__file__embedded_urls {
      view_label: "Events: Observer File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events.observer__file__embedded_urls}) as events__observer__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__names {
      view_label: "Events: Observer Process File Names"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__names}) as events__observer__process__file__names ;;
      relationship: one_to_many
    }
    join: events__observer__domain__name_server {
      view_label: "Events: Observer Domain Name Server"
      sql: LEFT JOIN UNNEST(${events.observer__domain__name_server}) as events__observer__domain__name_server ;;
      relationship: one_to_many
    }
    join: events__observer__asset__hardware {
      view_label: "Events: Observer Asset Hardware"
      sql: LEFT JOIN UNNEST(${events.observer__asset__hardware}) as events__observer__asset__hardware ;;
      relationship: one_to_many
    }
    join: events__observer__user__phone_numbers {
      view_label: "Events: Observer User Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.observer__user__phone_numbers}) as events__observer__user__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__src__network__dns__answers {
      view_label: "Events: Src Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events.src__network__dns__answers}) as events__src__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__src__group__email_addresses {
      view_label: "Events: Src Group Email Addresses"
      sql: LEFT JOIN UNNEST(${events.src__group__email_addresses}) as events__src__group__email_addresses ;;
      relationship: one_to_many
    }
    join: events__src__security_result {
      view_label: "Events: Src Security Result"
      sql: LEFT JOIN UNNEST(${events.src__security_result}) as events__src__security_result ;;
      relationship: one_to_many
    }
    join: events__src__domain__admin__department {
      view_label: "Events: Src Domain Admin Department"
      sql: LEFT JOIN UNNEST(${events.src__domain__admin__department}) as events__src__domain__admin__department ;;
      relationship: one_to_many
    }
    join: events__about__network__email__subject {
      view_label: "Events: About Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__about.network__email__subject}) as events__about__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__about__file__embedded_domains {
      view_label: "Events: About File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__about.file__embedded_domains}) as events__about__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__about__resource_ancestors {
      view_label: "Events: About Resource Ancestors"
      sql: LEFT JOIN UNNEST(${events__about.resource_ancestors}) as events__about__resource_ancestors ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors {
      view_label: "Events: About Process Ancestors"
      sql: LEFT JOIN UNNEST(${events__about.process_ancestors}) as events__about__process_ancestors ;;
      relationship: one_to_many
    }
    join: events__target__network__smtp__rcpt_to {
      view_label: "Events: Target Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events.target__network__smtp__rcpt_to}) as events__target__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__target__user__email_addresses {
      view_label: "Events: Target User Email Addresses"
      sql: LEFT JOIN UNNEST(${events.target__user__email_addresses}) as events__target__user__email_addresses ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact {
      view_label: "Events: Principal Ip Geo Artifact"
      sql: LEFT JOIN UNNEST(${events.principal__ip_geo_artifact}) as events__principal__ip_geo_artifact ;;
      relationship: one_to_many
    }
    join: events__principal__network__email__to {
      view_label: "Events: Principal Network Email To"
      sql: LEFT JOIN UNNEST(${events.principal__network__email__to}) as events__principal__network__email__to ;;
      relationship: one_to_many
    }
    join: events__principal__file__embedded_urls {
      view_label: "Events: Principal File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events.principal__file__embedded_urls}) as events__principal__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__names {
      view_label: "Events: Principal Process File Names"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__names}) as events__principal__process__file__names ;;
      relationship: one_to_many
    }
    join: events__principal__domain__name_server {
      view_label: "Events: Principal Domain Name Server"
      sql: LEFT JOIN UNNEST(${events.principal__domain__name_server}) as events__principal__domain__name_server ;;
      relationship: one_to_many
    }
    join: events__principal__asset__hardware {
      view_label: "Events: Principal Asset Hardware"
      sql: LEFT JOIN UNNEST(${events.principal__asset__hardware}) as events__principal__asset__hardware ;;
      relationship: one_to_many
    }
    join: events__principal__user__phone_numbers {
      view_label: "Events: Principal User Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.principal__user__phone_numbers}) as events__principal__user__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__observer__asset__software {
      view_label: "Events: Observer Asset Software"
      sql: LEFT JOIN UNNEST(${events.observer__asset__software}) as events__observer__asset__software ;;
      relationship: one_to_many
    }
    join: events__src__security_result__category {
      view_label: "Events: Src Security Result Category"
      sql: LEFT JOIN UNNEST(${events__src__security_result.category}) as events__src__security_result__category ;;
      relationship: one_to_many
    }
    join: events__about__file__capabilities_tags {
      view_label: "Events: About File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__about.file__capabilities_tags}) as events__about__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__about__security_result__action {
      view_label: "Events: About Security Result Action"
      sql: LEFT JOIN UNNEST(${events__about.security_result__action}) as events__about__security_result__action ;;
      relationship: one_to_many
    }
    join: events__about__domain__tech__department {
      view_label: "Events: About Domain Tech Department"
      sql: LEFT JOIN UNNEST(${events__about.domain__tech__department}) as events__about__domain__tech__department ;;
      relationship: one_to_many
    }
    join: events__about__domain__zone__department {
      view_label: "Events: About Domain Zone Department"
      sql: LEFT JOIN UNNEST(${events__about.domain__zone__department}) as events__about__domain__zone__department ;;
      relationship: one_to_many
    }
    join: events__about__investigation__comments {
      view_label: "Events: About Investigation Comments"
      sql: LEFT JOIN UNNEST(${events__about.investigation__comments}) as events__about__investigation__comments ;;
      relationship: one_to_many
    }
    join: events__about__user__group_identifiers {
      view_label: "Events: About User Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__about.user__group_identifiers}) as events__about__user__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__intermediary__user__department {
      view_label: "Events: Intermediary User Department"
      sql: LEFT JOIN UNNEST(${events__intermediary.user__department}) as events__intermediary__user__department ;;
      relationship: one_to_many
    }
    join: events__security_result__about__nat_ip {
      view_label: "Events: Security Result About Nat Ip"
      sql: LEFT JOIN UNNEST(${events__security_result.about__nat_ip}) as events__security_result__about__nat_ip ;;
      relationship: one_to_many
    }
    join: events__security_result__outcomes {
      view_label: "Events: Security Result Outcomes"
      sql: LEFT JOIN UNNEST(${events__security_result.outcomes}) as events__security_result__outcomes ;;
      relationship: one_to_many
    }
    join: events__target__network__email__subject {
      view_label: "Events: Target Network Email Subject"
      sql: LEFT JOIN UNNEST(${events.target__network__email__subject}) as events__target__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__target__file__embedded_domains {
      view_label: "Events: Target File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events.target__file__embedded_domains}) as events__target__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__target__resource_ancestors {
      view_label: "Events: Target Resource Ancestors"
      sql: LEFT JOIN UNNEST(${events.target__resource_ancestors}) as events__target__resource_ancestors ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors {
      view_label: "Events: Target Process Ancestors"
      sql: LEFT JOIN UNNEST(${events.target__process_ancestors}) as events__target__process_ancestors ;;
      relationship: one_to_many
    }
    join: events__network__smtp__server_response {
      view_label: "Events: Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events.network__smtp__server_response}) as events__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__principal__asset__software {
      view_label: "Events: Principal Asset Software"
      sql: LEFT JOIN UNNEST(${events.principal__asset__software}) as events__principal__asset__software ;;
      relationship: one_to_many
    }
    join: events__observer__network__smtp__rcpt_to {
      view_label: "Events: Observer Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events.observer__network__smtp__rcpt_to}) as events__observer__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__observer__user__email_addresses {
      view_label: "Events: Observer User Email Addresses"
      sql: LEFT JOIN UNNEST(${events.observer__user__email_addresses}) as events__observer__user__email_addresses ;;
      relationship: one_to_many
    }
    join: events__metadata__ingestion_labels {
      view_label: "Events: Metadata Ingestion Labels"
      sql: LEFT JOIN UNNEST(${events.metadata__ingestion_labels}) as events__metadata__ingestion_labels ;;
      relationship: one_to_many
    }
    join: events__src__network__dns__authority {
      view_label: "Events: Src Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events.src__network__dns__authority}) as events__src__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__src__network__dhcp__options {
      view_label: "Events: Src Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events.src__network__dhcp__options}) as events__src__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__email__cc {
      view_label: "Events: Src Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__email__cc}) as events__src__artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__section {
      view_label: "Events: Src File Pe File Section"
      sql: LEFT JOIN UNNEST(${events.src__file__pe_file__section}) as events__src__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__src__process__file__embedded_ips {
      view_label: "Events: Src Process File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events.src__process__file__embedded_ips}) as events__src__process__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__src__security_result__campaigns {
      view_label: "Events: Src Security Result Campaigns"
      sql: LEFT JOIN UNNEST(${events__src__security_result.campaigns}) as events__src__security_result__campaigns ;;
      relationship: one_to_many
    }
    join: events__src__domain__tech__phone_numbers {
      view_label: "Events: Src Domain Tech Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.src__domain__tech__phone_numbers}) as events__src__domain__tech__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__src__domain__billing__department {
      view_label: "Events: Src Domain Billing Department"
      sql: LEFT JOIN UNNEST(${events.src__domain__billing__department}) as events__src__domain__billing__department ;;
      relationship: one_to_many
    }
    join: events__src__domain__zone__phone_numbers {
      view_label: "Events: Src Domain Zone Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.src__domain__zone__phone_numbers}) as events__src__domain__zone__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__src__user__time_off {
      view_label: "Events: Src User Time Off"
      sql: LEFT JOIN UNNEST(${events.src__user__time_off}) as events__src__user__time_off ;;
      relationship: one_to_many
    }
    join: events__src__user__attribute__roles {
      view_label: "Events: Src User Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__user__attribute__roles}) as events__src__user__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__user__attribute__labels {
      view_label: "Events: Src User Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__user__attribute__labels}) as events__src__user__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__network__dns__answers {
      view_label: "Events: About Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__about.network__dns__answers}) as events__about__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__about__group__email_addresses {
      view_label: "Events: About Group Email Addresses"
      sql: LEFT JOIN UNNEST(${events__about.group__email_addresses}) as events__about__group__email_addresses ;;
      relationship: one_to_many
    }
    join: events__about__security_result {
      view_label: "Events: About Security Result"
      sql: LEFT JOIN UNNEST(${events__about.security_result}) as events__about__security_result ;;
      relationship: one_to_many
    }
    join: events__about__domain__admin__department {
      view_label: "Events: About Domain Admin Department"
      sql: LEFT JOIN UNNEST(${events__about.domain__admin__department}) as events__about__domain__admin__department ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__email__cc {
      view_label: "Events: Intermediary Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__email__cc}) as events__intermediary__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_location {
      view_label: "Events: Intermediary Ip Location"
      sql: LEFT JOIN UNNEST(${events__intermediary.ip_location}) as events__intermediary__ip_location ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__labels {
      view_label: "Events: Intermediary Asset Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.asset__labels}) as events__intermediary__asset__labels ;;
      relationship: one_to_many
    }
    join: events__target__file__capabilities_tags {
      view_label: "Events: Target File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events.target__file__capabilities_tags}) as events__target__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__target__security_result__action {
      view_label: "Events: Target Security Result Action"
      sql: LEFT JOIN UNNEST(${events.target__security_result__action}) as events__target__security_result__action ;;
      relationship: one_to_many
    }
    join: events__target__domain__tech__department {
      view_label: "Events: Target Domain Tech Department"
      sql: LEFT JOIN UNNEST(${events.target__domain__tech__department}) as events__target__domain__tech__department ;;
      relationship: one_to_many
    }
    join: events__target__domain__zone__department {
      view_label: "Events: Target Domain Zone Department"
      sql: LEFT JOIN UNNEST(${events.target__domain__zone__department}) as events__target__domain__zone__department ;;
      relationship: one_to_many
    }
    join: events__target__investigation__comments {
      view_label: "Events: Target Investigation Comments"
      sql: LEFT JOIN UNNEST(${events.target__investigation__comments}) as events__target__investigation__comments ;;
      relationship: one_to_many
    }
    join: events__target__user__group_identifiers {
      view_label: "Events: Target User Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.target__user__group_identifiers}) as events__target__user__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__principal__network__smtp__rcpt_to {
      view_label: "Events: Principal Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events.principal__network__smtp__rcpt_to}) as events__principal__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__principal__user__email_addresses {
      view_label: "Events: Principal User Email Addresses"
      sql: LEFT JOIN UNNEST(${events.principal__user__email_addresses}) as events__principal__user__email_addresses ;;
      relationship: one_to_many
    }
    join: events__observer__network__email__subject {
      view_label: "Events: Observer Network Email Subject"
      sql: LEFT JOIN UNNEST(${events.observer__network__email__subject}) as events__observer__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__observer__file__embedded_domains {
      view_label: "Events: Observer File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events.observer__file__embedded_domains}) as events__observer__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__observer__resource_ancestors {
      view_label: "Events: Observer Resource Ancestors"
      sql: LEFT JOIN UNNEST(${events.observer__resource_ancestors}) as events__observer__resource_ancestors ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors {
      view_label: "Events: Observer Process Ancestors"
      sql: LEFT JOIN UNNEST(${events.observer__process_ancestors}) as events__observer__process_ancestors ;;
      relationship: one_to_many
    }
    join: events__metadata__base_labels__log_types {
      view_label: "Events: Metadata Base Labels Log Types"
      sql: LEFT JOIN UNNEST(${events.metadata__base_labels__log_types}) as events__metadata__base_labels__log_types ;;
      relationship: one_to_many
    }
    join: events__src__network__dns__additional {
      view_label: "Events: Src Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events.src__network__dns__additional}) as events__src__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__src__network__dns__questions {
      view_label: "Events: Src Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events.src__network__dns__questions}) as events__src__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__email__bcc {
      view_label: "Events: Src Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__email__bcc}) as events__src__artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__src__process__file__embedded_urls {
      view_label: "Events: Src Process File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events.src__process__file__embedded_urls}) as events__src__process__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__src__domain__admin__phone_numbers {
      view_label: "Events: Src Domain Admin Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.src__domain__admin__phone_numbers}) as events__src__domain__admin__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__src__asset__vulnerabilities {
      view_label: "Events: Src Asset Vulnerabilities"
      sql: LEFT JOIN UNNEST(${events.src__asset__vulnerabilities}) as events__src__asset__vulnerabilities ;;
      relationship: one_to_many
    }
    join: events__src__asset__attribute__roles {
      view_label: "Events: Src Asset Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__asset__attribute__roles}) as events__src__asset__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__asset__attribute__labels {
      view_label: "Events: Src Asset Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__asset__attribute__labels}) as events__src__asset__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__security_result__category {
      view_label: "Events: About Security Result Category"
      sql: LEFT JOIN UNNEST(${events__about__security_result.category}) as events__about__security_result__category ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__email__bcc {
      view_label: "Events: Intermediary Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__email__bcc}) as events__intermediary__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__embedded_ips {
      view_label: "Events: Intermediary File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__embedded_ips}) as events__intermediary__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__tags {
      view_label: "Events: Intermediary Process File Tags"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__tags}) as events__intermediary__process__file__tags ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__ip {
      view_label: "Events: Security Result About Asset Ip"
      sql: LEFT JOIN UNNEST(${events__security_result.about__asset__ip}) as events__security_result__about__asset__ip ;;
      relationship: one_to_many
    }
    join: events__target__network__dns__answers {
      view_label: "Events: Target Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events.target__network__dns__answers}) as events__target__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__target__group__email_addresses {
      view_label: "Events: Target Group Email Addresses"
      sql: LEFT JOIN UNNEST(${events.target__group__email_addresses}) as events__target__group__email_addresses ;;
      relationship: one_to_many
    }
    join: events__target__security_result {
      view_label: "Events: Target Security Result"
      sql: LEFT JOIN UNNEST(${events.target__security_result}) as events__target__security_result ;;
      relationship: one_to_many
    }
    join: events__target__domain__admin__department {
      view_label: "Events: Target Domain Admin Department"
      sql: LEFT JOIN UNNEST(${events.target__domain__admin__department}) as events__target__domain__admin__department ;;
      relationship: one_to_many
    }
    join: events__principal__network__email__subject {
      view_label: "Events: Principal Network Email Subject"
      sql: LEFT JOIN UNNEST(${events.principal__network__email__subject}) as events__principal__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__principal__file__embedded_domains {
      view_label: "Events: Principal File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events.principal__file__embedded_domains}) as events__principal__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__principal__resource_ancestors {
      view_label: "Events: Principal Resource Ancestors"
      sql: LEFT JOIN UNNEST(${events.principal__resource_ancestors}) as events__principal__resource_ancestors ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors {
      view_label: "Events: Principal Process Ancestors"
      sql: LEFT JOIN UNNEST(${events.principal__process_ancestors}) as events__principal__process_ancestors ;;
      relationship: one_to_many
    }
    join: events__observer__file__capabilities_tags {
      view_label: "Events: Observer File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events.observer__file__capabilities_tags}) as events__observer__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__action {
      view_label: "Events: Observer Security Result Action"
      sql: LEFT JOIN UNNEST(${events.observer__security_result__action}) as events__observer__security_result__action ;;
      relationship: one_to_many
    }
    join: events__observer__domain__tech__department {
      view_label: "Events: Observer Domain Tech Department"
      sql: LEFT JOIN UNNEST(${events.observer__domain__tech__department}) as events__observer__domain__tech__department ;;
      relationship: one_to_many
    }
    join: events__observer__domain__zone__department {
      view_label: "Events: Observer Domain Zone Department"
      sql: LEFT JOIN UNNEST(${events.observer__domain__zone__department}) as events__observer__domain__zone__department ;;
      relationship: one_to_many
    }
    join: events__observer__investigation__comments {
      view_label: "Events: Observer Investigation Comments"
      sql: LEFT JOIN UNNEST(${events.observer__investigation__comments}) as events__observer__investigation__comments ;;
      relationship: one_to_many
    }
    join: events__observer__user__group_identifiers {
      view_label: "Events: Observer User Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.observer__user__group_identifiers}) as events__observer__user__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__metadata__base_labels__namespaces {
      view_label: "Events: Metadata Base Labels Namespaces"
      sql: LEFT JOIN UNNEST(${events.metadata__base_labels__namespaces}) as events__metadata__base_labels__namespaces ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__email__to {
      view_label: "Events: Src Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__email__to}) as events__src__artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__src__user_management_chain {
      view_label: "Events: Src User Management Chain"
      sql: LEFT JOIN UNNEST(${events.src__user_management_chain}) as events__src__user_management_chain ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__tags {
      view_label: "Events: Src Process Ancestors File Tags"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__tags}) as events__src__process_ancestors__file__tags ;;
      relationship: one_to_many
    }
    join: events__src__domain__tech__email_addresses {
      view_label: "Events: Src Domain Tech Email Addresses"
      sql: LEFT JOIN UNNEST(${events.src__domain__tech__email_addresses}) as events__src__domain__tech__email_addresses ;;
      relationship: one_to_many
    }
    join: events__src__domain__zone__email_addresses {
      view_label: "Events: Src Domain Zone Email Addresses"
      sql: LEFT JOIN UNNEST(${events.src__domain__zone__email_addresses}) as events__src__domain__zone__email_addresses ;;
      relationship: one_to_many
    }
    join: events__about__network__dns__authority {
      view_label: "Events: About Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__about.network__dns__authority}) as events__about__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__about__network__dhcp__options {
      view_label: "Events: About Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__about.network__dhcp__options}) as events__about__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__email__cc {
      view_label: "Events: About Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__email__cc}) as events__about__artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__section {
      view_label: "Events: About File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__about.file__pe_file__section}) as events__about__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__about__process__file__embedded_ips {
      view_label: "Events: About Process File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__about.process__file__embedded_ips}) as events__about__process__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__about__security_result__campaigns {
      view_label: "Events: About Security Result Campaigns"
      sql: LEFT JOIN UNNEST(${events__about__security_result.campaigns}) as events__about__security_result__campaigns ;;
      relationship: one_to_many
    }
    join: events__about__domain__tech__phone_numbers {
      view_label: "Events: About Domain Tech Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__about.domain__tech__phone_numbers}) as events__about__domain__tech__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__about__domain__billing__department {
      view_label: "Events: About Domain Billing Department"
      sql: LEFT JOIN UNNEST(${events__about.domain__billing__department}) as events__about__domain__billing__department ;;
      relationship: one_to_many
    }
    join: events__about__domain__zone__phone_numbers {
      view_label: "Events: About Domain Zone Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__about.domain__zone__phone_numbers}) as events__about__domain__zone__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__about__user__time_off {
      view_label: "Events: About User Time Off"
      sql: LEFT JOIN UNNEST(${events__about.user__time_off}) as events__about__user__time_off ;;
      relationship: one_to_many
    }
    join: events__about__user__attribute__roles {
      view_label: "Events: About User Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.user__attribute__roles}) as events__about__user__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__user__attribute__labels {
      view_label: "Events: About User Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.user__attribute__labels}) as events__about__user__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact {
      view_label: "Events: Intermediary Ip Geo Artifact"
      sql: LEFT JOIN UNNEST(${events__intermediary.ip_geo_artifact}) as events__intermediary__ip_geo_artifact ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__email__to {
      view_label: "Events: Intermediary Network Email To"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__email__to}) as events__intermediary__network__email__to ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__embedded_urls {
      view_label: "Events: Intermediary File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__embedded_urls}) as events__intermediary__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__names {
      view_label: "Events: Intermediary Process File Names"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__names}) as events__intermediary__process__file__names ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__name_server {
      view_label: "Events: Intermediary Domain Name Server"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__name_server}) as events__intermediary__domain__name_server ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__hardware {
      view_label: "Events: Intermediary Asset Hardware"
      sql: LEFT JOIN UNNEST(${events__intermediary.asset__hardware}) as events__intermediary__asset__hardware ;;
      relationship: one_to_many
    }
    join: events__intermediary__user__phone_numbers {
      view_label: "Events: Intermediary User Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__intermediary.user__phone_numbers}) as events__intermediary__user__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__security_result__associations {
      view_label: "Events: Security Result Associations"
      sql: LEFT JOIN UNNEST(${events__security_result.associations}) as events__security_result__associations ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__tags {
      view_label: "Events: Security Result About File Tags"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__tags}) as events__security_result__about__file__tags ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__mac {
      view_label: "Events: Security Result About Asset Mac"
      sql: LEFT JOIN UNNEST(${events__security_result.about__asset__mac}) as events__security_result__about__asset__mac ;;
      relationship: one_to_many
    }
    join: events__security_result__rule_labels {
      view_label: "Events: Security Result Rule Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.rule_labels}) as events__security_result__rule_labels ;;
      relationship: one_to_many
    }
    join: events__target__security_result__category {
      view_label: "Events: Target Security Result Category"
      sql: LEFT JOIN UNNEST(${events__target__security_result.category}) as events__target__security_result__category ;;
      relationship: one_to_many
    }
    join: events__principal__file__capabilities_tags {
      view_label: "Events: Principal File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events.principal__file__capabilities_tags}) as events__principal__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__action {
      view_label: "Events: Principal Security Result Action"
      sql: LEFT JOIN UNNEST(${events.principal__security_result__action}) as events__principal__security_result__action ;;
      relationship: one_to_many
    }
    join: events__principal__domain__tech__department {
      view_label: "Events: Principal Domain Tech Department"
      sql: LEFT JOIN UNNEST(${events.principal__domain__tech__department}) as events__principal__domain__tech__department ;;
      relationship: one_to_many
    }
    join: events__principal__domain__zone__department {
      view_label: "Events: Principal Domain Zone Department"
      sql: LEFT JOIN UNNEST(${events.principal__domain__zone__department}) as events__principal__domain__zone__department ;;
      relationship: one_to_many
    }
    join: events__principal__investigation__comments {
      view_label: "Events: Principal Investigation Comments"
      sql: LEFT JOIN UNNEST(${events.principal__investigation__comments}) as events__principal__investigation__comments ;;
      relationship: one_to_many
    }
    join: events__principal__user__group_identifiers {
      view_label: "Events: Principal User Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.principal__user__group_identifiers}) as events__principal__user__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__observer__network__dns__answers {
      view_label: "Events: Observer Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events.observer__network__dns__answers}) as events__observer__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__observer__group__email_addresses {
      view_label: "Events: Observer Group Email Addresses"
      sql: LEFT JOIN UNNEST(${events.observer__group__email_addresses}) as events__observer__group__email_addresses ;;
      relationship: one_to_many
    }
    join: events__observer__security_result {
      view_label: "Events: Observer Security Result"
      sql: LEFT JOIN UNNEST(${events.observer__security_result}) as events__observer__security_result ;;
      relationship: one_to_many
    }
    join: events__observer__domain__admin__department {
      view_label: "Events: Observer Domain Admin Department"
      sql: LEFT JOIN UNNEST(${events.observer__domain__admin__department}) as events__observer__domain__admin__department ;;
      relationship: one_to_many
    }
    join: events__src__network__smtp__server_response {
      view_label: "Events: Src Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events.src__network__smtp__server_response}) as events__src__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__imports {
      view_label: "Events: Src File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events.src__file__pe_file__imports}) as events__src__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__src__group__attribute__roles {
      view_label: "Events: Src Group Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__group__attribute__roles}) as events__src__group__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__group__attribute__labels {
      view_label: "Events: Src Group Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__group__attribute__labels}) as events__src__group__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__process__command_line_history {
      view_label: "Events: Src Process Command Line History"
      sql: LEFT JOIN UNNEST(${events.src__process__command_line_history}) as events__src__process__command_line_history ;;
      relationship: one_to_many
    }
    join: events__src__security_result__outcomes {
      view_label: "Events: Src Security Result Outcomes"
      sql: LEFT JOIN UNNEST(${events__src__security_result.outcomes}) as events__src__security_result__outcomes ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__names {
      view_label: "Events: Src Process Ancestors File Names"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__names}) as events__src__process_ancestors__file__names ;;
      relationship: one_to_many
    }
    join: events__src__domain__admin__email_addresses {
      view_label: "Events: Src Domain Admin Email Addresses"
      sql: LEFT JOIN UNNEST(${events.src__domain__admin__email_addresses}) as events__src__domain__admin__email_addresses ;;
      relationship: one_to_many
    }
    join: events__src__domain__billing__phone_numbers {
      view_label: "Events: Src Domain Billing Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.src__domain__billing__phone_numbers}) as events__src__domain__billing__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__src__domain__registrant__department {
      view_label: "Events: Src Domain Registrant Department"
      sql: LEFT JOIN UNNEST(${events.src__domain__registrant__department}) as events__src__domain__registrant__department ;;
      relationship: one_to_many
    }
    join: events__about__network__dns__additional {
      view_label: "Events: About Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__about.network__dns__additional}) as events__about__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__about__network__dns__questions {
      view_label: "Events: About Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__about.network__dns__questions}) as events__about__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__email__bcc {
      view_label: "Events: About Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__email__bcc}) as events__about__artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__about__process__file__embedded_urls {
      view_label: "Events: About Process File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__about.process__file__embedded_urls}) as events__about__process__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__about__domain__admin__phone_numbers {
      view_label: "Events: About Domain Admin Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__about.domain__admin__phone_numbers}) as events__about__domain__admin__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__about__asset__vulnerabilities {
      view_label: "Events: About Asset Vulnerabilities"
      sql: LEFT JOIN UNNEST(${events__about.asset__vulnerabilities}) as events__about__asset__vulnerabilities ;;
      relationship: one_to_many
    }
    join: events__about__asset__attribute__roles {
      view_label: "Events: About Asset Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.asset__attribute__roles}) as events__about__asset__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__asset__attribute__labels {
      view_label: "Events: About Asset Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.asset__attribute__labels}) as events__about__asset__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__software {
      view_label: "Events: Intermediary Asset Software"
      sql: LEFT JOIN UNNEST(${events__intermediary.asset__software}) as events__intermediary__asset__software ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__names {
      view_label: "Events: Security Result About File Names"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__names}) as events__security_result__about__file__names ;;
      relationship: one_to_many
    }
    join: events__security_result__about__labels {
      view_label: "Events: Security Result About Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__labels}) as events__security_result__about__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__category_details {
      view_label: "Events: Security Result Category Details"
      sql: LEFT JOIN UNNEST(${events__security_result.category_details}) as events__security_result__category_details ;;
      relationship: one_to_many
    }
    join: events__security_result__new_category_details {
      view_label: "Events: Security Result New Category Details"
      sql: LEFT JOIN UNNEST(${events__security_result_for__category_details.category_details}) as events__security_result__new_category_details ;;
      relationship: one_to_many
    }

    join: events__security_result__verdict_info {
      view_label: "Events: Security Result Verdict Info"
      sql: LEFT JOIN UNNEST(${events__security_result.verdict_info}) as events__security_result__verdict_info ;;
      relationship: one_to_many
    }
    join: events__target__network__dns__authority {
      view_label: "Events: Target Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events.target__network__dns__authority}) as events__target__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__target__network__dhcp__options {
      view_label: "Events: Target Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events.target__network__dhcp__options}) as events__target__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__email__cc {
      view_label: "Events: Target Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__email__cc}) as events__target__artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__section {
      view_label: "Events: Target File Pe File Section"
      sql: LEFT JOIN UNNEST(${events.target__file__pe_file__section}) as events__target__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__target__process__file__embedded_ips {
      view_label: "Events: Target Process File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events.target__process__file__embedded_ips}) as events__target__process__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__target__security_result__campaigns {
      view_label: "Events: Target Security Result Campaigns"
      sql: LEFT JOIN UNNEST(${events__target__security_result.campaigns}) as events__target__security_result__campaigns ;;
      relationship: one_to_many
    }
    join: events__target__domain__tech__phone_numbers {
      view_label: "Events: Target Domain Tech Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.target__domain__tech__phone_numbers}) as events__target__domain__tech__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__target__domain__billing__department {
      view_label: "Events: Target Domain Billing Department"
      sql: LEFT JOIN UNNEST(${events.target__domain__billing__department}) as events__target__domain__billing__department ;;
      relationship: one_to_many
    }
    join: events__target__domain__zone__phone_numbers {
      view_label: "Events: Target Domain Zone Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.target__domain__zone__phone_numbers}) as events__target__domain__zone__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__target__user__time_off {
      view_label: "Events: Target User Time Off"
      sql: LEFT JOIN UNNEST(${events.target__user__time_off}) as events__target__user__time_off ;;
      relationship: one_to_many
    }
    join: events__target__user__attribute__roles {
      view_label: "Events: Target User Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__user__attribute__roles}) as events__target__user__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__user__attribute__labels {
      view_label: "Events: Target User Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__user__attribute__labels}) as events__target__user__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__network__dns__answers {
      view_label: "Events: Principal Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events.principal__network__dns__answers}) as events__principal__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__principal__group__email_addresses {
      view_label: "Events: Principal Group Email Addresses"
      sql: LEFT JOIN UNNEST(${events.principal__group__email_addresses}) as events__principal__group__email_addresses ;;
      relationship: one_to_many
    }
    join: events__principal__security_result {
      view_label: "Events: Principal Security Result"
      sql: LEFT JOIN UNNEST(${events.principal__security_result}) as events__principal__security_result ;;
      relationship: one_to_many
    }
    join: events__principal__domain__admin__department {
      view_label: "Events: Principal Domain Admin Department"
      sql: LEFT JOIN UNNEST(${events.principal__domain__admin__department}) as events__principal__domain__admin__department ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__category {
      view_label: "Events: Observer Security Result Category"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.category}) as events__observer__security_result__category ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__smtp__rcpt_to {
      view_label: "Events: Src Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__smtp__rcpt_to}) as events__src__artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__resource {
      view_label: "Events: Src File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events.src__file__pe_file__resource}) as events__src__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__src__process__file__embedded_domains {
      view_label: "Events: Src Process File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events.src__process__file__embedded_domains}) as events__src__process__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__src__resource__attribute__roles {
      view_label: "Events: Src Resource Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__resource__attribute__roles}) as events__src__resource__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__resource__attribute__labels {
      view_label: "Events: Src Resource Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__resource__attribute__labels}) as events__src__resource__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__domain__tech__group_identifiers {
      view_label: "Events: Src Domain Tech Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.src__domain__tech__group_identifiers}) as events__src__domain__tech__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__src__domain__zone__group_identifiers {
      view_label: "Events: Src Domain Zone Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.src__domain__zone__group_identifiers}) as events__src__domain__zone__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__email__to {
      view_label: "Events: About Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__email__to}) as events__about__artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__about__user_management_chain {
      view_label: "Events: About User Management Chain"
      sql: LEFT JOIN UNNEST(${events__about.user_management_chain}) as events__about__user_management_chain ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__tags {
      view_label: "Events: About Process Ancestors File Tags"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__tags}) as events__about__process_ancestors__file__tags ;;
      relationship: one_to_many
    }
    join: events__about__domain__tech__email_addresses {
      view_label: "Events: About Domain Tech Email Addresses"
      sql: LEFT JOIN UNNEST(${events__about.domain__tech__email_addresses}) as events__about__domain__tech__email_addresses ;;
      relationship: one_to_many
    }
    join: events__about__domain__zone__email_addresses {
      view_label: "Events: About Domain Zone Email Addresses"
      sql: LEFT JOIN UNNEST(${events__about.domain__zone__email_addresses}) as events__about__domain__zone__email_addresses ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__smtp__rcpt_to {
      view_label: "Events: Intermediary Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__smtp__rcpt_to}) as events__intermediary__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__intermediary__user__email_addresses {
      view_label: "Events: Intermediary User Email Addresses"
      sql: LEFT JOIN UNNEST(${events__intermediary.user__email_addresses}) as events__intermediary__user__email_addresses ;;
      relationship: one_to_many
    }
    join: events__target__network__dns__additional {
      view_label: "Events: Target Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events.target__network__dns__additional}) as events__target__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__target__network__dns__questions {
      view_label: "Events: Target Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events.target__network__dns__questions}) as events__target__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__email__bcc {
      view_label: "Events: Target Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__email__bcc}) as events__target__artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__target__process__file__embedded_urls {
      view_label: "Events: Target Process File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events.target__process__file__embedded_urls}) as events__target__process__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__target__domain__admin__phone_numbers {
      view_label: "Events: Target Domain Admin Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.target__domain__admin__phone_numbers}) as events__target__domain__admin__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__target__asset__vulnerabilities {
      view_label: "Events: Target Asset Vulnerabilities"
      sql: LEFT JOIN UNNEST(${events.target__asset__vulnerabilities}) as events__target__asset__vulnerabilities ;;
      relationship: one_to_many
    }
    join: events__target__asset__attribute__roles {
      view_label: "Events: Target Asset Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__asset__attribute__roles}) as events__target__asset__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__asset__attribute__labels {
      view_label: "Events: Target Asset Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__asset__attribute__labels}) as events__target__asset__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__category {
      view_label: "Events: Principal Security Result Category"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.category}) as events__principal__security_result__category ;;
      relationship: one_to_many
    }
    join: events__observer__network__dns__authority {
      view_label: "Events: Observer Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events.observer__network__dns__authority}) as events__observer__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__observer__network__dhcp__options {
      view_label: "Events: Observer Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events.observer__network__dhcp__options}) as events__observer__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__email__cc {
      view_label: "Events: Observer Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__email__cc}) as events__observer__artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__section {
      view_label: "Events: Observer File Pe File Section"
      sql: LEFT JOIN UNNEST(${events.observer__file__pe_file__section}) as events__observer__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__embedded_ips {
      view_label: "Events: Observer Process File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__embedded_ips}) as events__observer__process__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__campaigns {
      view_label: "Events: Observer Security Result Campaigns"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.campaigns}) as events__observer__security_result__campaigns ;;
      relationship: one_to_many
    }
    join: events__observer__domain__tech__phone_numbers {
      view_label: "Events: Observer Domain Tech Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.observer__domain__tech__phone_numbers}) as events__observer__domain__tech__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__observer__domain__billing__department {
      view_label: "Events: Observer Domain Billing Department"
      sql: LEFT JOIN UNNEST(${events.observer__domain__billing__department}) as events__observer__domain__billing__department ;;
      relationship: one_to_many
    }
    join: events__observer__domain__zone__phone_numbers {
      view_label: "Events: Observer Domain Zone Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.observer__domain__zone__phone_numbers}) as events__observer__domain__zone__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__observer__user__time_off {
      view_label: "Events: Observer User Time Off"
      sql: LEFT JOIN UNNEST(${events.observer__user__time_off}) as events__observer__user__time_off ;;
      relationship: one_to_many
    }
    join: events__observer__user__attribute__roles {
      view_label: "Events: Observer User Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__user__attribute__roles}) as events__observer__user__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__user__attribute__labels {
      view_label: "Events: Observer User Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__user__attribute__labels}) as events__observer__user__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__metadata__tags__data_tap_config_name {
      view_label: "Events: Metadata Tags Data Tap Config Name"
      sql: LEFT JOIN UNNEST(${events.metadata__tags__data_tap_config_name}) as events__metadata__tags__data_tap_config_name ;;
      relationship: one_to_many
    }
    join: events__metadata__base_labels__custom_labels {
      view_label: "Events: Metadata Base Labels Custom Labels"
      sql: LEFT JOIN UNNEST(${events.metadata__base_labels__custom_labels}) as events__metadata__base_labels__custom_labels ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__email__subject {
      view_label: "Events: Src Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__email__subject}) as events__src__artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__src__cloud__vpc__attribute__roles {
      view_label: "Events: Src Cloud Vpc Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__cloud__vpc__attribute__roles}) as events__src__cloud__vpc__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__cloud__vpc__attribute__labels {
      view_label: "Events: Src Cloud Vpc Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__cloud__vpc__attribute__labels}) as events__src__cloud__vpc__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__imports__functions {
      view_label: "Events: Src File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__src__file__pe_file__imports.functions}) as events__src__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__src__process__file__capabilities_tags {
      view_label: "Events: Src Process File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events.src__process__file__capabilities_tags}) as events__src__process__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__src__domain__admin__group_identifiers {
      view_label: "Events: Src Domain Admin Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.src__domain__admin__group_identifiers}) as events__src__domain__admin__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__src__domain__billing__email_addresses {
      view_label: "Events: Src Domain Billing Email Addresses"
      sql: LEFT JOIN UNNEST(${events.src__domain__billing__email_addresses}) as events__src__domain__billing__email_addresses ;;
      relationship: one_to_many
    }
    join: events__about__network__smtp__server_response {
      view_label: "Events: About Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__about.network__smtp__server_response}) as events__about__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__imports {
      view_label: "Events: About File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__about.file__pe_file__imports}) as events__about__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__about__group__attribute__roles {
      view_label: "Events: About Group Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.group__attribute__roles}) as events__about__group__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__group__attribute__labels {
      view_label: "Events: About Group Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.group__attribute__labels}) as events__about__group__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__process__command_line_history {
      view_label: "Events: About Process Command Line History"
      sql: LEFT JOIN UNNEST(${events__about.process__command_line_history}) as events__about__process__command_line_history ;;
      relationship: one_to_many
    }
    join: events__about__security_result__outcomes {
      view_label: "Events: About Security Result Outcomes"
      sql: LEFT JOIN UNNEST(${events__about__security_result.outcomes}) as events__about__security_result__outcomes ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__names {
      view_label: "Events: About Process Ancestors File Names"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__names}) as events__about__process_ancestors__file__names ;;
      relationship: one_to_many
    }
    join: events__about__domain__admin__email_addresses {
      view_label: "Events: About Domain Admin Email Addresses"
      sql: LEFT JOIN UNNEST(${events__about.domain__admin__email_addresses}) as events__about__domain__admin__email_addresses ;;
      relationship: one_to_many
    }
    join: events__about__domain__billing__phone_numbers {
      view_label: "Events: About Domain Billing Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__about.domain__billing__phone_numbers}) as events__about__domain__billing__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__about__domain__registrant__department {
      view_label: "Events: About Domain Registrant Department"
      sql: LEFT JOIN UNNEST(${events__about.domain__registrant__department}) as events__about__domain__registrant__department ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__email__subject {
      view_label: "Events: Intermediary Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__email__subject}) as events__intermediary__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__embedded_domains {
      view_label: "Events: Intermediary File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__embedded_domains}) as events__intermediary__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__intermediary__resource_ancestors {
      view_label: "Events: Intermediary Resource Ancestors"
      sql: LEFT JOIN UNNEST(${events__intermediary.resource_ancestors}) as events__intermediary__resource_ancestors ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors {
      view_label: "Events: Intermediary Process Ancestors"
      sql: LEFT JOIN UNNEST(${events__intermediary.process_ancestors}) as events__intermediary__process_ancestors ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__nat_ip {
      view_label: "Events: Security Result About Asset Nat Ip"
      sql: LEFT JOIN UNNEST(${events__security_result.about__asset__nat_ip}) as events__security_result__about__asset__nat_ip ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__email__to {
      view_label: "Events: Target Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__email__to}) as events__target__artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__target__user_management_chain {
      view_label: "Events: Target User Management Chain"
      sql: LEFT JOIN UNNEST(${events.target__user_management_chain}) as events__target__user_management_chain ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__tags {
      view_label: "Events: Target Process Ancestors File Tags"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__tags}) as events__target__process_ancestors__file__tags ;;
      relationship: one_to_many
    }
    join: events__target__domain__tech__email_addresses {
      view_label: "Events: Target Domain Tech Email Addresses"
      sql: LEFT JOIN UNNEST(${events.target__domain__tech__email_addresses}) as events__target__domain__tech__email_addresses ;;
      relationship: one_to_many
    }
    join: events__target__domain__zone__email_addresses {
      view_label: "Events: Target Domain Zone Email Addresses"
      sql: LEFT JOIN UNNEST(${events.target__domain__zone__email_addresses}) as events__target__domain__zone__email_addresses ;;
      relationship: one_to_many
    }
    join: events__principal__network__dns__authority {
      view_label: "Events: Principal Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events.principal__network__dns__authority}) as events__principal__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__principal__network__dhcp__options {
      view_label: "Events: Principal Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events.principal__network__dhcp__options}) as events__principal__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__email__cc {
      view_label: "Events: Principal Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__email__cc}) as events__principal__artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__section {
      view_label: "Events: Principal File Pe File Section"
      sql: LEFT JOIN UNNEST(${events.principal__file__pe_file__section}) as events__principal__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__embedded_ips {
      view_label: "Events: Principal Process File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__embedded_ips}) as events__principal__process__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__campaigns {
      view_label: "Events: Principal Security Result Campaigns"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.campaigns}) as events__principal__security_result__campaigns ;;
      relationship: one_to_many
    }
    join: events__principal__domain__tech__phone_numbers {
      view_label: "Events: Principal Domain Tech Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.principal__domain__tech__phone_numbers}) as events__principal__domain__tech__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__principal__domain__billing__department {
      view_label: "Events: Principal Domain Billing Department"
      sql: LEFT JOIN UNNEST(${events.principal__domain__billing__department}) as events__principal__domain__billing__department ;;
      relationship: one_to_many
    }
    join: events__principal__domain__zone__phone_numbers {
      view_label: "Events: Principal Domain Zone Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.principal__domain__zone__phone_numbers}) as events__principal__domain__zone__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__principal__user__time_off {
      view_label: "Events: Principal User Time Off"
      sql: LEFT JOIN UNNEST(${events.principal__user__time_off}) as events__principal__user__time_off ;;
      relationship: one_to_many
    }
    join: events__principal__user__attribute__roles {
      view_label: "Events: Principal User Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__user__attribute__roles}) as events__principal__user__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__user__attribute__labels {
      view_label: "Events: Principal User Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__user__attribute__labels}) as events__principal__user__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__network__dns__additional {
      view_label: "Events: Observer Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events.observer__network__dns__additional}) as events__observer__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__observer__network__dns__questions {
      view_label: "Events: Observer Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events.observer__network__dns__questions}) as events__observer__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__email__bcc {
      view_label: "Events: Observer Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__email__bcc}) as events__observer__artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__embedded_urls {
      view_label: "Events: Observer Process File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__embedded_urls}) as events__observer__process__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__observer__domain__admin__phone_numbers {
      view_label: "Events: Observer Domain Admin Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.observer__domain__admin__phone_numbers}) as events__observer__domain__admin__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__observer__asset__vulnerabilities {
      view_label: "Events: Observer Asset Vulnerabilities"
      sql: LEFT JOIN UNNEST(${events.observer__asset__vulnerabilities}) as events__observer__asset__vulnerabilities ;;
      relationship: one_to_many
    }
    join: events__observer__asset__attribute__roles {
      view_label: "Events: Observer Asset Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__asset__attribute__roles}) as events__observer__asset__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__asset__attribute__labels {
      view_label: "Events: Observer Asset Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__asset__attribute__labels}) as events__observer__asset__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__security_result__associations {
      view_label: "Events: Src Security Result Associations"
      sql: LEFT JOIN UNNEST(${events__src__security_result.associations}) as events__src__security_result__associations ;;
      relationship: one_to_many
    }
    join: events__src__security_result__rule_labels {
      view_label: "Events: Src Security Result Rule Labels"
      sql: LEFT JOIN UNNEST(${events__src__security_result.rule_labels}) as events__src__security_result__rule_labels ;;
      relationship: one_to_many
    }
    join: events__src__domain__registrant__phone_numbers {
      view_label: "Events: Src Domain Registrant Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.src__domain__registrant__phone_numbers}) as events__src__domain__registrant__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__src__asset__software__permissions {
      view_label: "Events: Src Asset Software Permissions"
      sql: LEFT JOIN UNNEST(${events__src__asset__software.permissions}) as events__src__asset__software__permissions ;;
      relationship: one_to_many
    }
    join: events__src__user__attribute__permissions {
      view_label: "Events: Src User Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__user__attribute__permissions}) as events__src__user__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__smtp__rcpt_to {
      view_label: "Events: About Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__smtp__rcpt_to}) as events__about__artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__resource {
      view_label: "Events: About File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__about.file__pe_file__resource}) as events__about__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__about__process__file__embedded_domains {
      view_label: "Events: About Process File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__about.process__file__embedded_domains}) as events__about__process__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__about__resource__attribute__roles {
      view_label: "Events: About Resource Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.resource__attribute__roles}) as events__about__resource__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__resource__attribute__labels {
      view_label: "Events: About Resource Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.resource__attribute__labels}) as events__about__resource__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__domain__tech__group_identifiers {
      view_label: "Events: About Domain Tech Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__about.domain__tech__group_identifiers}) as events__about__domain__tech__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__about__domain__zone__group_identifiers {
      view_label: "Events: About Domain Zone Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__about.domain__zone__group_identifiers}) as events__about__domain__zone__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__capabilities_tags {
      view_label: "Events: Intermediary File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__capabilities_tags}) as events__intermediary__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__action {
      view_label: "Events: Intermediary Security Result Action"
      sql: LEFT JOIN UNNEST(${events__intermediary.security_result__action}) as events__intermediary__security_result__action ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__tech__department {
      view_label: "Events: Intermediary Domain Tech Department"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__tech__department}) as events__intermediary__domain__tech__department ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__zone__department {
      view_label: "Events: Intermediary Domain Zone Department"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__zone__department}) as events__intermediary__domain__zone__department ;;
      relationship: one_to_many
    }
    join: events__intermediary__investigation__comments {
      view_label: "Events: Intermediary Investigation Comments"
      sql: LEFT JOIN UNNEST(${events__intermediary.investigation__comments}) as events__intermediary__investigation__comments ;;
      relationship: one_to_many
    }
    join: events__intermediary__user__group_identifiers {
      view_label: "Events: Intermediary User Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__intermediary.user__group_identifiers}) as events__intermediary__user__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__target__network__smtp__server_response {
      view_label: "Events: Target Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events.target__network__smtp__server_response}) as events__target__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__imports {
      view_label: "Events: Target File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events.target__file__pe_file__imports}) as events__target__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__target__group__attribute__roles {
      view_label: "Events: Target Group Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__group__attribute__roles}) as events__target__group__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__group__attribute__labels {
      view_label: "Events: Target Group Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__group__attribute__labels}) as events__target__group__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__process__command_line_history {
      view_label: "Events: Target Process Command Line History"
      sql: LEFT JOIN UNNEST(${events.target__process__command_line_history}) as events__target__process__command_line_history ;;
      relationship: one_to_many
    }
    join: events__target__security_result__outcomes {
      view_label: "Events: Target Security Result Outcomes"
      sql: LEFT JOIN UNNEST(${events__target__security_result.outcomes}) as events__target__security_result__outcomes ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__names {
      view_label: "Events: Target Process Ancestors File Names"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__names}) as events__target__process_ancestors__file__names ;;
      relationship: one_to_many
    }
    join: events__target__domain__admin__email_addresses {
      view_label: "Events: Target Domain Admin Email Addresses"
      sql: LEFT JOIN UNNEST(${events.target__domain__admin__email_addresses}) as events__target__domain__admin__email_addresses ;;
      relationship: one_to_many
    }
    join: events__target__domain__billing__phone_numbers {
      view_label: "Events: Target Domain Billing Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.target__domain__billing__phone_numbers}) as events__target__domain__billing__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__target__domain__registrant__department {
      view_label: "Events: Target Domain Registrant Department"
      sql: LEFT JOIN UNNEST(${events.target__domain__registrant__department}) as events__target__domain__registrant__department ;;
      relationship: one_to_many
    }
    join: events__principal__network__dns__additional {
      view_label: "Events: Principal Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events.principal__network__dns__additional}) as events__principal__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__principal__network__dns__questions {
      view_label: "Events: Principal Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events.principal__network__dns__questions}) as events__principal__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__email__bcc {
      view_label: "Events: Principal Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__email__bcc}) as events__principal__artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__embedded_urls {
      view_label: "Events: Principal Process File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__embedded_urls}) as events__principal__process__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__principal__domain__admin__phone_numbers {
      view_label: "Events: Principal Domain Admin Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.principal__domain__admin__phone_numbers}) as events__principal__domain__admin__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__principal__asset__vulnerabilities {
      view_label: "Events: Principal Asset Vulnerabilities"
      sql: LEFT JOIN UNNEST(${events.principal__asset__vulnerabilities}) as events__principal__asset__vulnerabilities ;;
      relationship: one_to_many
    }
    join: events__principal__asset__attribute__roles {
      view_label: "Events: Principal Asset Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__asset__attribute__roles}) as events__principal__asset__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__asset__attribute__labels {
      view_label: "Events: Principal Asset Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__asset__attribute__labels}) as events__principal__asset__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__email__to {
      view_label: "Events: Observer Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__email__to}) as events__observer__artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__observer__user_management_chain {
      view_label: "Events: Observer User Management Chain"
      sql: LEFT JOIN UNNEST(${events.observer__user_management_chain}) as events__observer__user_management_chain ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__tags {
      view_label: "Events: Observer Process Ancestors File Tags"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__tags}) as events__observer__process_ancestors__file__tags ;;
      relationship: one_to_many
    }
    join: events__observer__domain__tech__email_addresses {
      view_label: "Events: Observer Domain Tech Email Addresses"
      sql: LEFT JOIN UNNEST(${events.observer__domain__tech__email_addresses}) as events__observer__domain__tech__email_addresses ;;
      relationship: one_to_many
    }
    join: events__observer__domain__zone__email_addresses {
      view_label: "Events: Observer Domain Zone Email Addresses"
      sql: LEFT JOIN UNNEST(${events.observer__domain__zone__email_addresses}) as events__observer__domain__zone__email_addresses ;;
      relationship: one_to_many
    }
    join: events__metadata__enrichment_labels__log_types {
      view_label: "Events: Metadata Enrichment Labels Log Types"
      sql: LEFT JOIN UNNEST(${events.metadata__enrichment_labels__log_types}) as events__metadata__enrichment_labels__log_types ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__email__cc {
      view_label: "Events: Src Ip Geo Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__email__cc}) as events__src__ip_geo_artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__dns__answers {
      view_label: "Events: Src Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__dns__answers}) as events__src__artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__src__user_management_chain__department {
      view_label: "Events: Src User Management Chain Department"
      sql: LEFT JOIN UNNEST(${events__src__user_management_chain.department}) as events__src__user_management_chain__department ;;
      relationship: one_to_many
    }
    join: events__src__security_result__category_details {
      view_label: "Events: Src Security Result Category Details"
      sql: LEFT JOIN UNNEST(${events__src__security_result.category_details}) as events__src__security_result__category_details ;;
      relationship: one_to_many
    }
    join: events__src__security_result__verdict_info {
      view_label: "Events: Src Security Result Verdict Info"
      sql: LEFT JOIN UNNEST(${events__src__security_result.verdict_info}) as events__src__security_result__verdict_info ;;
      relationship: one_to_many
    }
    join: events__src__domain__tech__time_off {
      view_label: "Events: Src Domain Tech Time Off"
      sql: LEFT JOIN UNNEST(${events.src__domain__tech__time_off}) as events__src__domain__tech__time_off ;;
      relationship: one_to_many
    }
    join: events__src__domain__tech__attribute__roles {
      view_label: "Events: Src Domain Tech Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__domain__tech__attribute__roles}) as events__src__domain__tech__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__domain__tech__attribute__labels {
      view_label: "Events: Src Domain Tech Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__domain__tech__attribute__labels}) as events__src__domain__tech__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__domain__billing__group_identifiers {
      view_label: "Events: Src Domain Billing Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.src__domain__billing__group_identifiers}) as events__src__domain__billing__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__src__domain__zone__time_off {
      view_label: "Events: Src Domain Zone Time Off"
      sql: LEFT JOIN UNNEST(${events.src__domain__zone__time_off}) as events__src__domain__zone__time_off ;;
      relationship: one_to_many
    }
    join: events__src__domain__zone__attribute__roles {
      view_label: "Events: Src Domain Zone Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__domain__zone__attribute__roles}) as events__src__domain__zone__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__domain__zone__attribute__labels {
      view_label: "Events: Src Domain Zone Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__domain__zone__attribute__labels}) as events__src__domain__zone__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__asset__attribute__permissions {
      view_label: "Events: Src Asset Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__asset__attribute__permissions}) as events__src__asset__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__email__subject {
      view_label: "Events: About Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__email__subject}) as events__about__artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__about__cloud__vpc__attribute__roles {
      view_label: "Events: About Cloud Vpc Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.cloud__vpc__attribute__roles}) as events__about__cloud__vpc__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__cloud__vpc__attribute__labels {
      view_label: "Events: About Cloud Vpc Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.cloud__vpc__attribute__labels}) as events__about__cloud__vpc__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__imports__functions {
      view_label: "Events: About File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__about__file__pe_file__imports.functions}) as events__about__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__about__process__file__capabilities_tags {
      view_label: "Events: About Process File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__about.process__file__capabilities_tags}) as events__about__process__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__about__domain__admin__group_identifiers {
      view_label: "Events: About Domain Admin Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__about.domain__admin__group_identifiers}) as events__about__domain__admin__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__about__domain__billing__email_addresses {
      view_label: "Events: About Domain Billing Email Addresses"
      sql: LEFT JOIN UNNEST(${events__about.domain__billing__email_addresses}) as events__about__domain__billing__email_addresses ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__dns__answers {
      view_label: "Events: Intermediary Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__dns__answers}) as events__intermediary__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__intermediary__group__email_addresses {
      view_label: "Events: Intermediary Group Email Addresses"
      sql: LEFT JOIN UNNEST(${events__intermediary.group__email_addresses}) as events__intermediary__group__email_addresses ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result {
      view_label: "Events: Intermediary Security Result"
      sql: LEFT JOIN UNNEST(${events__intermediary.security_result}) as events__intermediary__security_result ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__admin__department {
      view_label: "Events: Intermediary Domain Admin Department"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__admin__department}) as events__intermediary__domain__admin__department ;;
      relationship: one_to_many
    }
    join: events__security_result__detection_fields {
      view_label: "Events: Security Result Detection Fields"
      sql: LEFT JOIN UNNEST(${events__security_result.detection_fields}) as events__security_result__detection_fields ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__smtp__rcpt_to {
      view_label: "Events: Target Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__smtp__rcpt_to}) as events__target__artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__resource {
      view_label: "Events: Target File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events.target__file__pe_file__resource}) as events__target__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__target__process__file__embedded_domains {
      view_label: "Events: Target Process File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events.target__process__file__embedded_domains}) as events__target__process__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__target__resource__attribute__roles {
      view_label: "Events: Target Resource Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__resource__attribute__roles}) as events__target__resource__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__resource__attribute__labels {
      view_label: "Events: Target Resource Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__resource__attribute__labels}) as events__target__resource__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__domain__tech__group_identifiers {
      view_label: "Events: Target Domain Tech Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.target__domain__tech__group_identifiers}) as events__target__domain__tech__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__target__domain__zone__group_identifiers {
      view_label: "Events: Target Domain Zone Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.target__domain__zone__group_identifiers}) as events__target__domain__zone__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__network__tls__client__supported_ciphers {
      view_label: "Events: Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events.network__tls__client__supported_ciphers}) as events__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__email__to {
      view_label: "Events: Principal Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__email__to}) as events__principal__artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__principal__user_management_chain {
      view_label: "Events: Principal User Management Chain"
      sql: LEFT JOIN UNNEST(${events.principal__user_management_chain}) as events__principal__user_management_chain ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__tags {
      view_label: "Events: Principal Process Ancestors File Tags"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__tags}) as events__principal__process_ancestors__file__tags ;;
      relationship: one_to_many
    }
    join: events__principal__domain__tech__email_addresses {
      view_label: "Events: Principal Domain Tech Email Addresses"
      sql: LEFT JOIN UNNEST(${events.principal__domain__tech__email_addresses}) as events__principal__domain__tech__email_addresses ;;
      relationship: one_to_many
    }
    join: events__principal__domain__zone__email_addresses {
      view_label: "Events: Principal Domain Zone Email Addresses"
      sql: LEFT JOIN UNNEST(${events.principal__domain__zone__email_addresses}) as events__principal__domain__zone__email_addresses ;;
      relationship: one_to_many
    }
    join: events__observer__network__smtp__server_response {
      view_label: "Events: Observer Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events.observer__network__smtp__server_response}) as events__observer__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__imports {
      view_label: "Events: Observer File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events.observer__file__pe_file__imports}) as events__observer__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__observer__group__attribute__roles {
      view_label: "Events: Observer Group Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__group__attribute__roles}) as events__observer__group__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__group__attribute__labels {
      view_label: "Events: Observer Group Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__group__attribute__labels}) as events__observer__group__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__process__command_line_history {
      view_label: "Events: Observer Process Command Line History"
      sql: LEFT JOIN UNNEST(${events.observer__process__command_line_history}) as events__observer__process__command_line_history ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__outcomes {
      view_label: "Events: Observer Security Result Outcomes"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.outcomes}) as events__observer__security_result__outcomes ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__names {
      view_label: "Events: Observer Process Ancestors File Names"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__names}) as events__observer__process_ancestors__file__names ;;
      relationship: one_to_many
    }
    join: events__observer__domain__admin__email_addresses {
      view_label: "Events: Observer Domain Admin Email Addresses"
      sql: LEFT JOIN UNNEST(${events.observer__domain__admin__email_addresses}) as events__observer__domain__admin__email_addresses ;;
      relationship: one_to_many
    }
    join: events__observer__domain__billing__phone_numbers {
      view_label: "Events: Observer Domain Billing Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.observer__domain__billing__phone_numbers}) as events__observer__domain__billing__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__observer__domain__registrant__department {
      view_label: "Events: Observer Domain Registrant Department"
      sql: LEFT JOIN UNNEST(${events.observer__domain__registrant__department}) as events__observer__domain__registrant__department ;;
      relationship: one_to_many
    }
    join: events__metadata__enrichment_labels__namespaces {
      view_label: "Events: Metadata Enrichment Labels Namespaces"
      sql: LEFT JOIN UNNEST(${events.metadata__enrichment_labels__namespaces}) as events__metadata__enrichment_labels__namespaces ;;
      relationship: one_to_many
    }
    join: events__metadata__base_labels__ingestion_labels {
      view_label: "Events: Metadata Base Labels Ingestion Labels"
      sql: LEFT JOIN UNNEST(${events.metadata__base_labels__ingestion_labels}) as events__metadata__base_labels__ingestion_labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities {
      view_label: "Events: Extensions Vulns Vulnerabilities"
      sql: LEFT JOIN UNNEST(${events.extensions__vulns__vulnerabilities}) as events__extensions__vulns__vulnerabilities ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__email__bcc {
      view_label: "Events: Src Ip Geo Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__email__bcc}) as events__src__ip_geo_artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__section {
      view_label: "Events: Src Process File Pe File Section"
      sql: LEFT JOIN UNNEST(${events.src__process__file__pe_file__section}) as events__src__process__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__src__domain__admin__time_off {
      view_label: "Events: Src Domain Admin Time Off"
      sql: LEFT JOIN UNNEST(${events.src__domain__admin__time_off}) as events__src__domain__admin__time_off ;;
      relationship: one_to_many
    }
    join: events__src__domain__admin__attribute__roles {
      view_label: "Events: Src Domain Admin Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__domain__admin__attribute__roles}) as events__src__domain__admin__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__domain__admin__attribute__labels {
      view_label: "Events: Src Domain Admin Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__domain__admin__attribute__labels}) as events__src__domain__admin__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__domain__registrant__email_addresses {
      view_label: "Events: Src Domain Registrant Email Addresses"
      sql: LEFT JOIN UNNEST(${events.src__domain__registrant__email_addresses}) as events__src__domain__registrant__email_addresses ;;
      relationship: one_to_many
    }
    join: events__about__security_result__associations {
      view_label: "Events: About Security Result Associations"
      sql: LEFT JOIN UNNEST(${events__about__security_result.associations}) as events__about__security_result__associations ;;
      relationship: one_to_many
    }
    join: events__about__security_result__rule_labels {
      view_label: "Events: About Security Result Rule Labels"
      sql: LEFT JOIN UNNEST(${events__about__security_result.rule_labels}) as events__about__security_result__rule_labels ;;
      relationship: one_to_many
    }
    join: events__about__domain__registrant__phone_numbers {
      view_label: "Events: About Domain Registrant Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__about.domain__registrant__phone_numbers}) as events__about__domain__registrant__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__about__asset__software__permissions {
      view_label: "Events: About Asset Software Permissions"
      sql: LEFT JOIN UNNEST(${events__about__asset__software.permissions}) as events__about__asset__software__permissions ;;
      relationship: one_to_many
    }
    join: events__about__user__attribute__permissions {
      view_label: "Events: About User Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.user__attribute__permissions}) as events__about__user__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__category {
      view_label: "Events: Intermediary Security Result Category"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.category}) as events__intermediary__security_result__category ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user__department {
      view_label: "Events: Security Result About User Department"
      sql: LEFT JOIN UNNEST(${events__security_result.about__user__department}) as events__security_result__about__user__department ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__email__subject {
      view_label: "Events: Target Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__email__subject}) as events__target__artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__target__cloud__vpc__attribute__roles {
      view_label: "Events: Target Cloud Vpc Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__cloud__vpc__attribute__roles}) as events__target__cloud__vpc__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__cloud__vpc__attribute__labels {
      view_label: "Events: Target Cloud Vpc Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__cloud__vpc__attribute__labels}) as events__target__cloud__vpc__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__imports__functions {
      view_label: "Events: Target File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__target__file__pe_file__imports.functions}) as events__target__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__target__process__file__capabilities_tags {
      view_label: "Events: Target Process File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events.target__process__file__capabilities_tags}) as events__target__process__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__target__domain__admin__group_identifiers {
      view_label: "Events: Target Domain Admin Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.target__domain__admin__group_identifiers}) as events__target__domain__admin__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__target__domain__billing__email_addresses {
      view_label: "Events: Target Domain Billing Email Addresses"
      sql: LEFT JOIN UNNEST(${events.target__domain__billing__email_addresses}) as events__target__domain__billing__email_addresses ;;
      relationship: one_to_many
    }
    join: events__principal__network__smtp__server_response {
      view_label: "Events: Principal Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events.principal__network__smtp__server_response}) as events__principal__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__imports {
      view_label: "Events: Principal File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events.principal__file__pe_file__imports}) as events__principal__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__principal__group__attribute__roles {
      view_label: "Events: Principal Group Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__group__attribute__roles}) as events__principal__group__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__group__attribute__labels {
      view_label: "Events: Principal Group Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__group__attribute__labels}) as events__principal__group__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__process__command_line_history {
      view_label: "Events: Principal Process Command Line History"
      sql: LEFT JOIN UNNEST(${events.principal__process__command_line_history}) as events__principal__process__command_line_history ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__outcomes {
      view_label: "Events: Principal Security Result Outcomes"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.outcomes}) as events__principal__security_result__outcomes ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__names {
      view_label: "Events: Principal Process Ancestors File Names"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__names}) as events__principal__process_ancestors__file__names ;;
      relationship: one_to_many
    }
    join: events__principal__domain__admin__email_addresses {
      view_label: "Events: Principal Domain Admin Email Addresses"
      sql: LEFT JOIN UNNEST(${events.principal__domain__admin__email_addresses}) as events__principal__domain__admin__email_addresses ;;
      relationship: one_to_many
    }
    join: events__principal__domain__billing__phone_numbers {
      view_label: "Events: Principal Domain Billing Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.principal__domain__billing__phone_numbers}) as events__principal__domain__billing__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__principal__domain__registrant__department {
      view_label: "Events: Principal Domain Registrant Department"
      sql: LEFT JOIN UNNEST(${events.principal__domain__registrant__department}) as events__principal__domain__registrant__department ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__smtp__rcpt_to {
      view_label: "Events: Observer Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__smtp__rcpt_to}) as events__observer__artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__resource {
      view_label: "Events: Observer File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events.observer__file__pe_file__resource}) as events__observer__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__embedded_domains {
      view_label: "Events: Observer Process File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__embedded_domains}) as events__observer__process__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__observer__resource__attribute__roles {
      view_label: "Events: Observer Resource Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__resource__attribute__roles}) as events__observer__resource__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__resource__attribute__labels {
      view_label: "Events: Observer Resource Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__resource__attribute__labels}) as events__observer__resource__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__domain__tech__group_identifiers {
      view_label: "Events: Observer Domain Tech Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.observer__domain__tech__group_identifiers}) as events__observer__domain__tech__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__observer__domain__zone__group_identifiers {
      view_label: "Events: Observer Domain Zone Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.observer__domain__zone__group_identifiers}) as events__observer__domain__zone__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__email__to {
      view_label: "Events: Src Ip Geo Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__email__to}) as events__src__ip_geo_artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__dns__authority {
      view_label: "Events: Src Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__dns__authority}) as events__src__artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__dhcp__options {
      view_label: "Events: Src Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__dhcp__options}) as events__src__artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__src__cloud__project__attribute__roles {
      view_label: "Events: Src Cloud Project Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__cloud__project__attribute__roles}) as events__src__cloud__project__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__cloud__project__attribute__labels {
      view_label: "Events: Src Cloud Project Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__cloud__project__attribute__labels}) as events__src__cloud__project__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__signature_info__signer {
      view_label: "Events: Src File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events.src__file__pe_file__signature_info__signer}) as events__src__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__src__group__attribute__permissions {
      view_label: "Events: Src Group Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__group__attribute__permissions}) as events__src__group__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__email__cc {
      view_label: "Events: About Ip Geo Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__email__cc}) as events__about__ip_geo_artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__dns__answers {
      view_label: "Events: About Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__dns__answers}) as events__about__artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__about__user_management_chain__department {
      view_label: "Events: About User Management Chain Department"
      sql: LEFT JOIN UNNEST(${events__about__user_management_chain.department}) as events__about__user_management_chain__department ;;
      relationship: one_to_many
    }
    join: events__about__security_result__category_details {
      view_label: "Events: About Security Result Category Details"
      sql: LEFT JOIN UNNEST(${events__about__security_result.category_details}) as events__about__security_result__category_details ;;
      relationship: one_to_many
    }
    join: events__about__security_result__verdict_info {
      view_label: "Events: About Security Result Verdict Info"
      sql: LEFT JOIN UNNEST(${events__about__security_result.verdict_info}) as events__about__security_result__verdict_info ;;
      relationship: one_to_many
    }
    join: events__about__domain__tech__time_off {
      view_label: "Events: About Domain Tech Time Off"
      sql: LEFT JOIN UNNEST(${events__about.domain__tech__time_off}) as events__about__domain__tech__time_off ;;
      relationship: one_to_many
    }
    join: events__about__domain__tech__attribute__roles {
      view_label: "Events: About Domain Tech Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.domain__tech__attribute__roles}) as events__about__domain__tech__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__domain__tech__attribute__labels {
      view_label: "Events: About Domain Tech Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.domain__tech__attribute__labels}) as events__about__domain__tech__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__domain__billing__group_identifiers {
      view_label: "Events: About Domain Billing Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__about.domain__billing__group_identifiers}) as events__about__domain__billing__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__about__domain__zone__time_off {
      view_label: "Events: About Domain Zone Time Off"
      sql: LEFT JOIN UNNEST(${events__about.domain__zone__time_off}) as events__about__domain__zone__time_off ;;
      relationship: one_to_many
    }
    join: events__about__domain__zone__attribute__roles {
      view_label: "Events: About Domain Zone Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.domain__zone__attribute__roles}) as events__about__domain__zone__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__domain__zone__attribute__labels {
      view_label: "Events: About Domain Zone Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.domain__zone__attribute__labels}) as events__about__domain__zone__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__asset__attribute__permissions {
      view_label: "Events: About Asset Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.asset__attribute__permissions}) as events__about__asset__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__dns__authority {
      view_label: "Events: Intermediary Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__dns__authority}) as events__intermediary__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__dhcp__options {
      view_label: "Events: Intermediary Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__dhcp__options}) as events__intermediary__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__email__cc {
      view_label: "Events: Intermediary Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__email__cc}) as events__intermediary__artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__section {
      view_label: "Events: Intermediary File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__pe_file__section}) as events__intermediary__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__embedded_ips {
      view_label: "Events: Intermediary Process File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__embedded_ips}) as events__intermediary__process__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__campaigns {
      view_label: "Events: Intermediary Security Result Campaigns"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.campaigns}) as events__intermediary__security_result__campaigns ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__tech__phone_numbers {
      view_label: "Events: Intermediary Domain Tech Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__tech__phone_numbers}) as events__intermediary__domain__tech__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__billing__department {
      view_label: "Events: Intermediary Domain Billing Department"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__billing__department}) as events__intermediary__domain__billing__department ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__zone__phone_numbers {
      view_label: "Events: Intermediary Domain Zone Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__zone__phone_numbers}) as events__intermediary__domain__zone__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__intermediary__user__time_off {
      view_label: "Events: Intermediary User Time Off"
      sql: LEFT JOIN UNNEST(${events__intermediary.user__time_off}) as events__intermediary__user__time_off ;;
      relationship: one_to_many
    }
    join: events__intermediary__user__attribute__roles {
      view_label: "Events: Intermediary User Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.user__attribute__roles}) as events__intermediary__user__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__user__attribute__labels {
      view_label: "Events: Intermediary User Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.user__attribute__labels}) as events__intermediary__user__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__email__cc {
      view_label: "Events: Security Result About Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__email__cc}) as events__security_result__about__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_location {
      view_label: "Events: Security Result About Ip Location"
      sql: LEFT JOIN UNNEST(${events__security_result.about__ip_location}) as events__security_result__about__ip_location ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__labels {
      view_label: "Events: Security Result About Asset Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__asset__labels}) as events__security_result__about__asset__labels ;;
      relationship: one_to_many
    }
    join: events__target__security_result__associations {
      view_label: "Events: Target Security Result Associations"
      sql: LEFT JOIN UNNEST(${events__target__security_result.associations}) as events__target__security_result__associations ;;
      relationship: one_to_many
    }
    join: events__target__security_result__rule_labels {
      view_label: "Events: Target Security Result Rule Labels"
      sql: LEFT JOIN UNNEST(${events__target__security_result.rule_labels}) as events__target__security_result__rule_labels ;;
      relationship: one_to_many
    }
    join: events__target__domain__registrant__phone_numbers {
      view_label: "Events: Target Domain Registrant Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.target__domain__registrant__phone_numbers}) as events__target__domain__registrant__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__target__asset__software__permissions {
      view_label: "Events: Target Asset Software Permissions"
      sql: LEFT JOIN UNNEST(${events__target__asset__software.permissions}) as events__target__asset__software__permissions ;;
      relationship: one_to_many
    }
    join: events__target__user__attribute__permissions {
      view_label: "Events: Target User Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__user__attribute__permissions}) as events__target__user__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__smtp__rcpt_to {
      view_label: "Events: Principal Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__smtp__rcpt_to}) as events__principal__artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__resource {
      view_label: "Events: Principal File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events.principal__file__pe_file__resource}) as events__principal__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__embedded_domains {
      view_label: "Events: Principal Process File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__embedded_domains}) as events__principal__process__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__principal__resource__attribute__roles {
      view_label: "Events: Principal Resource Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__resource__attribute__roles}) as events__principal__resource__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__resource__attribute__labels {
      view_label: "Events: Principal Resource Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__resource__attribute__labels}) as events__principal__resource__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__domain__tech__group_identifiers {
      view_label: "Events: Principal Domain Tech Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.principal__domain__tech__group_identifiers}) as events__principal__domain__tech__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__principal__domain__zone__group_identifiers {
      view_label: "Events: Principal Domain Zone Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.principal__domain__zone__group_identifiers}) as events__principal__domain__zone__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__email__subject {
      view_label: "Events: Observer Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__email__subject}) as events__observer__artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__observer__cloud__vpc__attribute__roles {
      view_label: "Events: Observer Cloud Vpc Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__cloud__vpc__attribute__roles}) as events__observer__cloud__vpc__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__cloud__vpc__attribute__labels {
      view_label: "Events: Observer Cloud Vpc Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__cloud__vpc__attribute__labels}) as events__observer__cloud__vpc__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__imports__functions {
      view_label: "Events: Observer File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__observer__file__pe_file__imports.functions}) as events__observer__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__capabilities_tags {
      view_label: "Events: Observer Process File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__capabilities_tags}) as events__observer__process__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__observer__domain__admin__group_identifiers {
      view_label: "Events: Observer Domain Admin Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.observer__domain__admin__group_identifiers}) as events__observer__domain__admin__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__observer__domain__billing__email_addresses {
      view_label: "Events: Observer Domain Billing Email Addresses"
      sql: LEFT JOIN UNNEST(${events.observer__domain__billing__email_addresses}) as events__observer__domain__billing__email_addresses ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__dns__additional {
      view_label: "Events: Src Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__dns__additional}) as events__src__artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__dns__questions {
      view_label: "Events: Src Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__dns__questions}) as events__src__artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__src__file__signature_info__sigcheck__signer {
      view_label: "Events: Src File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events.src__file__signature_info__sigcheck__signer}) as events__src__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__src__resource__attribute__permissions {
      view_label: "Events: Src Resource Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__resource__attribute__permissions}) as events__src__resource__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__src__user_management_chain__phone_numbers {
      view_label: "Events: Src User Management Chain Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__src__user_management_chain.phone_numbers}) as events__src__user_management_chain__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__embedded_ips {
      view_label: "Events: Src Process Ancestors File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__embedded_ips}) as events__src__process_ancestors__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__src__domain__billing__time_off {
      view_label: "Events: Src Domain Billing Time Off"
      sql: LEFT JOIN UNNEST(${events.src__domain__billing__time_off}) as events__src__domain__billing__time_off ;;
      relationship: one_to_many
    }
    join: events__src__domain__billing__attribute__roles {
      view_label: "Events: Src Domain Billing Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__domain__billing__attribute__roles}) as events__src__domain__billing__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__domain__billing__attribute__labels {
      view_label: "Events: Src Domain Billing Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__domain__billing__attribute__labels}) as events__src__domain__billing__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__domain__registrant__group_identifiers {
      view_label: "Events: Src Domain Registrant Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.src__domain__registrant__group_identifiers}) as events__src__domain__registrant__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__email__bcc {
      view_label: "Events: About Ip Geo Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__email__bcc}) as events__about__ip_geo_artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__section {
      view_label: "Events: About Process File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__about.process__file__pe_file__section}) as events__about__process__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__about__domain__admin__time_off {
      view_label: "Events: About Domain Admin Time Off"
      sql: LEFT JOIN UNNEST(${events__about.domain__admin__time_off}) as events__about__domain__admin__time_off ;;
      relationship: one_to_many
    }
    join: events__about__domain__admin__attribute__roles {
      view_label: "Events: About Domain Admin Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.domain__admin__attribute__roles}) as events__about__domain__admin__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__domain__admin__attribute__labels {
      view_label: "Events: About Domain Admin Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.domain__admin__attribute__labels}) as events__about__domain__admin__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__domain__registrant__email_addresses {
      view_label: "Events: About Domain Registrant Email Addresses"
      sql: LEFT JOIN UNNEST(${events__about.domain__registrant__email_addresses}) as events__about__domain__registrant__email_addresses ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__dns__additional {
      view_label: "Events: Intermediary Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__dns__additional}) as events__intermediary__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__dns__questions {
      view_label: "Events: Intermediary Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__dns__questions}) as events__intermediary__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__email__bcc {
      view_label: "Events: Intermediary Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__email__bcc}) as events__intermediary__artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__embedded_urls {
      view_label: "Events: Intermediary Process File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__embedded_urls}) as events__intermediary__process__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__admin__phone_numbers {
      view_label: "Events: Intermediary Domain Admin Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__admin__phone_numbers}) as events__intermediary__domain__admin__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__vulnerabilities {
      view_label: "Events: Intermediary Asset Vulnerabilities"
      sql: LEFT JOIN UNNEST(${events__intermediary.asset__vulnerabilities}) as events__intermediary__asset__vulnerabilities ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__attribute__roles {
      view_label: "Events: Intermediary Asset Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.asset__attribute__roles}) as events__intermediary__asset__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__attribute__labels {
      view_label: "Events: Intermediary Asset Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.asset__attribute__labels}) as events__intermediary__asset__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__associations__alias {
      view_label: "Events: Security Result Associations Alias"
      sql: LEFT JOIN UNNEST(${events__security_result__associations.alias}) as events__security_result__associations__alias ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__email__bcc {
      view_label: "Events: Security Result About Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__email__bcc}) as events__security_result__about__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__embedded_ips {
      view_label: "Events: Security Result About File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__embedded_ips}) as events__security_result__about__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__tags {
      view_label: "Events: Security Result About Process File Tags"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__tags}) as events__security_result__about__process__file__tags ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__email__cc {
      view_label: "Events: Target Ip Geo Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__email__cc}) as events__target__ip_geo_artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__dns__answers {
      view_label: "Events: Target Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__dns__answers}) as events__target__artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__target__user_management_chain__department {
      view_label: "Events: Target User Management Chain Department"
      sql: LEFT JOIN UNNEST(${events__target__user_management_chain.department}) as events__target__user_management_chain__department ;;
      relationship: one_to_many
    }
    join: events__target__security_result__category_details {
      view_label: "Events: Target Security Result Category Details"
      sql: LEFT JOIN UNNEST(${events__target__security_result.category_details}) as events__target__security_result__category_details ;;
      relationship: one_to_many
    }
    join: events__target__security_result__verdict_info {
      view_label: "Events: Target Security Result Verdict Info"
      sql: LEFT JOIN UNNEST(${events__target__security_result.verdict_info}) as events__target__security_result__verdict_info ;;
      relationship: one_to_many
    }
    join: events__target__domain__tech__time_off {
      view_label: "Events: Target Domain Tech Time Off"
      sql: LEFT JOIN UNNEST(${events.target__domain__tech__time_off}) as events__target__domain__tech__time_off ;;
      relationship: one_to_many
    }
    join: events__target__domain__tech__attribute__roles {
      view_label: "Events: Target Domain Tech Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__domain__tech__attribute__roles}) as events__target__domain__tech__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__domain__tech__attribute__labels {
      view_label: "Events: Target Domain Tech Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__domain__tech__attribute__labels}) as events__target__domain__tech__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__domain__billing__group_identifiers {
      view_label: "Events: Target Domain Billing Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.target__domain__billing__group_identifiers}) as events__target__domain__billing__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__target__domain__zone__time_off {
      view_label: "Events: Target Domain Zone Time Off"
      sql: LEFT JOIN UNNEST(${events.target__domain__zone__time_off}) as events__target__domain__zone__time_off ;;
      relationship: one_to_many
    }
    join: events__target__domain__zone__attribute__roles {
      view_label: "Events: Target Domain Zone Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__domain__zone__attribute__roles}) as events__target__domain__zone__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__domain__zone__attribute__labels {
      view_label: "Events: Target Domain Zone Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__domain__zone__attribute__labels}) as events__target__domain__zone__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__asset__attribute__permissions {
      view_label: "Events: Target Asset Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__asset__attribute__permissions}) as events__target__asset__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__email__subject {
      view_label: "Events: Principal Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__email__subject}) as events__principal__artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__principal__cloud__vpc__attribute__roles {
      view_label: "Events: Principal Cloud Vpc Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__cloud__vpc__attribute__roles}) as events__principal__cloud__vpc__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__cloud__vpc__attribute__labels {
      view_label: "Events: Principal Cloud Vpc Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__cloud__vpc__attribute__labels}) as events__principal__cloud__vpc__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__imports__functions {
      view_label: "Events: Principal File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__principal__file__pe_file__imports.functions}) as events__principal__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__capabilities_tags {
      view_label: "Events: Principal Process File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__capabilities_tags}) as events__principal__process__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__principal__domain__admin__group_identifiers {
      view_label: "Events: Principal Domain Admin Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.principal__domain__admin__group_identifiers}) as events__principal__domain__admin__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__principal__domain__billing__email_addresses {
      view_label: "Events: Principal Domain Billing Email Addresses"
      sql: LEFT JOIN UNNEST(${events.principal__domain__billing__email_addresses}) as events__principal__domain__billing__email_addresses ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__associations {
      view_label: "Events: Observer Security Result Associations"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.associations}) as events__observer__security_result__associations ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__rule_labels {
      view_label: "Events: Observer Security Result Rule Labels"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.rule_labels}) as events__observer__security_result__rule_labels ;;
      relationship: one_to_many
    }
    join: events__observer__domain__registrant__phone_numbers {
      view_label: "Events: Observer Domain Registrant Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.observer__domain__registrant__phone_numbers}) as events__observer__domain__registrant__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__observer__asset__software__permissions {
      view_label: "Events: Observer Asset Software Permissions"
      sql: LEFT JOIN UNNEST(${events__observer__asset__software.permissions}) as events__observer__asset__software__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__user__attribute__permissions {
      view_label: "Events: Observer User Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__user__attribute__permissions}) as events__observer__user__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__metadata__enrichment_labels__custom_labels {
      view_label: "Events: Metadata Enrichment Labels Custom Labels"
      sql: LEFT JOIN UNNEST(${events.metadata__enrichment_labels__custom_labels}) as events__metadata__enrichment_labels__custom_labels ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__smtp__rcpt_to {
      view_label: "Events: Src Ip Geo Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__smtp__rcpt_to}) as events__src__ip_geo_artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__src__network__tls__client__supported_ciphers {
      view_label: "Events: Src Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events.src__network__tls__client__supported_ciphers}) as events__src__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__src__cloud__vpc__attribute__permissions {
      view_label: "Events: Src Cloud Vpc Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__cloud__vpc__attribute__permissions}) as events__src__cloud__vpc__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__imports {
      view_label: "Events: Src Process File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events.src__process__file__pe_file__imports}) as events__src__process__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__src__security_result__detection_fields {
      view_label: "Events: Src Security Result Detection Fields"
      sql: LEFT JOIN UNNEST(${events__src__security_result.detection_fields}) as events__src__security_result__detection_fields ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__embedded_urls {
      view_label: "Events: Src Process Ancestors File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__embedded_urls}) as events__src__process_ancestors__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__email__to {
      view_label: "Events: About Ip Geo Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__email__to}) as events__about__ip_geo_artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__dns__authority {
      view_label: "Events: About Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__dns__authority}) as events__about__artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__dhcp__options {
      view_label: "Events: About Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__dhcp__options}) as events__about__artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__about__cloud__project__attribute__roles {
      view_label: "Events: About Cloud Project Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.cloud__project__attribute__roles}) as events__about__cloud__project__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__cloud__project__attribute__labels {
      view_label: "Events: About Cloud Project Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.cloud__project__attribute__labels}) as events__about__cloud__project__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__signature_info__signer {
      view_label: "Events: About File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__about.file__pe_file__signature_info__signer}) as events__about__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__about__group__attribute__permissions {
      view_label: "Events: About Group Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.group__attribute__permissions}) as events__about__group__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__email__to {
      view_label: "Events: Intermediary Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__email__to}) as events__intermediary__artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__intermediary__user_management_chain {
      view_label: "Events: Intermediary User Management Chain"
      sql: LEFT JOIN UNNEST(${events__intermediary.user_management_chain}) as events__intermediary__user_management_chain ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__tags {
      view_label: "Events: Intermediary Process Ancestors File Tags"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__tags}) as events__intermediary__process_ancestors__file__tags ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__tech__email_addresses {
      view_label: "Events: Intermediary Domain Tech Email Addresses"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__tech__email_addresses}) as events__intermediary__domain__tech__email_addresses ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__zone__email_addresses {
      view_label: "Events: Intermediary Domain Zone Email Addresses"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__zone__email_addresses}) as events__intermediary__domain__zone__email_addresses ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact {
      view_label: "Events: Security Result About Ip Geo Artifact"
      sql: LEFT JOIN UNNEST(${events__security_result.about__ip_geo_artifact}) as events__security_result__about__ip_geo_artifact ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__email__to {
      view_label: "Events: Security Result About Network Email To"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__email__to}) as events__security_result__about__network__email__to ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__embedded_urls {
      view_label: "Events: Security Result About File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__embedded_urls}) as events__security_result__about__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__names {
      view_label: "Events: Security Result About Process File Names"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__names}) as events__security_result__about__process__file__names ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__name_server {
      view_label: "Events: Security Result About Domain Name Server"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__name_server}) as events__security_result__about__domain__name_server ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__hardware {
      view_label: "Events: Security Result About Asset Hardware"
      sql: LEFT JOIN UNNEST(${events__security_result.about__asset__hardware}) as events__security_result__about__asset__hardware ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user__phone_numbers {
      view_label: "Events: Security Result About User Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__user__phone_numbers}) as events__security_result__about__user__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__email__bcc {
      view_label: "Events: Target Ip Geo Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__email__bcc}) as events__target__ip_geo_artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__section {
      view_label: "Events: Target Process File Pe File Section"
      sql: LEFT JOIN UNNEST(${events.target__process__file__pe_file__section}) as events__target__process__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__target__domain__admin__time_off {
      view_label: "Events: Target Domain Admin Time Off"
      sql: LEFT JOIN UNNEST(${events.target__domain__admin__time_off}) as events__target__domain__admin__time_off ;;
      relationship: one_to_many
    }
    join: events__target__domain__admin__attribute__roles {
      view_label: "Events: Target Domain Admin Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__domain__admin__attribute__roles}) as events__target__domain__admin__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__domain__admin__attribute__labels {
      view_label: "Events: Target Domain Admin Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__domain__admin__attribute__labels}) as events__target__domain__admin__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__domain__registrant__email_addresses {
      view_label: "Events: Target Domain Registrant Email Addresses"
      sql: LEFT JOIN UNNEST(${events.target__domain__registrant__email_addresses}) as events__target__domain__registrant__email_addresses ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__associations {
      view_label: "Events: Principal Security Result Associations"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.associations}) as events__principal__security_result__associations ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__rule_labels {
      view_label: "Events: Principal Security Result Rule Labels"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.rule_labels}) as events__principal__security_result__rule_labels ;;
      relationship: one_to_many
    }
    join: events__principal__domain__registrant__phone_numbers {
      view_label: "Events: Principal Domain Registrant Phone Numbers"
      sql: LEFT JOIN UNNEST(${events.principal__domain__registrant__phone_numbers}) as events__principal__domain__registrant__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__principal__asset__software__permissions {
      view_label: "Events: Principal Asset Software Permissions"
      sql: LEFT JOIN UNNEST(${events__principal__asset__software.permissions}) as events__principal__asset__software__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__user__attribute__permissions {
      view_label: "Events: Principal User Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__user__attribute__permissions}) as events__principal__user__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__email__cc {
      view_label: "Events: Observer Ip Geo Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__email__cc}) as events__observer__ip_geo_artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__dns__answers {
      view_label: "Events: Observer Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__dns__answers}) as events__observer__artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__observer__user_management_chain__department {
      view_label: "Events: Observer User Management Chain Department"
      sql: LEFT JOIN UNNEST(${events__observer__user_management_chain.department}) as events__observer__user_management_chain__department ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__category_details {
      view_label: "Events: Observer Security Result Category Details"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.category_details}) as events__observer__security_result__category_details ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__verdict_info {
      view_label: "Events: Observer Security Result Verdict Info"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.verdict_info}) as events__observer__security_result__verdict_info ;;
      relationship: one_to_many
    }
    join: events__observer__domain__tech__time_off {
      view_label: "Events: Observer Domain Tech Time Off"
      sql: LEFT JOIN UNNEST(${events.observer__domain__tech__time_off}) as events__observer__domain__tech__time_off ;;
      relationship: one_to_many
    }
    join: events__observer__domain__tech__attribute__roles {
      view_label: "Events: Observer Domain Tech Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__domain__tech__attribute__roles}) as events__observer__domain__tech__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__domain__tech__attribute__labels {
      view_label: "Events: Observer Domain Tech Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__domain__tech__attribute__labels}) as events__observer__domain__tech__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__domain__billing__group_identifiers {
      view_label: "Events: Observer Domain Billing Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.observer__domain__billing__group_identifiers}) as events__observer__domain__billing__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__observer__domain__zone__time_off {
      view_label: "Events: Observer Domain Zone Time Off"
      sql: LEFT JOIN UNNEST(${events.observer__domain__zone__time_off}) as events__observer__domain__zone__time_off ;;
      relationship: one_to_many
    }
    join: events__observer__domain__zone__attribute__roles {
      view_label: "Events: Observer Domain Zone Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__domain__zone__attribute__roles}) as events__observer__domain__zone__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__domain__zone__attribute__labels {
      view_label: "Events: Observer Domain Zone Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__domain__zone__attribute__labels}) as events__observer__domain__zone__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__asset__attribute__permissions {
      view_label: "Events: Observer Asset Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__asset__attribute__permissions}) as events__observer__asset__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__ip}) as events__extensions__vulns__vulnerabilities__about__ip ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__email__subject {
      view_label: "Events: Src Ip Geo Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__email__subject}) as events__src__ip_geo_artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__smtp__server_response {
      view_label: "Events: Src Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__smtp__server_response}) as events__src__artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__resources_type_count {
      view_label: "Events: Src File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events.src__file__pe_file__resources_type_count}) as events__src__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__signature_info__x509 {
      view_label: "Events: Src File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events.src__file__pe_file__signature_info__x509}) as events__src__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__resource {
      view_label: "Events: Src Process File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events.src__process__file__pe_file__resource}) as events__src__process__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__src__user_management_chain__email_addresses {
      view_label: "Events: Src User Management Chain Email Addresses"
      sql: LEFT JOIN UNNEST(${events__src__user_management_chain.email_addresses}) as events__src__user_management_chain__email_addresses ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__dns__additional {
      view_label: "Events: About Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__dns__additional}) as events__about__artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__dns__questions {
      view_label: "Events: About Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__dns__questions}) as events__about__artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__about__file__signature_info__sigcheck__signer {
      view_label: "Events: About File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__about.file__signature_info__sigcheck__signer}) as events__about__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__about__resource__attribute__permissions {
      view_label: "Events: About Resource Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.resource__attribute__permissions}) as events__about__resource__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__user_management_chain__phone_numbers {
      view_label: "Events: About User Management Chain Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__about__user_management_chain.phone_numbers}) as events__about__user_management_chain__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__embedded_ips {
      view_label: "Events: About Process Ancestors File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__embedded_ips}) as events__about__process_ancestors__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__about__domain__billing__time_off {
      view_label: "Events: About Domain Billing Time Off"
      sql: LEFT JOIN UNNEST(${events__about.domain__billing__time_off}) as events__about__domain__billing__time_off ;;
      relationship: one_to_many
    }
    join: events__about__domain__billing__attribute__roles {
      view_label: "Events: About Domain Billing Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.domain__billing__attribute__roles}) as events__about__domain__billing__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__domain__billing__attribute__labels {
      view_label: "Events: About Domain Billing Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.domain__billing__attribute__labels}) as events__about__domain__billing__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__domain__registrant__group_identifiers {
      view_label: "Events: About Domain Registrant Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__about.domain__registrant__group_identifiers}) as events__about__domain__registrant__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__smtp__server_response {
      view_label: "Events: Intermediary Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__smtp__server_response}) as events__intermediary__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__imports {
      view_label: "Events: Intermediary File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__pe_file__imports}) as events__intermediary__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__intermediary__group__attribute__roles {
      view_label: "Events: Intermediary Group Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.group__attribute__roles}) as events__intermediary__group__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__group__attribute__labels {
      view_label: "Events: Intermediary Group Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.group__attribute__labels}) as events__intermediary__group__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__command_line_history {
      view_label: "Events: Intermediary Process Command Line History"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__command_line_history}) as events__intermediary__process__command_line_history ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__outcomes {
      view_label: "Events: Intermediary Security Result Outcomes"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.outcomes}) as events__intermediary__security_result__outcomes ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__names {
      view_label: "Events: Intermediary Process Ancestors File Names"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__names}) as events__intermediary__process_ancestors__file__names ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__admin__email_addresses {
      view_label: "Events: Intermediary Domain Admin Email Addresses"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__admin__email_addresses}) as events__intermediary__domain__admin__email_addresses ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__billing__phone_numbers {
      view_label: "Events: Intermediary Domain Billing Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__billing__phone_numbers}) as events__intermediary__domain__billing__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__registrant__department {
      view_label: "Events: Intermediary Domain Registrant Department"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__registrant__department}) as events__intermediary__domain__registrant__department ;;
      relationship: one_to_many
    }
    join: events__security_result__associations__country_code {
      view_label: "Events: Security Result Associations Country Code"
      sql: LEFT JOIN UNNEST(${events__security_result__associations.country_code}) as events__security_result__associations__country_code ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__software {
      view_label: "Events: Security Result About Asset Software"
      sql: LEFT JOIN UNNEST(${events__security_result.about__asset__software}) as events__security_result__about__asset__software ;;
      relationship: one_to_many
    }
    join: events__security_result__attack_details__tactics {
      view_label: "Events: Security Result Attack Details Tactics"
      sql: LEFT JOIN UNNEST(${events__security_result.attack_details__tactics}) as events__security_result__attack_details__tactics ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__email__to {
      view_label: "Events: Target Ip Geo Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__email__to}) as events__target__ip_geo_artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__dns__authority {
      view_label: "Events: Target Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__dns__authority}) as events__target__artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__dhcp__options {
      view_label: "Events: Target Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__dhcp__options}) as events__target__artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__target__cloud__project__attribute__roles {
      view_label: "Events: Target Cloud Project Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__cloud__project__attribute__roles}) as events__target__cloud__project__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__cloud__project__attribute__labels {
      view_label: "Events: Target Cloud Project Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__cloud__project__attribute__labels}) as events__target__cloud__project__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__signature_info__signer {
      view_label: "Events: Target File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events.target__file__pe_file__signature_info__signer}) as events__target__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__target__group__attribute__permissions {
      view_label: "Events: Target Group Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__group__attribute__permissions}) as events__target__group__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__email__cc {
      view_label: "Events: Principal Ip Geo Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__email__cc}) as events__principal__ip_geo_artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__dns__answers {
      view_label: "Events: Principal Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__dns__answers}) as events__principal__artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__principal__user_management_chain__department {
      view_label: "Events: Principal User Management Chain Department"
      sql: LEFT JOIN UNNEST(${events__principal__user_management_chain.department}) as events__principal__user_management_chain__department ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__category_details {
      view_label: "Events: Principal Security Result Category Details"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.category_details}) as events__principal__security_result__category_details ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__verdict_info {
      view_label: "Events: Principal Security Result Verdict Info"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.verdict_info}) as events__principal__security_result__verdict_info ;;
      relationship: one_to_many
    }
    join: events__principal__domain__tech__time_off {
      view_label: "Events: Principal Domain Tech Time Off"
      sql: LEFT JOIN UNNEST(${events.principal__domain__tech__time_off}) as events__principal__domain__tech__time_off ;;
      relationship: one_to_many
    }
    join: events__principal__domain__tech__attribute__roles {
      view_label: "Events: Principal Domain Tech Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__domain__tech__attribute__roles}) as events__principal__domain__tech__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__domain__tech__attribute__labels {
      view_label: "Events: Principal Domain Tech Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__domain__tech__attribute__labels}) as events__principal__domain__tech__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__domain__billing__group_identifiers {
      view_label: "Events: Principal Domain Billing Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.principal__domain__billing__group_identifiers}) as events__principal__domain__billing__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__principal__domain__zone__time_off {
      view_label: "Events: Principal Domain Zone Time Off"
      sql: LEFT JOIN UNNEST(${events.principal__domain__zone__time_off}) as events__principal__domain__zone__time_off ;;
      relationship: one_to_many
    }
    join: events__principal__domain__zone__attribute__roles {
      view_label: "Events: Principal Domain Zone Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__domain__zone__attribute__roles}) as events__principal__domain__zone__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__domain__zone__attribute__labels {
      view_label: "Events: Principal Domain Zone Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__domain__zone__attribute__labels}) as events__principal__domain__zone__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__asset__attribute__permissions {
      view_label: "Events: Principal Asset Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__asset__attribute__permissions}) as events__principal__asset__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__email__bcc {
      view_label: "Events: Observer Ip Geo Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__email__bcc}) as events__observer__ip_geo_artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__section {
      view_label: "Events: Observer Process File Pe File Section"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__pe_file__section}) as events__observer__process__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__observer__domain__admin__time_off {
      view_label: "Events: Observer Domain Admin Time Off"
      sql: LEFT JOIN UNNEST(${events.observer__domain__admin__time_off}) as events__observer__domain__admin__time_off ;;
      relationship: one_to_many
    }
    join: events__observer__domain__admin__attribute__roles {
      view_label: "Events: Observer Domain Admin Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__domain__admin__attribute__roles}) as events__observer__domain__admin__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__domain__admin__attribute__labels {
      view_label: "Events: Observer Domain Admin Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__domain__admin__attribute__labels}) as events__observer__domain__admin__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__domain__registrant__email_addresses {
      view_label: "Events: Observer Domain Registrant Email Addresses"
      sql: LEFT JOIN UNNEST(${events.observer__domain__registrant__email_addresses}) as events__observer__domain__registrant__email_addresses ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__mac {
      view_label: "Events: Extensions Vulns Vulnerabilities About Mac"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__mac}) as events__extensions__vulns__vulnerabilities__about__mac ;;
      relationship: one_to_many
    }
    join: events__src__file__signature_info__sigcheck__x509 {
      view_label: "Events: Src File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events.src__file__signature_info__sigcheck__x509}) as events__src__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__imports__functions {
      view_label: "Events: Src Process File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__src__process__file__pe_file__imports.functions}) as events__src__process__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__command_line_history {
      view_label: "Events: Src Process Ancestors Command Line History"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.command_line_history}) as events__src__process_ancestors__command_line_history ;;
      relationship: one_to_many
    }
    join: events__src__domain__tech__attribute__permissions {
      view_label: "Events: Src Domain Tech Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__domain__tech__attribute__permissions}) as events__src__domain__tech__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__src__domain__zone__attribute__permissions {
      view_label: "Events: Src Domain Zone Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__domain__zone__attribute__permissions}) as events__src__domain__zone__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__src__domain__registrant__time_off {
      view_label: "Events: Src Domain Registrant Time Off"
      sql: LEFT JOIN UNNEST(${events.src__domain__registrant__time_off}) as events__src__domain__registrant__time_off ;;
      relationship: one_to_many
    }
    join: events__src__domain__registrant__attribute__roles {
      view_label: "Events: Src Domain Registrant Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.src__domain__registrant__attribute__roles}) as events__src__domain__registrant__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__domain__registrant__attribute__labels {
      view_label: "Events: Src Domain Registrant Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.src__domain__registrant__attribute__labels}) as events__src__domain__registrant__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__smtp__rcpt_to {
      view_label: "Events: About Ip Geo Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__smtp__rcpt_to}) as events__about__ip_geo_artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__about__network__tls__client__supported_ciphers {
      view_label: "Events: About Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__about.network__tls__client__supported_ciphers}) as events__about__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__about__cloud__vpc__attribute__permissions {
      view_label: "Events: About Cloud Vpc Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.cloud__vpc__attribute__permissions}) as events__about__cloud__vpc__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__imports {
      view_label: "Events: About Process File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__about.process__file__pe_file__imports}) as events__about__process__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__about__security_result__detection_fields {
      view_label: "Events: About Security Result Detection Fields"
      sql: LEFT JOIN UNNEST(${events__about__security_result.detection_fields}) as events__about__security_result__detection_fields ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__embedded_urls {
      view_label: "Events: About Process Ancestors File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__embedded_urls}) as events__about__process_ancestors__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__smtp__rcpt_to {
      view_label: "Events: Intermediary Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__smtp__rcpt_to}) as events__intermediary__artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__resource {
      view_label: "Events: Intermediary File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__pe_file__resource}) as events__intermediary__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__embedded_domains {
      view_label: "Events: Intermediary Process File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__embedded_domains}) as events__intermediary__process__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__intermediary__resource__attribute__roles {
      view_label: "Events: Intermediary Resource Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.resource__attribute__roles}) as events__intermediary__resource__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__resource__attribute__labels {
      view_label: "Events: Intermediary Resource Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.resource__attribute__labels}) as events__intermediary__resource__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__tech__group_identifiers {
      view_label: "Events: Intermediary Domain Tech Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__tech__group_identifiers}) as events__intermediary__domain__tech__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__zone__group_identifiers {
      view_label: "Events: Intermediary Domain Zone Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__zone__group_identifiers}) as events__intermediary__domain__zone__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__smtp__rcpt_to {
      view_label: "Events: Security Result About Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__smtp__rcpt_to}) as events__security_result__about__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user__email_addresses {
      view_label: "Events: Security Result About User Email Addresses"
      sql: LEFT JOIN UNNEST(${events__security_result.about__user__email_addresses}) as events__security_result__about__user__email_addresses ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__dns__additional {
      view_label: "Events: Target Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__dns__additional}) as events__target__artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__dns__questions {
      view_label: "Events: Target Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__dns__questions}) as events__target__artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__target__file__signature_info__sigcheck__signer {
      view_label: "Events: Target File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events.target__file__signature_info__sigcheck__signer}) as events__target__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__target__resource__attribute__permissions {
      view_label: "Events: Target Resource Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__resource__attribute__permissions}) as events__target__resource__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__target__user_management_chain__phone_numbers {
      view_label: "Events: Target User Management Chain Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__target__user_management_chain.phone_numbers}) as events__target__user_management_chain__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__embedded_ips {
      view_label: "Events: Target Process Ancestors File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__embedded_ips}) as events__target__process_ancestors__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__target__domain__billing__time_off {
      view_label: "Events: Target Domain Billing Time Off"
      sql: LEFT JOIN UNNEST(${events.target__domain__billing__time_off}) as events__target__domain__billing__time_off ;;
      relationship: one_to_many
    }
    join: events__target__domain__billing__attribute__roles {
      view_label: "Events: Target Domain Billing Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__domain__billing__attribute__roles}) as events__target__domain__billing__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__domain__billing__attribute__labels {
      view_label: "Events: Target Domain Billing Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__domain__billing__attribute__labels}) as events__target__domain__billing__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__domain__registrant__group_identifiers {
      view_label: "Events: Target Domain Registrant Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.target__domain__registrant__group_identifiers}) as events__target__domain__registrant__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__email__bcc {
      view_label: "Events: Principal Ip Geo Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__email__bcc}) as events__principal__ip_geo_artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__section {
      view_label: "Events: Principal Process File Pe File Section"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__pe_file__section}) as events__principal__process__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__principal__domain__admin__time_off {
      view_label: "Events: Principal Domain Admin Time Off"
      sql: LEFT JOIN UNNEST(${events.principal__domain__admin__time_off}) as events__principal__domain__admin__time_off ;;
      relationship: one_to_many
    }
    join: events__principal__domain__admin__attribute__roles {
      view_label: "Events: Principal Domain Admin Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__domain__admin__attribute__roles}) as events__principal__domain__admin__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__domain__admin__attribute__labels {
      view_label: "Events: Principal Domain Admin Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__domain__admin__attribute__labels}) as events__principal__domain__admin__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__domain__registrant__email_addresses {
      view_label: "Events: Principal Domain Registrant Email Addresses"
      sql: LEFT JOIN UNNEST(${events.principal__domain__registrant__email_addresses}) as events__principal__domain__registrant__email_addresses ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__email__to {
      view_label: "Events: Observer Ip Geo Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__email__to}) as events__observer__ip_geo_artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__dns__authority {
      view_label: "Events: Observer Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__dns__authority}) as events__observer__artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__dhcp__options {
      view_label: "Events: Observer Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__dhcp__options}) as events__observer__artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__observer__cloud__project__attribute__roles {
      view_label: "Events: Observer Cloud Project Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__cloud__project__attribute__roles}) as events__observer__cloud__project__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__cloud__project__attribute__labels {
      view_label: "Events: Observer Cloud Project Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__cloud__project__attribute__labels}) as events__observer__cloud__project__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__signature_info__signer {
      view_label: "Events: Observer File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events.observer__file__pe_file__signature_info__signer}) as events__observer__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__observer__group__attribute__permissions {
      view_label: "Events: Observer Group Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__group__attribute__permissions}) as events__observer__group__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__metadata__enrichment_labels__ingestion_labels {
      view_label: "Events: Metadata Enrichment Labels Ingestion Labels"
      sql: LEFT JOIN UNNEST(${events.metadata__enrichment_labels__ingestion_labels}) as events__metadata__enrichment_labels__ingestion_labels ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__dns__answers {
      view_label: "Events: Src Ip Geo Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__dns__answers}) as events__src__ip_geo_artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__src__resource_ancestors__attribute__roles {
      view_label: "Events: Src Resource Ancestors Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__src__resource_ancestors.attribute__roles}) as events__src__resource_ancestors__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__resource_ancestors__attribute__labels {
      view_label: "Events: Src Resource Ancestors Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__src__resource_ancestors.attribute__labels}) as events__src__resource_ancestors__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__user_management_chain__group_identifiers {
      view_label: "Events: Src User Management Chain Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__src__user_management_chain.group_identifiers}) as events__src__user_management_chain__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__src__security_result__associations__alias {
      view_label: "Events: Src Security Result Associations Alias"
      sql: LEFT JOIN UNNEST(${events__src__security_result__associations.alias}) as events__src__security_result__associations__alias ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__embedded_domains {
      view_label: "Events: Src Process Ancestors File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__embedded_domains}) as events__src__process_ancestors__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__src__domain__admin__attribute__permissions {
      view_label: "Events: Src Domain Admin Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__domain__admin__attribute__permissions}) as events__src__domain__admin__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__email__subject {
      view_label: "Events: About Ip Geo Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__email__subject}) as events__about__ip_geo_artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__smtp__server_response {
      view_label: "Events: About Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__smtp__server_response}) as events__about__artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__resources_type_count {
      view_label: "Events: About File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__about.file__pe_file__resources_type_count}) as events__about__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__signature_info__x509 {
      view_label: "Events: About File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__about.file__pe_file__signature_info__x509}) as events__about__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__resource {
      view_label: "Events: About Process File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__about.process__file__pe_file__resource}) as events__about__process__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__about__user_management_chain__email_addresses {
      view_label: "Events: About User Management Chain Email Addresses"
      sql: LEFT JOIN UNNEST(${events__about__user_management_chain.email_addresses}) as events__about__user_management_chain__email_addresses ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__email__subject {
      view_label: "Events: Intermediary Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__email__subject}) as events__intermediary__artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__intermediary__cloud__vpc__attribute__roles {
      view_label: "Events: Intermediary Cloud Vpc Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.cloud__vpc__attribute__roles}) as events__intermediary__cloud__vpc__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__cloud__vpc__attribute__labels {
      view_label: "Events: Intermediary Cloud Vpc Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.cloud__vpc__attribute__labels}) as events__intermediary__cloud__vpc__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__imports__functions {
      view_label: "Events: Intermediary File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__intermediary__file__pe_file__imports.functions}) as events__intermediary__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__capabilities_tags {
      view_label: "Events: Intermediary Process File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__capabilities_tags}) as events__intermediary__process__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__admin__group_identifiers {
      view_label: "Events: Intermediary Domain Admin Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__admin__group_identifiers}) as events__intermediary__domain__admin__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__billing__email_addresses {
      view_label: "Events: Intermediary Domain Billing Email Addresses"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__billing__email_addresses}) as events__intermediary__domain__billing__email_addresses ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__email__subject {
      view_label: "Events: Security Result About Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__email__subject}) as events__security_result__about__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__embedded_domains {
      view_label: "Events: Security Result About File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__embedded_domains}) as events__security_result__about__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__security_result__about__resource_ancestors {
      view_label: "Events: Security Result About Resource Ancestors"
      sql: LEFT JOIN UNNEST(${events__security_result.about__resource_ancestors}) as events__security_result__about__resource_ancestors ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors {
      view_label: "Events: Security Result About Process Ancestors"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process_ancestors}) as events__security_result__about__process_ancestors ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__smtp__rcpt_to {
      view_label: "Events: Target Ip Geo Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__smtp__rcpt_to}) as events__target__ip_geo_artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__target__network__tls__client__supported_ciphers {
      view_label: "Events: Target Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events.target__network__tls__client__supported_ciphers}) as events__target__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__target__cloud__vpc__attribute__permissions {
      view_label: "Events: Target Cloud Vpc Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__cloud__vpc__attribute__permissions}) as events__target__cloud__vpc__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__imports {
      view_label: "Events: Target Process File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events.target__process__file__pe_file__imports}) as events__target__process__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__target__security_result__detection_fields {
      view_label: "Events: Target Security Result Detection Fields"
      sql: LEFT JOIN UNNEST(${events__target__security_result.detection_fields}) as events__target__security_result__detection_fields ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__embedded_urls {
      view_label: "Events: Target Process Ancestors File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__embedded_urls}) as events__target__process_ancestors__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__email__to {
      view_label: "Events: Principal Ip Geo Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__email__to}) as events__principal__ip_geo_artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__dns__authority {
      view_label: "Events: Principal Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__dns__authority}) as events__principal__artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__dhcp__options {
      view_label: "Events: Principal Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__dhcp__options}) as events__principal__artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__principal__cloud__project__attribute__roles {
      view_label: "Events: Principal Cloud Project Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__cloud__project__attribute__roles}) as events__principal__cloud__project__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__cloud__project__attribute__labels {
      view_label: "Events: Principal Cloud Project Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__cloud__project__attribute__labels}) as events__principal__cloud__project__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__signature_info__signer {
      view_label: "Events: Principal File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events.principal__file__pe_file__signature_info__signer}) as events__principal__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__principal__group__attribute__permissions {
      view_label: "Events: Principal Group Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__group__attribute__permissions}) as events__principal__group__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__dns__additional {
      view_label: "Events: Observer Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__dns__additional}) as events__observer__artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__dns__questions {
      view_label: "Events: Observer Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__dns__questions}) as events__observer__artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__observer__file__signature_info__sigcheck__signer {
      view_label: "Events: Observer File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events.observer__file__signature_info__sigcheck__signer}) as events__observer__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__observer__resource__attribute__permissions {
      view_label: "Events: Observer Resource Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__resource__attribute__permissions}) as events__observer__resource__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__user_management_chain__phone_numbers {
      view_label: "Events: Observer User Management Chain Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__observer__user_management_chain.phone_numbers}) as events__observer__user_management_chain__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__embedded_ips {
      view_label: "Events: Observer Process Ancestors File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__embedded_ips}) as events__observer__process_ancestors__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__observer__domain__billing__time_off {
      view_label: "Events: Observer Domain Billing Time Off"
      sql: LEFT JOIN UNNEST(${events.observer__domain__billing__time_off}) as events__observer__domain__billing__time_off ;;
      relationship: one_to_many
    }
    join: events__observer__domain__billing__attribute__roles {
      view_label: "Events: Observer Domain Billing Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__domain__billing__attribute__roles}) as events__observer__domain__billing__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__domain__billing__attribute__labels {
      view_label: "Events: Observer Domain Billing Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__domain__billing__attribute__labels}) as events__observer__domain__billing__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__domain__registrant__group_identifiers {
      view_label: "Events: Observer Domain Registrant Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.observer__domain__registrant__group_identifiers}) as events__observer__domain__registrant__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__metadata__base_labels__ingestion_kv_labels {
      view_label: "Events: Metadata Base Labels Ingestion Kv Labels"
      sql: LEFT JOIN UNNEST(${events.metadata__base_labels__ingestion_kv_labels}) as events__metadata__base_labels__ingestion_kv_labels ;;
      relationship: one_to_many
    }
    join: events__src__cloud__project__attribute__permissions {
      view_label: "Events: Src Cloud Project Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__cloud__project__attribute__permissions}) as events__src__cloud__project__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__signature_info__signers {
      view_label: "Events: Src File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events.src__file__pe_file__signature_info__signers}) as events__src__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__capabilities_tags {
      view_label: "Events: Src Process Ancestors File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__capabilities_tags}) as events__src__process_ancestors__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__about__file__signature_info__sigcheck__x509 {
      view_label: "Events: About File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__about.file__signature_info__sigcheck__x509}) as events__about__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__imports__functions {
      view_label: "Events: About Process File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__about__process__file__pe_file__imports.functions}) as events__about__process__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__command_line_history {
      view_label: "Events: About Process Ancestors Command Line History"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.command_line_history}) as events__about__process_ancestors__command_line_history ;;
      relationship: one_to_many
    }
    join: events__about__domain__tech__attribute__permissions {
      view_label: "Events: About Domain Tech Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.domain__tech__attribute__permissions}) as events__about__domain__tech__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__domain__zone__attribute__permissions {
      view_label: "Events: About Domain Zone Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.domain__zone__attribute__permissions}) as events__about__domain__zone__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__domain__registrant__time_off {
      view_label: "Events: About Domain Registrant Time Off"
      sql: LEFT JOIN UNNEST(${events__about.domain__registrant__time_off}) as events__about__domain__registrant__time_off ;;
      relationship: one_to_many
    }
    join: events__about__domain__registrant__attribute__roles {
      view_label: "Events: About Domain Registrant Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about.domain__registrant__attribute__roles}) as events__about__domain__registrant__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__domain__registrant__attribute__labels {
      view_label: "Events: About Domain Registrant Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about.domain__registrant__attribute__labels}) as events__about__domain__registrant__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__associations {
      view_label: "Events: Intermediary Security Result Associations"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.associations}) as events__intermediary__security_result__associations ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__rule_labels {
      view_label: "Events: Intermediary Security Result Rule Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.rule_labels}) as events__intermediary__security_result__rule_labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__registrant__phone_numbers {
      view_label: "Events: Intermediary Domain Registrant Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__registrant__phone_numbers}) as events__intermediary__domain__registrant__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__software__permissions {
      view_label: "Events: Intermediary Asset Software Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary__asset__software.permissions}) as events__intermediary__asset__software__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__user__attribute__permissions {
      view_label: "Events: Intermediary User Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.user__attribute__permissions}) as events__intermediary__user__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__capabilities_tags {
      view_label: "Events: Security Result About File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__capabilities_tags}) as events__security_result__about__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__tech__department {
      view_label: "Events: Security Result About Domain Tech Department"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__tech__department}) as events__security_result__about__domain__tech__department ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__zone__department {
      view_label: "Events: Security Result About Domain Zone Department"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__zone__department}) as events__security_result__about__domain__zone__department ;;
      relationship: one_to_many
    }
    join: events__security_result__about__investigation__comments {
      view_label: "Events: Security Result About Investigation Comments"
      sql: LEFT JOIN UNNEST(${events__security_result.about__investigation__comments}) as events__security_result__about__investigation__comments ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user__group_identifiers {
      view_label: "Events: Security Result About User Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__user__group_identifiers}) as events__security_result__about__user__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__security_result__attack_details__techniques {
      view_label: "Events: Security Result Attack Details Techniques"
      sql: LEFT JOIN UNNEST(${events__security_result.attack_details__techniques}) as events__security_result__attack_details__techniques ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__email__subject {
      view_label: "Events: Target Ip Geo Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__email__subject}) as events__target__ip_geo_artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__smtp__server_response {
      view_label: "Events: Target Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__smtp__server_response}) as events__target__artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__resources_type_count {
      view_label: "Events: Target File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events.target__file__pe_file__resources_type_count}) as events__target__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__signature_info__x509 {
      view_label: "Events: Target File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events.target__file__pe_file__signature_info__x509}) as events__target__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__resource {
      view_label: "Events: Target Process File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events.target__process__file__pe_file__resource}) as events__target__process__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__target__user_management_chain__email_addresses {
      view_label: "Events: Target User Management Chain Email Addresses"
      sql: LEFT JOIN UNNEST(${events__target__user_management_chain.email_addresses}) as events__target__user_management_chain__email_addresses ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__dns__additional {
      view_label: "Events: Principal Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__dns__additional}) as events__principal__artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__dns__questions {
      view_label: "Events: Principal Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__dns__questions}) as events__principal__artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__principal__file__signature_info__sigcheck__signer {
      view_label: "Events: Principal File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events.principal__file__signature_info__sigcheck__signer}) as events__principal__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__principal__resource__attribute__permissions {
      view_label: "Events: Principal Resource Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__resource__attribute__permissions}) as events__principal__resource__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__user_management_chain__phone_numbers {
      view_label: "Events: Principal User Management Chain Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__principal__user_management_chain.phone_numbers}) as events__principal__user_management_chain__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__embedded_ips {
      view_label: "Events: Principal Process Ancestors File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__embedded_ips}) as events__principal__process_ancestors__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__principal__domain__billing__time_off {
      view_label: "Events: Principal Domain Billing Time Off"
      sql: LEFT JOIN UNNEST(${events.principal__domain__billing__time_off}) as events__principal__domain__billing__time_off ;;
      relationship: one_to_many
    }
    join: events__principal__domain__billing__attribute__roles {
      view_label: "Events: Principal Domain Billing Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__domain__billing__attribute__roles}) as events__principal__domain__billing__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__domain__billing__attribute__labels {
      view_label: "Events: Principal Domain Billing Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__domain__billing__attribute__labels}) as events__principal__domain__billing__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__domain__registrant__group_identifiers {
      view_label: "Events: Principal Domain Registrant Group Identifiers"
      sql: LEFT JOIN UNNEST(${events.principal__domain__registrant__group_identifiers}) as events__principal__domain__registrant__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__smtp__rcpt_to {
      view_label: "Events: Observer Ip Geo Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__smtp__rcpt_to}) as events__observer__ip_geo_artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__observer__network__tls__client__supported_ciphers {
      view_label: "Events: Observer Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events.observer__network__tls__client__supported_ciphers}) as events__observer__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__observer__cloud__vpc__attribute__permissions {
      view_label: "Events: Observer Cloud Vpc Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__cloud__vpc__attribute__permissions}) as events__observer__cloud__vpc__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__imports {
      view_label: "Events: Observer Process File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__pe_file__imports}) as events__observer__process__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__detection_fields {
      view_label: "Events: Observer Security Result Detection Fields"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.detection_fields}) as events__observer__security_result__detection_fields ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__embedded_urls {
      view_label: "Events: Observer Process Ancestors File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__embedded_urls}) as events__observer__process_ancestors__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__nat_ip {
      view_label: "Events: Extensions Vulns Vulnerabilities About Nat Ip"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__nat_ip}) as events__extensions__vulns__vulnerabilities__about__nat_ip ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__dns__authority {
      view_label: "Events: Src Ip Geo Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__dns__authority}) as events__src__ip_geo_artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__dhcp__options {
      view_label: "Events: Src Ip Geo Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__dhcp__options}) as events__src__ip_geo_artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__resources_language_count {
      view_label: "Events: Src File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events.src__file__pe_file__resources_language_count}) as events__src__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__resources_type_count_str {
      view_label: "Events: Src File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events.src__file__pe_file__resources_type_count_str}) as events__src__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__src__file__signature_info__sigcheck__signers {
      view_label: "Events: Src File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events.src__file__signature_info__sigcheck__signers}) as events__src__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__src__security_result__associations__country_code {
      view_label: "Events: Src Security Result Associations Country Code"
      sql: LEFT JOIN UNNEST(${events__src__security_result__associations.country_code}) as events__src__security_result__associations__country_code ;;
      relationship: one_to_many
    }
    join: events__src__security_result__attack_details__tactics {
      view_label: "Events: Src Security Result Attack Details Tactics"
      sql: LEFT JOIN UNNEST(${events__src__security_result.attack_details__tactics}) as events__src__security_result__attack_details__tactics ;;
      relationship: one_to_many
    }
    join: events__src__domain__billing__attribute__permissions {
      view_label: "Events: Src Domain Billing Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__domain__billing__attribute__permissions}) as events__src__domain__billing__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__dns__answers {
      view_label: "Events: About Ip Geo Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__dns__answers}) as events__about__ip_geo_artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__about__resource_ancestors__attribute__roles {
      view_label: "Events: About Resource Ancestors Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about__resource_ancestors.attribute__roles}) as events__about__resource_ancestors__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__resource_ancestors__attribute__labels {
      view_label: "Events: About Resource Ancestors Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about__resource_ancestors.attribute__labels}) as events__about__resource_ancestors__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__user_management_chain__group_identifiers {
      view_label: "Events: About User Management Chain Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__about__user_management_chain.group_identifiers}) as events__about__user_management_chain__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__about__security_result__associations__alias {
      view_label: "Events: About Security Result Associations Alias"
      sql: LEFT JOIN UNNEST(${events__about__security_result__associations.alias}) as events__about__security_result__associations__alias ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__embedded_domains {
      view_label: "Events: About Process Ancestors File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__embedded_domains}) as events__about__process_ancestors__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__about__domain__admin__attribute__permissions {
      view_label: "Events: About Domain Admin Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.domain__admin__attribute__permissions}) as events__about__domain__admin__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__email__cc {
      view_label: "Events: Intermediary Ip Geo Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__email__cc}) as events__intermediary__ip_geo_artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__dns__answers {
      view_label: "Events: Intermediary Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__dns__answers}) as events__intermediary__artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__intermediary__user_management_chain__department {
      view_label: "Events: Intermediary User Management Chain Department"
      sql: LEFT JOIN UNNEST(${events__intermediary__user_management_chain.department}) as events__intermediary__user_management_chain__department ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__category_details {
      view_label: "Events: Intermediary Security Result Category Details"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.category_details}) as events__intermediary__security_result__category_details ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__verdict_info {
      view_label: "Events: Intermediary Security Result Verdict Info"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.verdict_info}) as events__intermediary__security_result__verdict_info ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__tech__time_off {
      view_label: "Events: Intermediary Domain Tech Time Off"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__tech__time_off}) as events__intermediary__domain__tech__time_off ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__tech__attribute__roles {
      view_label: "Events: Intermediary Domain Tech Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__tech__attribute__roles}) as events__intermediary__domain__tech__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__tech__attribute__labels {
      view_label: "Events: Intermediary Domain Tech Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__tech__attribute__labels}) as events__intermediary__domain__tech__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__billing__group_identifiers {
      view_label: "Events: Intermediary Domain Billing Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__billing__group_identifiers}) as events__intermediary__domain__billing__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__zone__time_off {
      view_label: "Events: Intermediary Domain Zone Time Off"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__zone__time_off}) as events__intermediary__domain__zone__time_off ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__zone__attribute__roles {
      view_label: "Events: Intermediary Domain Zone Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__zone__attribute__roles}) as events__intermediary__domain__zone__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__zone__attribute__labels {
      view_label: "Events: Intermediary Domain Zone Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__zone__attribute__labels}) as events__intermediary__domain__zone__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__asset__attribute__permissions {
      view_label: "Events: Intermediary Asset Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.asset__attribute__permissions}) as events__intermediary__asset__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__dns__answers {
      view_label: "Events: Security Result About Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__dns__answers}) as events__security_result__about__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__group__email_addresses {
      view_label: "Events: Security Result About Group Email Addresses"
      sql: LEFT JOIN UNNEST(${events__security_result.about__group__email_addresses}) as events__security_result__about__group__email_addresses ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__admin__department {
      view_label: "Events: Security Result About Domain Admin Department"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__admin__department}) as events__security_result__about__domain__admin__department ;;
      relationship: one_to_many
    }
    join: events__target__file__signature_info__sigcheck__x509 {
      view_label: "Events: Target File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events.target__file__signature_info__sigcheck__x509}) as events__target__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__imports__functions {
      view_label: "Events: Target Process File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__target__process__file__pe_file__imports.functions}) as events__target__process__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__command_line_history {
      view_label: "Events: Target Process Ancestors Command Line History"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.command_line_history}) as events__target__process_ancestors__command_line_history ;;
      relationship: one_to_many
    }
    join: events__target__domain__tech__attribute__permissions {
      view_label: "Events: Target Domain Tech Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__domain__tech__attribute__permissions}) as events__target__domain__tech__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__target__domain__zone__attribute__permissions {
      view_label: "Events: Target Domain Zone Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__domain__zone__attribute__permissions}) as events__target__domain__zone__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__target__domain__registrant__time_off {
      view_label: "Events: Target Domain Registrant Time Off"
      sql: LEFT JOIN UNNEST(${events.target__domain__registrant__time_off}) as events__target__domain__registrant__time_off ;;
      relationship: one_to_many
    }
    join: events__target__domain__registrant__attribute__roles {
      view_label: "Events: Target Domain Registrant Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.target__domain__registrant__attribute__roles}) as events__target__domain__registrant__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__domain__registrant__attribute__labels {
      view_label: "Events: Target Domain Registrant Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.target__domain__registrant__attribute__labels}) as events__target__domain__registrant__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__network__http__parsed_user_agent__annotation {
      view_label: "Events: Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events.network__http__parsed_user_agent__annotation}) as events__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__smtp__rcpt_to {
      view_label: "Events: Principal Ip Geo Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__smtp__rcpt_to}) as events__principal__ip_geo_artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__principal__network__tls__client__supported_ciphers {
      view_label: "Events: Principal Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events.principal__network__tls__client__supported_ciphers}) as events__principal__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__principal__cloud__vpc__attribute__permissions {
      view_label: "Events: Principal Cloud Vpc Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__cloud__vpc__attribute__permissions}) as events__principal__cloud__vpc__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__imports {
      view_label: "Events: Principal Process File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__pe_file__imports}) as events__principal__process__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__detection_fields {
      view_label: "Events: Principal Security Result Detection Fields"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.detection_fields}) as events__principal__security_result__detection_fields ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__embedded_urls {
      view_label: "Events: Principal Process Ancestors File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__embedded_urls}) as events__principal__process_ancestors__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__email__subject {
      view_label: "Events: Observer Ip Geo Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__email__subject}) as events__observer__ip_geo_artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__smtp__server_response {
      view_label: "Events: Observer Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__smtp__server_response}) as events__observer__artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__resources_type_count {
      view_label: "Events: Observer File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events.observer__file__pe_file__resources_type_count}) as events__observer__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__signature_info__x509 {
      view_label: "Events: Observer File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events.observer__file__pe_file__signature_info__x509}) as events__observer__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__resource {
      view_label: "Events: Observer Process File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__pe_file__resource}) as events__observer__process__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__observer__user_management_chain__email_addresses {
      view_label: "Events: Observer User Management Chain Email Addresses"
      sql: LEFT JOIN UNNEST(${events__observer__user_management_chain.email_addresses}) as events__observer__user_management_chain__email_addresses ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__dns__additional {
      view_label: "Events: Src Ip Geo Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__dns__additional}) as events__src__ip_geo_artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__dns__questions {
      view_label: "Events: Src Ip Geo Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__dns__questions}) as events__src__ip_geo_artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__signature_info__signer {
      view_label: "Events: Src Process File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events.src__process__file__pe_file__signature_info__signer}) as events__src__process__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__src__user_management_chain__time_off {
      view_label: "Events: Src User Management Chain Time Off"
      sql: LEFT JOIN UNNEST(${events__src__user_management_chain.time_off}) as events__src__user_management_chain__time_off ;;
      relationship: one_to_many
    }
    join: events__src__user_management_chain__attribute__roles {
      view_label: "Events: Src User Management Chain Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__src__user_management_chain.attribute__roles}) as events__src__user_management_chain__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__src__user_management_chain__attribute__labels {
      view_label: "Events: Src User Management Chain Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__src__user_management_chain.attribute__labels}) as events__src__user_management_chain__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__cloud__project__attribute__permissions {
      view_label: "Events: About Cloud Project Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.cloud__project__attribute__permissions}) as events__about__cloud__project__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__signature_info__signers {
      view_label: "Events: About File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__about.file__pe_file__signature_info__signers}) as events__about__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__capabilities_tags {
      view_label: "Events: About Process Ancestors File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__capabilities_tags}) as events__about__process_ancestors__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__email__bcc {
      view_label: "Events: Intermediary Ip Geo Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__email__bcc}) as events__intermediary__ip_geo_artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__section {
      view_label: "Events: Intermediary Process File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__pe_file__section}) as events__intermediary__process__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__admin__time_off {
      view_label: "Events: Intermediary Domain Admin Time Off"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__admin__time_off}) as events__intermediary__domain__admin__time_off ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__admin__attribute__roles {
      view_label: "Events: Intermediary Domain Admin Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__admin__attribute__roles}) as events__intermediary__domain__admin__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__admin__attribute__labels {
      view_label: "Events: Intermediary Domain Admin Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__admin__attribute__labels}) as events__intermediary__domain__admin__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__registrant__email_addresses {
      view_label: "Events: Intermediary Domain Registrant Email Addresses"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__registrant__email_addresses}) as events__intermediary__domain__registrant__email_addresses ;;
      relationship: one_to_many
    }
    join: events__security_result__verdict_info__ioc_stats {
      view_label: "Events: Security Result Verdict Info Ioc Stats"
      sql: LEFT JOIN UNNEST(${events__security_result__verdict_info.ioc_stats}) as events__security_result__verdict_info__ioc_stats ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__dns__answers {
      view_label: "Events: Target Ip Geo Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__dns__answers}) as events__target__ip_geo_artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__target__resource_ancestors__attribute__roles {
      view_label: "Events: Target Resource Ancestors Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__target__resource_ancestors.attribute__roles}) as events__target__resource_ancestors__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__resource_ancestors__attribute__labels {
      view_label: "Events: Target Resource Ancestors Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__target__resource_ancestors.attribute__labels}) as events__target__resource_ancestors__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__user_management_chain__group_identifiers {
      view_label: "Events: Target User Management Chain Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__target__user_management_chain.group_identifiers}) as events__target__user_management_chain__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__target__security_result__associations__alias {
      view_label: "Events: Target Security Result Associations Alias"
      sql: LEFT JOIN UNNEST(${events__target__security_result__associations.alias}) as events__target__security_result__associations__alias ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__embedded_domains {
      view_label: "Events: Target Process Ancestors File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__embedded_domains}) as events__target__process_ancestors__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__target__domain__admin__attribute__permissions {
      view_label: "Events: Target Domain Admin Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__domain__admin__attribute__permissions}) as events__target__domain__admin__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__email__subject {
      view_label: "Events: Principal Ip Geo Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__email__subject}) as events__principal__ip_geo_artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__smtp__server_response {
      view_label: "Events: Principal Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__smtp__server_response}) as events__principal__artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__resources_type_count {
      view_label: "Events: Principal File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events.principal__file__pe_file__resources_type_count}) as events__principal__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__signature_info__x509 {
      view_label: "Events: Principal File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events.principal__file__pe_file__signature_info__x509}) as events__principal__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__resource {
      view_label: "Events: Principal Process File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__pe_file__resource}) as events__principal__process__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__principal__user_management_chain__email_addresses {
      view_label: "Events: Principal User Management Chain Email Addresses"
      sql: LEFT JOIN UNNEST(${events__principal__user_management_chain.email_addresses}) as events__principal__user_management_chain__email_addresses ;;
      relationship: one_to_many
    }
    join: events__observer__file__signature_info__sigcheck__x509 {
      view_label: "Events: Observer File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events.observer__file__signature_info__sigcheck__x509}) as events__observer__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__imports__functions {
      view_label: "Events: Observer Process File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__observer__process__file__pe_file__imports.functions}) as events__observer__process__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__command_line_history {
      view_label: "Events: Observer Process Ancestors Command Line History"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.command_line_history}) as events__observer__process_ancestors__command_line_history ;;
      relationship: one_to_many
    }
    join: events__observer__domain__tech__attribute__permissions {
      view_label: "Events: Observer Domain Tech Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__domain__tech__attribute__permissions}) as events__observer__domain__tech__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__domain__zone__attribute__permissions {
      view_label: "Events: Observer Domain Zone Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__domain__zone__attribute__permissions}) as events__observer__domain__zone__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__domain__registrant__time_off {
      view_label: "Events: Observer Domain Registrant Time Off"
      sql: LEFT JOIN UNNEST(${events.observer__domain__registrant__time_off}) as events__observer__domain__registrant__time_off ;;
      relationship: one_to_many
    }
    join: events__observer__domain__registrant__attribute__roles {
      view_label: "Events: Observer Domain Registrant Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.observer__domain__registrant__attribute__roles}) as events__observer__domain__registrant__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__domain__registrant__attribute__labels {
      view_label: "Events: Observer Domain Registrant Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.observer__domain__registrant__attribute__labels}) as events__observer__domain__registrant__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__asset__ip {
      view_label: "Events: Extensions Vulns Vulnerabilities About Asset Ip"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__asset__ip}) as events__extensions__vulns__vulnerabilities__about__asset__ip ;;
      relationship: one_to_many
    }
    join: events__src__process__file__signature_info__sigcheck__signer {
      view_label: "Events: Src Process File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events.src__process__file__signature_info__sigcheck__signer}) as events__src__process__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__section {
      view_label: "Events: Src Process Ancestors File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__pe_file__section}) as events__src__process_ancestors__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__dns__authority {
      view_label: "Events: About Ip Geo Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__dns__authority}) as events__about__ip_geo_artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__dhcp__options {
      view_label: "Events: About Ip Geo Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__dhcp__options}) as events__about__ip_geo_artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__resources_language_count {
      view_label: "Events: About File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__about.file__pe_file__resources_language_count}) as events__about__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__resources_type_count_str {
      view_label: "Events: About File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__about.file__pe_file__resources_type_count_str}) as events__about__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__about__file__signature_info__sigcheck__signers {
      view_label: "Events: About File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__about.file__signature_info__sigcheck__signers}) as events__about__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__about__security_result__associations__country_code {
      view_label: "Events: About Security Result Associations Country Code"
      sql: LEFT JOIN UNNEST(${events__about__security_result__associations.country_code}) as events__about__security_result__associations__country_code ;;
      relationship: one_to_many
    }
    join: events__about__security_result__attack_details__tactics {
      view_label: "Events: About Security Result Attack Details Tactics"
      sql: LEFT JOIN UNNEST(${events__about__security_result.attack_details__tactics}) as events__about__security_result__attack_details__tactics ;;
      relationship: one_to_many
    }
    join: events__about__domain__billing__attribute__permissions {
      view_label: "Events: About Domain Billing Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.domain__billing__attribute__permissions}) as events__about__domain__billing__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__email__to {
      view_label: "Events: Intermediary Ip Geo Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__email__to}) as events__intermediary__ip_geo_artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__dns__authority {
      view_label: "Events: Intermediary Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__dns__authority}) as events__intermediary__artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__dhcp__options {
      view_label: "Events: Intermediary Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__dhcp__options}) as events__intermediary__artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__intermediary__cloud__project__attribute__roles {
      view_label: "Events: Intermediary Cloud Project Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.cloud__project__attribute__roles}) as events__intermediary__cloud__project__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__cloud__project__attribute__labels {
      view_label: "Events: Intermediary Cloud Project Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.cloud__project__attribute__labels}) as events__intermediary__cloud__project__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__signature_info__signer {
      view_label: "Events: Intermediary File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__pe_file__signature_info__signer}) as events__intermediary__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__intermediary__group__attribute__permissions {
      view_label: "Events: Intermediary Group Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.group__attribute__permissions}) as events__intermediary__group__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__dns__authority {
      view_label: "Events: Security Result About Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__dns__authority}) as events__security_result__about__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__dhcp__options {
      view_label: "Events: Security Result About Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__dhcp__options}) as events__security_result__about__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__email__cc {
      view_label: "Events: Security Result About Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__email__cc}) as events__security_result__about__artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__section {
      view_label: "Events: Security Result About File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__pe_file__section}) as events__security_result__about__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__embedded_ips {
      view_label: "Events: Security Result About Process File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__embedded_ips}) as events__security_result__about__process__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__tech__phone_numbers {
      view_label: "Events: Security Result About Domain Tech Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__tech__phone_numbers}) as events__security_result__about__domain__tech__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__billing__department {
      view_label: "Events: Security Result About Domain Billing Department"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__billing__department}) as events__security_result__about__domain__billing__department ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__zone__phone_numbers {
      view_label: "Events: Security Result About Domain Zone Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__zone__phone_numbers}) as events__security_result__about__domain__zone__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user__time_off {
      view_label: "Events: Security Result About User Time Off"
      sql: LEFT JOIN UNNEST(${events__security_result.about__user__time_off}) as events__security_result__about__user__time_off ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user__attribute__roles {
      view_label: "Events: Security Result About User Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__user__attribute__roles}) as events__security_result__about__user__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user__attribute__labels {
      view_label: "Events: Security Result About User Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__user__attribute__labels}) as events__security_result__about__user__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__cloud__project__attribute__permissions {
      view_label: "Events: Target Cloud Project Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__cloud__project__attribute__permissions}) as events__target__cloud__project__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__signature_info__signers {
      view_label: "Events: Target File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events.target__file__pe_file__signature_info__signers}) as events__target__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__capabilities_tags {
      view_label: "Events: Target Process Ancestors File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__capabilities_tags}) as events__target__process_ancestors__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__principal__file__signature_info__sigcheck__x509 {
      view_label: "Events: Principal File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events.principal__file__signature_info__sigcheck__x509}) as events__principal__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__imports__functions {
      view_label: "Events: Principal Process File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__principal__process__file__pe_file__imports.functions}) as events__principal__process__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__command_line_history {
      view_label: "Events: Principal Process Ancestors Command Line History"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.command_line_history}) as events__principal__process_ancestors__command_line_history ;;
      relationship: one_to_many
    }
    join: events__principal__domain__tech__attribute__permissions {
      view_label: "Events: Principal Domain Tech Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__domain__tech__attribute__permissions}) as events__principal__domain__tech__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__domain__zone__attribute__permissions {
      view_label: "Events: Principal Domain Zone Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__domain__zone__attribute__permissions}) as events__principal__domain__zone__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__domain__registrant__time_off {
      view_label: "Events: Principal Domain Registrant Time Off"
      sql: LEFT JOIN UNNEST(${events.principal__domain__registrant__time_off}) as events__principal__domain__registrant__time_off ;;
      relationship: one_to_many
    }
    join: events__principal__domain__registrant__attribute__roles {
      view_label: "Events: Principal Domain Registrant Attribute Roles"
      sql: LEFT JOIN UNNEST(${events.principal__domain__registrant__attribute__roles}) as events__principal__domain__registrant__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__domain__registrant__attribute__labels {
      view_label: "Events: Principal Domain Registrant Attribute Labels"
      sql: LEFT JOIN UNNEST(${events.principal__domain__registrant__attribute__labels}) as events__principal__domain__registrant__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__dns__answers {
      view_label: "Events: Observer Ip Geo Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__dns__answers}) as events__observer__ip_geo_artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__observer__resource_ancestors__attribute__roles {
      view_label: "Events: Observer Resource Ancestors Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__observer__resource_ancestors.attribute__roles}) as events__observer__resource_ancestors__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__resource_ancestors__attribute__labels {
      view_label: "Events: Observer Resource Ancestors Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__observer__resource_ancestors.attribute__labels}) as events__observer__resource_ancestors__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__user_management_chain__group_identifiers {
      view_label: "Events: Observer User Management Chain Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__observer__user_management_chain.group_identifiers}) as events__observer__user_management_chain__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__associations__alias {
      view_label: "Events: Observer Security Result Associations Alias"
      sql: LEFT JOIN UNNEST(${events__observer__security_result__associations.alias}) as events__observer__security_result__associations__alias ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__embedded_domains {
      view_label: "Events: Observer Process Ancestors File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__embedded_domains}) as events__observer__process_ancestors__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__observer__domain__admin__attribute__permissions {
      view_label: "Events: Observer Domain Admin Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__domain__admin__attribute__permissions}) as events__observer__domain__admin__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__tags {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Tags"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__tags}) as events__extensions__vulns__vulnerabilities__about__file__tags ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__asset__mac {
      view_label: "Events: Extensions Vulns Vulnerabilities About Asset Mac"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__asset__mac}) as events__extensions__vulns__vulnerabilities__about__asset__mac ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__smtp__server_response {
      view_label: "Events: Src Ip Geo Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__smtp__server_response}) as events__src__ip_geo_artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__src__security_result__attack_details__techniques {
      view_label: "Events: Src Security Result Attack Details Techniques"
      sql: LEFT JOIN UNNEST(${events__src__security_result.attack_details__techniques}) as events__src__security_result__attack_details__techniques ;;
      relationship: one_to_many
    }
    join: events__src__domain__registrant__attribute__permissions {
      view_label: "Events: Src Domain Registrant Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.src__domain__registrant__attribute__permissions}) as events__src__domain__registrant__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__dns__additional {
      view_label: "Events: About Ip Geo Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__dns__additional}) as events__about__ip_geo_artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__dns__questions {
      view_label: "Events: About Ip Geo Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__dns__questions}) as events__about__ip_geo_artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__signature_info__signer {
      view_label: "Events: About Process File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__about.process__file__pe_file__signature_info__signer}) as events__about__process__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__about__user_management_chain__time_off {
      view_label: "Events: About User Management Chain Time Off"
      sql: LEFT JOIN UNNEST(${events__about__user_management_chain.time_off}) as events__about__user_management_chain__time_off ;;
      relationship: one_to_many
    }
    join: events__about__user_management_chain__attribute__roles {
      view_label: "Events: About User Management Chain Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__about__user_management_chain.attribute__roles}) as events__about__user_management_chain__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__about__user_management_chain__attribute__labels {
      view_label: "Events: About User Management Chain Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__about__user_management_chain.attribute__labels}) as events__about__user_management_chain__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__dns__additional {
      view_label: "Events: Intermediary Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__dns__additional}) as events__intermediary__artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__dns__questions {
      view_label: "Events: Intermediary Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__dns__questions}) as events__intermediary__artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__signature_info__sigcheck__signer {
      view_label: "Events: Intermediary File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__signature_info__sigcheck__signer}) as events__intermediary__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__intermediary__resource__attribute__permissions {
      view_label: "Events: Intermediary Resource Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.resource__attribute__permissions}) as events__intermediary__resource__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__user_management_chain__phone_numbers {
      view_label: "Events: Intermediary User Management Chain Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__intermediary__user_management_chain.phone_numbers}) as events__intermediary__user_management_chain__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__embedded_ips {
      view_label: "Events: Intermediary Process Ancestors File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__embedded_ips}) as events__intermediary__process_ancestors__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__billing__time_off {
      view_label: "Events: Intermediary Domain Billing Time Off"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__billing__time_off}) as events__intermediary__domain__billing__time_off ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__billing__attribute__roles {
      view_label: "Events: Intermediary Domain Billing Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__billing__attribute__roles}) as events__intermediary__domain__billing__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__billing__attribute__labels {
      view_label: "Events: Intermediary Domain Billing Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__billing__attribute__labels}) as events__intermediary__domain__billing__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__registrant__group_identifiers {
      view_label: "Events: Intermediary Domain Registrant Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__registrant__group_identifiers}) as events__intermediary__domain__registrant__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__security_result__associations__industries_affected {
      view_label: "Events: Security Result Associations Industries Affected"
      sql: LEFT JOIN UNNEST(${events__security_result__associations.industries_affected}) as events__security_result__associations__industries_affected ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__dns__additional {
      view_label: "Events: Security Result About Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__dns__additional}) as events__security_result__about__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__dns__questions {
      view_label: "Events: Security Result About Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__dns__questions}) as events__security_result__about__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__email__bcc {
      view_label: "Events: Security Result About Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__email__bcc}) as events__security_result__about__artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__embedded_urls {
      view_label: "Events: Security Result About Process File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__embedded_urls}) as events__security_result__about__process__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__admin__phone_numbers {
      view_label: "Events: Security Result About Domain Admin Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__admin__phone_numbers}) as events__security_result__about__domain__admin__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__vulnerabilities {
      view_label: "Events: Security Result About Asset Vulnerabilities"
      sql: LEFT JOIN UNNEST(${events__security_result.about__asset__vulnerabilities}) as events__security_result__about__asset__vulnerabilities ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__attribute__roles {
      view_label: "Events: Security Result About Asset Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__asset__attribute__roles}) as events__security_result__about__asset__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__attribute__labels {
      view_label: "Events: Security Result About Asset Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__asset__attribute__labels}) as events__security_result__about__asset__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__dns__authority {
      view_label: "Events: Target Ip Geo Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__dns__authority}) as events__target__ip_geo_artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__dhcp__options {
      view_label: "Events: Target Ip Geo Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__dhcp__options}) as events__target__ip_geo_artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__resources_language_count {
      view_label: "Events: Target File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events.target__file__pe_file__resources_language_count}) as events__target__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__resources_type_count_str {
      view_label: "Events: Target File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events.target__file__pe_file__resources_type_count_str}) as events__target__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__target__file__signature_info__sigcheck__signers {
      view_label: "Events: Target File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events.target__file__signature_info__sigcheck__signers}) as events__target__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__target__security_result__associations__country_code {
      view_label: "Events: Target Security Result Associations Country Code"
      sql: LEFT JOIN UNNEST(${events__target__security_result__associations.country_code}) as events__target__security_result__associations__country_code ;;
      relationship: one_to_many
    }
    join: events__target__security_result__attack_details__tactics {
      view_label: "Events: Target Security Result Attack Details Tactics"
      sql: LEFT JOIN UNNEST(${events__target__security_result.attack_details__tactics}) as events__target__security_result__attack_details__tactics ;;
      relationship: one_to_many
    }
    join: events__target__domain__billing__attribute__permissions {
      view_label: "Events: Target Domain Billing Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__domain__billing__attribute__permissions}) as events__target__domain__billing__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__dns__answers {
      view_label: "Events: Principal Ip Geo Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__dns__answers}) as events__principal__ip_geo_artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__principal__resource_ancestors__attribute__roles {
      view_label: "Events: Principal Resource Ancestors Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__principal__resource_ancestors.attribute__roles}) as events__principal__resource_ancestors__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__resource_ancestors__attribute__labels {
      view_label: "Events: Principal Resource Ancestors Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__principal__resource_ancestors.attribute__labels}) as events__principal__resource_ancestors__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__user_management_chain__group_identifiers {
      view_label: "Events: Principal User Management Chain Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__principal__user_management_chain.group_identifiers}) as events__principal__user_management_chain__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__associations__alias {
      view_label: "Events: Principal Security Result Associations Alias"
      sql: LEFT JOIN UNNEST(${events__principal__security_result__associations.alias}) as events__principal__security_result__associations__alias ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__embedded_domains {
      view_label: "Events: Principal Process Ancestors File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__embedded_domains}) as events__principal__process_ancestors__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__principal__domain__admin__attribute__permissions {
      view_label: "Events: Principal Domain Admin Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__domain__admin__attribute__permissions}) as events__principal__domain__admin__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__cloud__project__attribute__permissions {
      view_label: "Events: Observer Cloud Project Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__cloud__project__attribute__permissions}) as events__observer__cloud__project__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__signature_info__signers {
      view_label: "Events: Observer File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events.observer__file__pe_file__signature_info__signers}) as events__observer__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__capabilities_tags {
      view_label: "Events: Observer Process Ancestors File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__capabilities_tags}) as events__observer__process_ancestors__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__names {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Names"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__names}) as events__extensions__vulns__vulnerabilities__about__file__names ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__labels}) as events__extensions__vulns__vulnerabilities__about__labels ;;
      relationship: one_to_many
    }
    join: events__src__network__http__parsed_user_agent__annotation {
      view_label: "Events: Src Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events.src__network__http__parsed_user_agent__annotation}) as events__src__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Src Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__tls__client__supported_ciphers}) as events__src__artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__src__file__pe_file__resources_language_count_str {
      view_label: "Events: Src File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events.src__file__pe_file__resources_language_count_str}) as events__src__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__resources_type_count {
      view_label: "Events: Src Process File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events.src__process__file__pe_file__resources_type_count}) as events__src__process__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__signature_info__x509 {
      view_label: "Events: Src Process File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events.src__process__file__pe_file__signature_info__x509}) as events__src__process__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__src__resource_ancestors__attribute__permissions {
      view_label: "Events: Src Resource Ancestors Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__src__resource_ancestors.attribute__permissions}) as events__src__resource_ancestors__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__process__file__signature_info__sigcheck__signer {
      view_label: "Events: About Process File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__about.process__file__signature_info__sigcheck__signer}) as events__about__process__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__section {
      view_label: "Events: About Process Ancestors File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__pe_file__section}) as events__about__process_ancestors__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__smtp__rcpt_to {
      view_label: "Events: Intermediary Ip Geo Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__smtp__rcpt_to}) as events__intermediary__ip_geo_artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__tls__client__supported_ciphers {
      view_label: "Events: Intermediary Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__tls__client__supported_ciphers}) as events__intermediary__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__intermediary__cloud__vpc__attribute__permissions {
      view_label: "Events: Intermediary Cloud Vpc Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.cloud__vpc__attribute__permissions}) as events__intermediary__cloud__vpc__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__imports {
      view_label: "Events: Intermediary Process File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__pe_file__imports}) as events__intermediary__process__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__detection_fields {
      view_label: "Events: Intermediary Security Result Detection Fields"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.detection_fields}) as events__intermediary__security_result__detection_fields ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__embedded_urls {
      view_label: "Events: Intermediary Process Ancestors File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__embedded_urls}) as events__intermediary__process_ancestors__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__email__to {
      view_label: "Events: Security Result About Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__email__to}) as events__security_result__about__artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user_management_chain {
      view_label: "Events: Security Result About User Management Chain"
      sql: LEFT JOIN UNNEST(${events__security_result.about__user_management_chain}) as events__security_result__about__user_management_chain ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__tags {
      view_label: "Events: Security Result About Process Ancestors File Tags"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__tags}) as events__security_result__about__process_ancestors__file__tags ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__tech__email_addresses {
      view_label: "Events: Security Result About Domain Tech Email Addresses"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__tech__email_addresses}) as events__security_result__about__domain__tech__email_addresses ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__zone__email_addresses {
      view_label: "Events: Security Result About Domain Zone Email Addresses"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__zone__email_addresses}) as events__security_result__about__domain__zone__email_addresses ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__dns__additional {
      view_label: "Events: Target Ip Geo Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__dns__additional}) as events__target__ip_geo_artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__dns__questions {
      view_label: "Events: Target Ip Geo Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__dns__questions}) as events__target__ip_geo_artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__signature_info__signer {
      view_label: "Events: Target Process File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events.target__process__file__pe_file__signature_info__signer}) as events__target__process__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__target__user_management_chain__time_off {
      view_label: "Events: Target User Management Chain Time Off"
      sql: LEFT JOIN UNNEST(${events__target__user_management_chain.time_off}) as events__target__user_management_chain__time_off ;;
      relationship: one_to_many
    }
    join: events__target__user_management_chain__attribute__roles {
      view_label: "Events: Target User Management Chain Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__target__user_management_chain.attribute__roles}) as events__target__user_management_chain__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__target__user_management_chain__attribute__labels {
      view_label: "Events: Target User Management Chain Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__target__user_management_chain.attribute__labels}) as events__target__user_management_chain__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__cloud__project__attribute__permissions {
      view_label: "Events: Principal Cloud Project Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__cloud__project__attribute__permissions}) as events__principal__cloud__project__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__signature_info__signers {
      view_label: "Events: Principal File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events.principal__file__pe_file__signature_info__signers}) as events__principal__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__capabilities_tags {
      view_label: "Events: Principal Process Ancestors File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__capabilities_tags}) as events__principal__process_ancestors__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__dns__authority {
      view_label: "Events: Observer Ip Geo Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__dns__authority}) as events__observer__ip_geo_artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__dhcp__options {
      view_label: "Events: Observer Ip Geo Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__dhcp__options}) as events__observer__ip_geo_artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__resources_language_count {
      view_label: "Events: Observer File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events.observer__file__pe_file__resources_language_count}) as events__observer__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__resources_type_count_str {
      view_label: "Events: Observer File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events.observer__file__pe_file__resources_type_count_str}) as events__observer__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__observer__file__signature_info__sigcheck__signers {
      view_label: "Events: Observer File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events.observer__file__signature_info__sigcheck__signers}) as events__observer__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__associations__country_code {
      view_label: "Events: Observer Security Result Associations Country Code"
      sql: LEFT JOIN UNNEST(${events__observer__security_result__associations.country_code}) as events__observer__security_result__associations__country_code ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__attack_details__tactics {
      view_label: "Events: Observer Security Result Attack Details Tactics"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.attack_details__tactics}) as events__observer__security_result__attack_details__tactics ;;
      relationship: one_to_many
    }
    join: events__observer__domain__billing__attribute__permissions {
      view_label: "Events: Observer Domain Billing Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__domain__billing__attribute__permissions}) as events__observer__domain__billing__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__metadata__enrichment_labels__ingestion_kv_labels {
      view_label: "Events: Metadata Enrichment Labels Ingestion Kv Labels"
      sql: LEFT JOIN UNNEST(${events.metadata__enrichment_labels__ingestion_kv_labels}) as events__metadata__enrichment_labels__ingestion_kv_labels ;;
      relationship: one_to_many
    }
    join: events__src__process__file__signature_info__sigcheck__x509 {
      view_label: "Events: Src Process File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events.src__process__file__signature_info__sigcheck__x509}) as events__src__process__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__src__security_result__verdict_info__ioc_stats {
      view_label: "Events: Src Security Result Verdict Info Ioc Stats"
      sql: LEFT JOIN UNNEST(${events__src__security_result__verdict_info.ioc_stats}) as events__src__security_result__verdict_info__ioc_stats ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__imports {
      view_label: "Events: Src Process Ancestors File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__pe_file__imports}) as events__src__process_ancestors__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__smtp__server_response {
      view_label: "Events: About Ip Geo Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__smtp__server_response}) as events__about__ip_geo_artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__about__security_result__attack_details__techniques {
      view_label: "Events: About Security Result Attack Details Techniques"
      sql: LEFT JOIN UNNEST(${events__about__security_result.attack_details__techniques}) as events__about__security_result__attack_details__techniques ;;
      relationship: one_to_many
    }
    join: events__about__domain__registrant__attribute__permissions {
      view_label: "Events: About Domain Registrant Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about.domain__registrant__attribute__permissions}) as events__about__domain__registrant__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__email__subject {
      view_label: "Events: Intermediary Ip Geo Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__email__subject}) as events__intermediary__ip_geo_artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__smtp__server_response {
      view_label: "Events: Intermediary Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__smtp__server_response}) as events__intermediary__artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__resources_type_count {
      view_label: "Events: Intermediary File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__pe_file__resources_type_count}) as events__intermediary__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__signature_info__x509 {
      view_label: "Events: Intermediary File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__pe_file__signature_info__x509}) as events__intermediary__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__resource {
      view_label: "Events: Intermediary Process File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__pe_file__resource}) as events__intermediary__process__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__intermediary__user_management_chain__email_addresses {
      view_label: "Events: Intermediary User Management Chain Email Addresses"
      sql: LEFT JOIN UNNEST(${events__intermediary__user_management_chain.email_addresses}) as events__intermediary__user_management_chain__email_addresses ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__smtp__server_response {
      view_label: "Events: Security Result About Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__smtp__server_response}) as events__security_result__about__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__imports {
      view_label: "Events: Security Result About File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__pe_file__imports}) as events__security_result__about__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__security_result__about__group__attribute__roles {
      view_label: "Events: Security Result About Group Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__group__attribute__roles}) as events__security_result__about__group__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__group__attribute__labels {
      view_label: "Events: Security Result About Group Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__group__attribute__labels}) as events__security_result__about__group__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__command_line_history {
      view_label: "Events: Security Result About Process Command Line History"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__command_line_history}) as events__security_result__about__process__command_line_history ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__names {
      view_label: "Events: Security Result About Process Ancestors File Names"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__names}) as events__security_result__about__process_ancestors__file__names ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__admin__email_addresses {
      view_label: "Events: Security Result About Domain Admin Email Addresses"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__admin__email_addresses}) as events__security_result__about__domain__admin__email_addresses ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__billing__phone_numbers {
      view_label: "Events: Security Result About Domain Billing Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__billing__phone_numbers}) as events__security_result__about__domain__billing__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__registrant__department {
      view_label: "Events: Security Result About Domain Registrant Department"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__registrant__department}) as events__security_result__about__domain__registrant__department ;;
      relationship: one_to_many
    }
    join: events__target__process__file__signature_info__sigcheck__signer {
      view_label: "Events: Target Process File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events.target__process__file__signature_info__sigcheck__signer}) as events__target__process__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__section {
      view_label: "Events: Target Process Ancestors File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__pe_file__section}) as events__target__process_ancestors__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__dns__authority {
      view_label: "Events: Principal Ip Geo Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__dns__authority}) as events__principal__ip_geo_artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__dhcp__options {
      view_label: "Events: Principal Ip Geo Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__dhcp__options}) as events__principal__ip_geo_artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__resources_language_count {
      view_label: "Events: Principal File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events.principal__file__pe_file__resources_language_count}) as events__principal__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__resources_type_count_str {
      view_label: "Events: Principal File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events.principal__file__pe_file__resources_type_count_str}) as events__principal__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__principal__file__signature_info__sigcheck__signers {
      view_label: "Events: Principal File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events.principal__file__signature_info__sigcheck__signers}) as events__principal__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__associations__country_code {
      view_label: "Events: Principal Security Result Associations Country Code"
      sql: LEFT JOIN UNNEST(${events__principal__security_result__associations.country_code}) as events__principal__security_result__associations__country_code ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__attack_details__tactics {
      view_label: "Events: Principal Security Result Attack Details Tactics"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.attack_details__tactics}) as events__principal__security_result__attack_details__tactics ;;
      relationship: one_to_many
    }
    join: events__principal__domain__billing__attribute__permissions {
      view_label: "Events: Principal Domain Billing Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__domain__billing__attribute__permissions}) as events__principal__domain__billing__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__dns__additional {
      view_label: "Events: Observer Ip Geo Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__dns__additional}) as events__observer__ip_geo_artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__dns__questions {
      view_label: "Events: Observer Ip Geo Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__dns__questions}) as events__observer__ip_geo_artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__signature_info__signer {
      view_label: "Events: Observer Process File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__pe_file__signature_info__signer}) as events__observer__process__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__observer__user_management_chain__time_off {
      view_label: "Events: Observer User Management Chain Time Off"
      sql: LEFT JOIN UNNEST(${events__observer__user_management_chain.time_off}) as events__observer__user_management_chain__time_off ;;
      relationship: one_to_many
    }
    join: events__observer__user_management_chain__attribute__roles {
      view_label: "Events: Observer User Management Chain Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__observer__user_management_chain.attribute__roles}) as events__observer__user_management_chain__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__observer__user_management_chain__attribute__labels {
      view_label: "Events: Observer User Management Chain Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__observer__user_management_chain.attribute__labels}) as events__observer__user_management_chain__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__asset__nat_ip {
      view_label: "Events: Extensions Vulns Vulnerabilities About Asset Nat Ip"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__asset__nat_ip}) as events__extensions__vulns__vulnerabilities__about__asset__nat_ip ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__resource {
      view_label: "Events: Src Process Ancestors File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__pe_file__resource}) as events__src__process_ancestors__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__about__network__http__parsed_user_agent__annotation {
      view_label: "Events: About Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__about.network__http__parsed_user_agent__annotation}) as events__about__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__tls__client__supported_ciphers {
      view_label: "Events: About Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__tls__client__supported_ciphers}) as events__about__artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__about__file__pe_file__resources_language_count_str {
      view_label: "Events: About File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__about.file__pe_file__resources_language_count_str}) as events__about__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__resources_type_count {
      view_label: "Events: About Process File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__about.process__file__pe_file__resources_type_count}) as events__about__process__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__signature_info__x509 {
      view_label: "Events: About Process File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__about.process__file__pe_file__signature_info__x509}) as events__about__process__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__about__resource_ancestors__attribute__permissions {
      view_label: "Events: About Resource Ancestors Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about__resource_ancestors.attribute__permissions}) as events__about__resource_ancestors__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__signature_info__sigcheck__x509 {
      view_label: "Events: Intermediary File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__signature_info__sigcheck__x509}) as events__intermediary__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__imports__functions {
      view_label: "Events: Intermediary Process File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__intermediary__process__file__pe_file__imports.functions}) as events__intermediary__process__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__command_line_history {
      view_label: "Events: Intermediary Process Ancestors Command Line History"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.command_line_history}) as events__intermediary__process_ancestors__command_line_history ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__tech__attribute__permissions {
      view_label: "Events: Intermediary Domain Tech Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__tech__attribute__permissions}) as events__intermediary__domain__tech__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__zone__attribute__permissions {
      view_label: "Events: Intermediary Domain Zone Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__zone__attribute__permissions}) as events__intermediary__domain__zone__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__registrant__time_off {
      view_label: "Events: Intermediary Domain Registrant Time Off"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__registrant__time_off}) as events__intermediary__domain__registrant__time_off ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__registrant__attribute__roles {
      view_label: "Events: Intermediary Domain Registrant Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__registrant__attribute__roles}) as events__intermediary__domain__registrant__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__registrant__attribute__labels {
      view_label: "Events: Intermediary Domain Registrant Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__registrant__attribute__labels}) as events__intermediary__domain__registrant__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__smtp__rcpt_to {
      view_label: "Events: Security Result About Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__smtp__rcpt_to}) as events__security_result__about__artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__resource {
      view_label: "Events: Security Result About File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__pe_file__resource}) as events__security_result__about__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__embedded_domains {
      view_label: "Events: Security Result About Process File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__embedded_domains}) as events__security_result__about__process__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__security_result__about__resource__attribute__roles {
      view_label: "Events: Security Result About Resource Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__resource__attribute__roles}) as events__security_result__about__resource__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__resource__attribute__labels {
      view_label: "Events: Security Result About Resource Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__resource__attribute__labels}) as events__security_result__about__resource__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__tech__group_identifiers {
      view_label: "Events: Security Result About Domain Tech Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__tech__group_identifiers}) as events__security_result__about__domain__tech__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__zone__group_identifiers {
      view_label: "Events: Security Result About Domain Zone Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__zone__group_identifiers}) as events__security_result__about__domain__zone__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__smtp__server_response {
      view_label: "Events: Target Ip Geo Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__smtp__server_response}) as events__target__ip_geo_artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__target__security_result__attack_details__techniques {
      view_label: "Events: Target Security Result Attack Details Techniques"
      sql: LEFT JOIN UNNEST(${events__target__security_result.attack_details__techniques}) as events__target__security_result__attack_details__techniques ;;
      relationship: one_to_many
    }
    join: events__target__domain__registrant__attribute__permissions {
      view_label: "Events: Target Domain Registrant Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.target__domain__registrant__attribute__permissions}) as events__target__domain__registrant__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__dns__additional {
      view_label: "Events: Principal Ip Geo Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__dns__additional}) as events__principal__ip_geo_artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__dns__questions {
      view_label: "Events: Principal Ip Geo Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__dns__questions}) as events__principal__ip_geo_artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__signature_info__signer {
      view_label: "Events: Principal Process File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__pe_file__signature_info__signer}) as events__principal__process__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__principal__user_management_chain__time_off {
      view_label: "Events: Principal User Management Chain Time Off"
      sql: LEFT JOIN UNNEST(${events__principal__user_management_chain.time_off}) as events__principal__user_management_chain__time_off ;;
      relationship: one_to_many
    }
    join: events__principal__user_management_chain__attribute__roles {
      view_label: "Events: Principal User Management Chain Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__principal__user_management_chain.attribute__roles}) as events__principal__user_management_chain__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__principal__user_management_chain__attribute__labels {
      view_label: "Events: Principal User Management Chain Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__principal__user_management_chain.attribute__labels}) as events__principal__user_management_chain__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__signature_info__sigcheck__signer {
      view_label: "Events: Observer Process File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__signature_info__sigcheck__signer}) as events__observer__process__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__section {
      view_label: "Events: Observer Process Ancestors File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__pe_file__section}) as events__observer__process_ancestors__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__signature_info__signers {
      view_label: "Events: Src Process File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events.src__process__file__pe_file__signature_info__signers}) as events__src__process__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__src__user_management_chain__attribute__permissions {
      view_label: "Events: Src User Management Chain Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__src__user_management_chain.attribute__permissions}) as events__src__user_management_chain__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__src__security_result__associations__industries_affected {
      view_label: "Events: Src Security Result Associations Industries Affected"
      sql: LEFT JOIN UNNEST(${events__src__security_result__associations.industries_affected}) as events__src__security_result__associations__industries_affected ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__imports__functions {
      view_label: "Events: Src Process Ancestors File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors__file__pe_file__imports.functions}) as events__src__process_ancestors__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__about__process__file__signature_info__sigcheck__x509 {
      view_label: "Events: About Process File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__about.process__file__signature_info__sigcheck__x509}) as events__about__process__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__about__security_result__verdict_info__ioc_stats {
      view_label: "Events: About Security Result Verdict Info Ioc Stats"
      sql: LEFT JOIN UNNEST(${events__about__security_result__verdict_info.ioc_stats}) as events__about__security_result__verdict_info__ioc_stats ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__imports {
      view_label: "Events: About Process Ancestors File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__pe_file__imports}) as events__about__process_ancestors__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__dns__answers {
      view_label: "Events: Intermediary Ip Geo Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__dns__answers}) as events__intermediary__ip_geo_artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__intermediary__resource_ancestors__attribute__roles {
      view_label: "Events: Intermediary Resource Ancestors Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary__resource_ancestors.attribute__roles}) as events__intermediary__resource_ancestors__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__resource_ancestors__attribute__labels {
      view_label: "Events: Intermediary Resource Ancestors Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary__resource_ancestors.attribute__labels}) as events__intermediary__resource_ancestors__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__intermediary__user_management_chain__group_identifiers {
      view_label: "Events: Intermediary User Management Chain Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__intermediary__user_management_chain.group_identifiers}) as events__intermediary__user_management_chain__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__associations__alias {
      view_label: "Events: Intermediary Security Result Associations Alias"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result__associations.alias}) as events__intermediary__security_result__associations__alias ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__embedded_domains {
      view_label: "Events: Intermediary Process Ancestors File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__embedded_domains}) as events__intermediary__process_ancestors__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__admin__attribute__permissions {
      view_label: "Events: Intermediary Domain Admin Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__admin__attribute__permissions}) as events__intermediary__domain__admin__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__email__subject {
      view_label: "Events: Security Result About Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__email__subject}) as events__security_result__about__artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__security_result__about__cloud__vpc__attribute__roles {
      view_label: "Events: Security Result About Cloud Vpc Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__cloud__vpc__attribute__roles}) as events__security_result__about__cloud__vpc__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__cloud__vpc__attribute__labels {
      view_label: "Events: Security Result About Cloud Vpc Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__cloud__vpc__attribute__labels}) as events__security_result__about__cloud__vpc__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__imports__functions {
      view_label: "Events: Security Result About File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__security_result__about__file__pe_file__imports.functions}) as events__security_result__about__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__capabilities_tags {
      view_label: "Events: Security Result About Process File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__capabilities_tags}) as events__security_result__about__process__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__admin__group_identifiers {
      view_label: "Events: Security Result About Domain Admin Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__admin__group_identifiers}) as events__security_result__about__domain__admin__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__billing__email_addresses {
      view_label: "Events: Security Result About Domain Billing Email Addresses"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__billing__email_addresses}) as events__security_result__about__domain__billing__email_addresses ;;
      relationship: one_to_many
    }
    join: events__target__network__http__parsed_user_agent__annotation {
      view_label: "Events: Target Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events.target__network__http__parsed_user_agent__annotation}) as events__target__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Target Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__tls__client__supported_ciphers}) as events__target__artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__target__file__pe_file__resources_language_count_str {
      view_label: "Events: Target File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events.target__file__pe_file__resources_language_count_str}) as events__target__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__resources_type_count {
      view_label: "Events: Target Process File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events.target__process__file__pe_file__resources_type_count}) as events__target__process__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__signature_info__x509 {
      view_label: "Events: Target Process File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events.target__process__file__pe_file__signature_info__x509}) as events__target__process__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__target__resource_ancestors__attribute__permissions {
      view_label: "Events: Target Resource Ancestors Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__target__resource_ancestors.attribute__permissions}) as events__target__resource_ancestors__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__signature_info__sigcheck__signer {
      view_label: "Events: Principal Process File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__signature_info__sigcheck__signer}) as events__principal__process__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__section {
      view_label: "Events: Principal Process Ancestors File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__pe_file__section}) as events__principal__process_ancestors__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__smtp__server_response {
      view_label: "Events: Observer Ip Geo Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__smtp__server_response}) as events__observer__ip_geo_artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__attack_details__techniques {
      view_label: "Events: Observer Security Result Attack Details Techniques"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.attack_details__techniques}) as events__observer__security_result__attack_details__techniques ;;
      relationship: one_to_many
    }
    join: events__observer__domain__registrant__attribute__permissions {
      view_label: "Events: Observer Domain Registrant Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.observer__domain__registrant__attribute__permissions}) as events__observer__domain__registrant__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__resources_language_count {
      view_label: "Events: Src Process File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events.src__process__file__pe_file__resources_language_count}) as events__src__process__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__resources_type_count_str {
      view_label: "Events: Src Process File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events.src__process__file__pe_file__resources_type_count_str}) as events__src__process__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__src__process__file__signature_info__sigcheck__signers {
      view_label: "Events: Src Process File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events.src__process__file__signature_info__sigcheck__signers}) as events__src__process__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__resource {
      view_label: "Events: About Process Ancestors File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__pe_file__resource}) as events__about__process_ancestors__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__intermediary__cloud__project__attribute__permissions {
      view_label: "Events: Intermediary Cloud Project Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.cloud__project__attribute__permissions}) as events__intermediary__cloud__project__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__signature_info__signers {
      view_label: "Events: Intermediary File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__pe_file__signature_info__signers}) as events__intermediary__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__capabilities_tags {
      view_label: "Events: Intermediary Process Ancestors File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__capabilities_tags}) as events__intermediary__process_ancestors__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__registrant__phone_numbers {
      view_label: "Events: Security Result About Domain Registrant Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__registrant__phone_numbers}) as events__security_result__about__domain__registrant__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__software__permissions {
      view_label: "Events: Security Result About Asset Software Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result__about__asset__software.permissions}) as events__security_result__about__asset__software__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user__attribute__permissions {
      view_label: "Events: Security Result About User Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__user__attribute__permissions}) as events__security_result__about__user__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__verdict__verdict__mandiant_sources {
      view_label: "Events: Security Result Verdict Verdict Mandiant Sources"
      sql: LEFT JOIN UNNEST(${events__security_result.verdict__verdict__mandiant_sources}) as events__security_result__verdict__verdict__mandiant_sources ;;
      relationship: one_to_many
    }
    join: events__target__process__file__signature_info__sigcheck__x509 {
      view_label: "Events: Target Process File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events.target__process__file__signature_info__sigcheck__x509}) as events__target__process__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__target__security_result__verdict_info__ioc_stats {
      view_label: "Events: Target Security Result Verdict Info Ioc Stats"
      sql: LEFT JOIN UNNEST(${events__target__security_result__verdict_info.ioc_stats}) as events__target__security_result__verdict_info__ioc_stats ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__imports {
      view_label: "Events: Target Process Ancestors File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__pe_file__imports}) as events__target__process_ancestors__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__smtp__server_response {
      view_label: "Events: Principal Ip Geo Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__smtp__server_response}) as events__principal__ip_geo_artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__attack_details__techniques {
      view_label: "Events: Principal Security Result Attack Details Techniques"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.attack_details__techniques}) as events__principal__security_result__attack_details__techniques ;;
      relationship: one_to_many
    }
    join: events__principal__domain__registrant__attribute__permissions {
      view_label: "Events: Principal Domain Registrant Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events.principal__domain__registrant__attribute__permissions}) as events__principal__domain__registrant__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__network__http__parsed_user_agent__annotation {
      view_label: "Events: Observer Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events.observer__network__http__parsed_user_agent__annotation}) as events__observer__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Observer Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__tls__client__supported_ciphers}) as events__observer__artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__observer__file__pe_file__resources_language_count_str {
      view_label: "Events: Observer File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events.observer__file__pe_file__resources_language_count_str}) as events__observer__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__resources_type_count {
      view_label: "Events: Observer Process File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__pe_file__resources_type_count}) as events__observer__process__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__signature_info__x509 {
      view_label: "Events: Observer Process File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__pe_file__signature_info__x509}) as events__observer__process__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__observer__resource_ancestors__attribute__permissions {
      view_label: "Events: Observer Resource Ancestors Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__observer__resource_ancestors.attribute__permissions}) as events__observer__resource_ancestors__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user__department {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Department"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__user__department}) as events__extensions__vulns__vulnerabilities__about__user__department ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__signature_info__signers {
      view_label: "Events: About Process File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__about.process__file__pe_file__signature_info__signers}) as events__about__process__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__about__user_management_chain__attribute__permissions {
      view_label: "Events: About User Management Chain Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__about__user_management_chain.attribute__permissions}) as events__about__user_management_chain__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__about__security_result__associations__industries_affected {
      view_label: "Events: About Security Result Associations Industries Affected"
      sql: LEFT JOIN UNNEST(${events__about__security_result__associations.industries_affected}) as events__about__security_result__associations__industries_affected ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__imports__functions {
      view_label: "Events: About Process Ancestors File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors__file__pe_file__imports.functions}) as events__about__process_ancestors__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__dns__authority {
      view_label: "Events: Intermediary Ip Geo Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__dns__authority}) as events__intermediary__ip_geo_artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__dhcp__options {
      view_label: "Events: Intermediary Ip Geo Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__dhcp__options}) as events__intermediary__ip_geo_artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__resources_language_count {
      view_label: "Events: Intermediary File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__pe_file__resources_language_count}) as events__intermediary__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__resources_type_count_str {
      view_label: "Events: Intermediary File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__pe_file__resources_type_count_str}) as events__intermediary__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__signature_info__sigcheck__signers {
      view_label: "Events: Intermediary File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__signature_info__sigcheck__signers}) as events__intermediary__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__associations__country_code {
      view_label: "Events: Intermediary Security Result Associations Country Code"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result__associations.country_code}) as events__intermediary__security_result__associations__country_code ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__attack_details__tactics {
      view_label: "Events: Intermediary Security Result Attack Details Tactics"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.attack_details__tactics}) as events__intermediary__security_result__attack_details__tactics ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__billing__attribute__permissions {
      view_label: "Events: Intermediary Domain Billing Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__billing__attribute__permissions}) as events__intermediary__domain__billing__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__email__cc {
      view_label: "Events: Security Result About Ip Geo Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__email__cc}) as events__security_result__about__ip_geo_artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__dns__answers {
      view_label: "Events: Security Result About Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__dns__answers}) as events__security_result__about__artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user_management_chain__department {
      view_label: "Events: Security Result About User Management Chain Department"
      sql: LEFT JOIN UNNEST(${events__security_result__about__user_management_chain.department}) as events__security_result__about__user_management_chain__department ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__tech__time_off {
      view_label: "Events: Security Result About Domain Tech Time Off"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__tech__time_off}) as events__security_result__about__domain__tech__time_off ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__tech__attribute__roles {
      view_label: "Events: Security Result About Domain Tech Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__tech__attribute__roles}) as events__security_result__about__domain__tech__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__tech__attribute__labels {
      view_label: "Events: Security Result About Domain Tech Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__tech__attribute__labels}) as events__security_result__about__domain__tech__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__billing__group_identifiers {
      view_label: "Events: Security Result About Domain Billing Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__billing__group_identifiers}) as events__security_result__about__domain__billing__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__zone__time_off {
      view_label: "Events: Security Result About Domain Zone Time Off"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__zone__time_off}) as events__security_result__about__domain__zone__time_off ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__zone__attribute__roles {
      view_label: "Events: Security Result About Domain Zone Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__zone__attribute__roles}) as events__security_result__about__domain__zone__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__zone__attribute__labels {
      view_label: "Events: Security Result About Domain Zone Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__zone__attribute__labels}) as events__security_result__about__domain__zone__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__asset__attribute__permissions {
      view_label: "Events: Security Result About Asset Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__asset__attribute__permissions}) as events__security_result__about__asset__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__resource {
      view_label: "Events: Target Process Ancestors File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__pe_file__resource}) as events__target__process_ancestors__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__principal__network__http__parsed_user_agent__annotation {
      view_label: "Events: Principal Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events.principal__network__http__parsed_user_agent__annotation}) as events__principal__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Principal Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__tls__client__supported_ciphers}) as events__principal__artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__principal__file__pe_file__resources_language_count_str {
      view_label: "Events: Principal File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events.principal__file__pe_file__resources_language_count_str}) as events__principal__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__resources_type_count {
      view_label: "Events: Principal Process File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__pe_file__resources_type_count}) as events__principal__process__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__signature_info__x509 {
      view_label: "Events: Principal Process File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__pe_file__signature_info__x509}) as events__principal__process__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__principal__resource_ancestors__attribute__permissions {
      view_label: "Events: Principal Resource Ancestors Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__principal__resource_ancestors.attribute__permissions}) as events__principal__resource_ancestors__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__signature_info__sigcheck__x509 {
      view_label: "Events: Observer Process File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__signature_info__sigcheck__x509}) as events__observer__process__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__verdict_info__ioc_stats {
      view_label: "Events: Observer Security Result Verdict Info Ioc Stats"
      sql: LEFT JOIN UNNEST(${events__observer__security_result__verdict_info.ioc_stats}) as events__observer__security_result__verdict_info__ioc_stats ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__imports {
      view_label: "Events: Observer Process Ancestors File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__pe_file__imports}) as events__observer__process_ancestors__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__email__cc {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__email__cc}) as events__extensions__vulns__vulnerabilities__about__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_location {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Location"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__ip_location}) as events__extensions__vulns__vulnerabilities__about__ip_location ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__asset__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Asset Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__asset__labels}) as events__extensions__vulns__vulnerabilities__about__asset__labels ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__resources_language_count {
      view_label: "Events: About Process File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__about.process__file__pe_file__resources_language_count}) as events__about__process__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__resources_type_count_str {
      view_label: "Events: About Process File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__about.process__file__pe_file__resources_type_count_str}) as events__about__process__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__about__process__file__signature_info__sigcheck__signers {
      view_label: "Events: About Process File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__about.process__file__signature_info__sigcheck__signers}) as events__about__process__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__dns__additional {
      view_label: "Events: Intermediary Ip Geo Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__dns__additional}) as events__intermediary__ip_geo_artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__dns__questions {
      view_label: "Events: Intermediary Ip Geo Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__dns__questions}) as events__intermediary__ip_geo_artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__signature_info__signer {
      view_label: "Events: Intermediary Process File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__pe_file__signature_info__signer}) as events__intermediary__process__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__intermediary__user_management_chain__time_off {
      view_label: "Events: Intermediary User Management Chain Time Off"
      sql: LEFT JOIN UNNEST(${events__intermediary__user_management_chain.time_off}) as events__intermediary__user_management_chain__time_off ;;
      relationship: one_to_many
    }
    join: events__intermediary__user_management_chain__attribute__roles {
      view_label: "Events: Intermediary User Management Chain Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__intermediary__user_management_chain.attribute__roles}) as events__intermediary__user_management_chain__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__intermediary__user_management_chain__attribute__labels {
      view_label: "Events: Intermediary User Management Chain Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__intermediary__user_management_chain.attribute__labels}) as events__intermediary__user_management_chain__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__email__bcc {
      view_label: "Events: Security Result About Ip Geo Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__email__bcc}) as events__security_result__about__ip_geo_artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__section {
      view_label: "Events: Security Result About Process File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__pe_file__section}) as events__security_result__about__process__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__admin__time_off {
      view_label: "Events: Security Result About Domain Admin Time Off"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__admin__time_off}) as events__security_result__about__domain__admin__time_off ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__admin__attribute__roles {
      view_label: "Events: Security Result About Domain Admin Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__admin__attribute__roles}) as events__security_result__about__domain__admin__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__admin__attribute__labels {
      view_label: "Events: Security Result About Domain Admin Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__admin__attribute__labels}) as events__security_result__about__domain__admin__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__registrant__email_addresses {
      view_label: "Events: Security Result About Domain Registrant Email Addresses"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__registrant__email_addresses}) as events__security_result__about__domain__registrant__email_addresses ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__signature_info__signers {
      view_label: "Events: Target Process File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events.target__process__file__pe_file__signature_info__signers}) as events__target__process__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__target__user_management_chain__attribute__permissions {
      view_label: "Events: Target User Management Chain Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__target__user_management_chain.attribute__permissions}) as events__target__user_management_chain__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__target__security_result__associations__industries_affected {
      view_label: "Events: Target Security Result Associations Industries Affected"
      sql: LEFT JOIN UNNEST(${events__target__security_result__associations.industries_affected}) as events__target__security_result__associations__industries_affected ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__imports__functions {
      view_label: "Events: Target Process Ancestors File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors__file__pe_file__imports.functions}) as events__target__process_ancestors__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__signature_info__sigcheck__x509 {
      view_label: "Events: Principal Process File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__signature_info__sigcheck__x509}) as events__principal__process__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__verdict_info__ioc_stats {
      view_label: "Events: Principal Security Result Verdict Info Ioc Stats"
      sql: LEFT JOIN UNNEST(${events__principal__security_result__verdict_info.ioc_stats}) as events__principal__security_result__verdict_info__ioc_stats ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__imports {
      view_label: "Events: Principal Process Ancestors File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__pe_file__imports}) as events__principal__process_ancestors__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__resource {
      view_label: "Events: Observer Process Ancestors File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__pe_file__resource}) as events__observer__process_ancestors__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__email__bcc {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__email__bcc}) as events__extensions__vulns__vulnerabilities__about__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__embedded_ips {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__embedded_ips}) as events__extensions__vulns__vulnerabilities__about__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__tags {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Tags"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__tags}) as events__extensions__vulns__vulnerabilities__about__process__file__tags ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Src Ip Geo Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__tls__client__supported_ciphers}) as events__src__ip_geo_artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__signature_info__signer {
      view_label: "Events: Src Process Ancestors File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__pe_file__signature_info__signer}) as events__src__process_ancestors__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__signature_info__sigcheck__signer {
      view_label: "Events: Intermediary Process File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__signature_info__sigcheck__signer}) as events__intermediary__process__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__section {
      view_label: "Events: Intermediary Process Ancestors File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__pe_file__section}) as events__intermediary__process_ancestors__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__email__to {
      view_label: "Events: Security Result About Ip Geo Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__email__to}) as events__security_result__about__ip_geo_artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__dns__authority {
      view_label: "Events: Security Result About Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__dns__authority}) as events__security_result__about__artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__dhcp__options {
      view_label: "Events: Security Result About Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__dhcp__options}) as events__security_result__about__artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__security_result__about__cloud__project__attribute__roles {
      view_label: "Events: Security Result About Cloud Project Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__cloud__project__attribute__roles}) as events__security_result__about__cloud__project__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__cloud__project__attribute__labels {
      view_label: "Events: Security Result About Cloud Project Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__cloud__project__attribute__labels}) as events__security_result__about__cloud__project__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__signature_info__signer {
      view_label: "Events: Security Result About File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__pe_file__signature_info__signer}) as events__security_result__about__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__security_result__about__group__attribute__permissions {
      view_label: "Events: Security Result About Group Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__group__attribute__permissions}) as events__security_result__about__group__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__verdict__verdict__third_party_sources {
      view_label: "Events: Security Result Verdict Verdict Third Party Sources"
      sql: LEFT JOIN UNNEST(${events__security_result.verdict__verdict__third_party_sources}) as events__security_result__verdict__verdict__third_party_sources ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__resources_language_count {
      view_label: "Events: Target Process File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events.target__process__file__pe_file__resources_language_count}) as events__target__process__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__resources_type_count_str {
      view_label: "Events: Target Process File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events.target__process__file__pe_file__resources_type_count_str}) as events__target__process__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__target__process__file__signature_info__sigcheck__signers {
      view_label: "Events: Target Process File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events.target__process__file__signature_info__sigcheck__signers}) as events__target__process__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__resource {
      view_label: "Events: Principal Process Ancestors File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__pe_file__resource}) as events__principal__process_ancestors__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__signature_info__signers {
      view_label: "Events: Observer Process File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__pe_file__signature_info__signers}) as events__observer__process__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__observer__user_management_chain__attribute__permissions {
      view_label: "Events: Observer User Management Chain Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__observer__user_management_chain.attribute__permissions}) as events__observer__user_management_chain__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__associations__industries_affected {
      view_label: "Events: Observer Security Result Associations Industries Affected"
      sql: LEFT JOIN UNNEST(${events__observer__security_result__associations.industries_affected}) as events__observer__security_result__associations__industries_affected ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__imports__functions {
      view_label: "Events: Observer Process Ancestors File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors__file__pe_file__imports.functions}) as events__observer__process_ancestors__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__ip_geo_artifact}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__email__to {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Email To"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__email__to}) as events__extensions__vulns__vulnerabilities__about__network__email__to ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__embedded_urls {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__embedded_urls}) as events__extensions__vulns__vulnerabilities__about__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__names {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Names"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__names}) as events__extensions__vulns__vulnerabilities__about__process__file__names ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__name_server {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Name Server"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__name_server}) as events__extensions__vulns__vulnerabilities__about__domain__name_server ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__asset__hardware {
      view_label: "Events: Extensions Vulns Vulnerabilities About Asset Hardware"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__asset__hardware}) as events__extensions__vulns__vulnerabilities__about__asset__hardware ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user__phone_numbers {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__user__phone_numbers}) as events__extensions__vulns__vulnerabilities__about__user__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__src__process__file__pe_file__resources_language_count_str {
      view_label: "Events: Src Process File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events.src__process__file__pe_file__resources_language_count_str}) as events__src__process__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__src__security_result__verdict__verdict__mandiant_sources {
      view_label: "Events: Src Security Result Verdict Verdict Mandiant Sources"
      sql: LEFT JOIN UNNEST(${events__src__security_result.verdict__verdict__mandiant_sources}) as events__src__security_result__verdict__verdict__mandiant_sources ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__signature_info__sigcheck__signer {
      view_label: "Events: Src Process Ancestors File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__signature_info__sigcheck__signer}) as events__src__process_ancestors__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__smtp__server_response {
      view_label: "Events: Intermediary Ip Geo Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__smtp__server_response}) as events__intermediary__ip_geo_artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__attack_details__techniques {
      view_label: "Events: Intermediary Security Result Attack Details Techniques"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.attack_details__techniques}) as events__intermediary__security_result__attack_details__techniques ;;
      relationship: one_to_many
    }
    join: events__intermediary__domain__registrant__attribute__permissions {
      view_label: "Events: Intermediary Domain Registrant Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary.domain__registrant__attribute__permissions}) as events__intermediary__domain__registrant__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__dns__additional {
      view_label: "Events: Security Result About Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__dns__additional}) as events__security_result__about__artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__dns__questions {
      view_label: "Events: Security Result About Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__dns__questions}) as events__security_result__about__artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__signature_info__sigcheck__signer {
      view_label: "Events: Security Result About File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__signature_info__sigcheck__signer}) as events__security_result__about__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__security_result__about__resource__attribute__permissions {
      view_label: "Events: Security Result About Resource Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__resource__attribute__permissions}) as events__security_result__about__resource__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user_management_chain__phone_numbers {
      view_label: "Events: Security Result About User Management Chain Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__security_result__about__user_management_chain.phone_numbers}) as events__security_result__about__user_management_chain__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__embedded_ips {
      view_label: "Events: Security Result About Process Ancestors File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__embedded_ips}) as events__security_result__about__process_ancestors__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__billing__time_off {
      view_label: "Events: Security Result About Domain Billing Time Off"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__billing__time_off}) as events__security_result__about__domain__billing__time_off ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__billing__attribute__roles {
      view_label: "Events: Security Result About Domain Billing Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__billing__attribute__roles}) as events__security_result__about__domain__billing__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__billing__attribute__labels {
      view_label: "Events: Security Result About Domain Billing Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__billing__attribute__labels}) as events__security_result__about__domain__billing__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__registrant__group_identifiers {
      view_label: "Events: Security Result About Domain Registrant Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__registrant__group_identifiers}) as events__security_result__about__domain__registrant__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__signature_info__signers {
      view_label: "Events: Principal Process File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__pe_file__signature_info__signers}) as events__principal__process__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__principal__user_management_chain__attribute__permissions {
      view_label: "Events: Principal User Management Chain Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__principal__user_management_chain.attribute__permissions}) as events__principal__user_management_chain__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__associations__industries_affected {
      view_label: "Events: Principal Security Result Associations Industries Affected"
      sql: LEFT JOIN UNNEST(${events__principal__security_result__associations.industries_affected}) as events__principal__security_result__associations__industries_affected ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__imports__functions {
      view_label: "Events: Principal Process Ancestors File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors__file__pe_file__imports.functions}) as events__principal__process_ancestors__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__resources_language_count {
      view_label: "Events: Observer Process File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__pe_file__resources_language_count}) as events__observer__process__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__resources_type_count_str {
      view_label: "Events: Observer Process File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__pe_file__resources_type_count_str}) as events__observer__process__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__signature_info__sigcheck__signers {
      view_label: "Events: Observer Process File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__signature_info__sigcheck__signers}) as events__observer__process__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__asset__software {
      view_label: "Events: Extensions Vulns Vulnerabilities About Asset Software"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__asset__software}) as events__extensions__vulns__vulnerabilities__about__asset__software ;;
      relationship: one_to_many
    }
    join: events__src__artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Src Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events.src__artifact__network__http__parsed_user_agent__annotation}) as events__src__artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__tls__client__supported_ciphers {
      view_label: "Events: About Ip Geo Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__tls__client__supported_ciphers}) as events__about__ip_geo_artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__signature_info__signer {
      view_label: "Events: About Process Ancestors File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__pe_file__signature_info__signer}) as events__about__process_ancestors__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__intermediary__network__http__parsed_user_agent__annotation {
      view_label: "Events: Intermediary Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__intermediary.network__http__parsed_user_agent__annotation}) as events__intermediary__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Intermediary Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__tls__client__supported_ciphers}) as events__intermediary__artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__intermediary__file__pe_file__resources_language_count_str {
      view_label: "Events: Intermediary File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__intermediary.file__pe_file__resources_language_count_str}) as events__intermediary__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__resources_type_count {
      view_label: "Events: Intermediary Process File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__pe_file__resources_type_count}) as events__intermediary__process__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__signature_info__x509 {
      view_label: "Events: Intermediary Process File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__pe_file__signature_info__x509}) as events__intermediary__process__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__intermediary__resource_ancestors__attribute__permissions {
      view_label: "Events: Intermediary Resource Ancestors Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary__resource_ancestors.attribute__permissions}) as events__intermediary__resource_ancestors__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__smtp__rcpt_to {
      view_label: "Events: Security Result About Ip Geo Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__smtp__rcpt_to}) as events__security_result__about__ip_geo_artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__tls__client__supported_ciphers {
      view_label: "Events: Security Result About Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__tls__client__supported_ciphers}) as events__security_result__about__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__cloud__vpc__attribute__permissions {
      view_label: "Events: Security Result About Cloud Vpc Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__cloud__vpc__attribute__permissions}) as events__security_result__about__cloud__vpc__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__imports {
      view_label: "Events: Security Result About Process File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__pe_file__imports}) as events__security_result__about__process__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__embedded_urls {
      view_label: "Events: Security Result About Process Ancestors File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__embedded_urls}) as events__security_result__about__process_ancestors__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__resources_language_count {
      view_label: "Events: Principal Process File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__pe_file__resources_language_count}) as events__principal__process__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__resources_type_count_str {
      view_label: "Events: Principal Process File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__pe_file__resources_type_count_str}) as events__principal__process__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__signature_info__sigcheck__signers {
      view_label: "Events: Principal Process File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__signature_info__sigcheck__signers}) as events__principal__process__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__smtp__rcpt_to {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__smtp__rcpt_to}) as events__extensions__vulns__vulnerabilities__about__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user__email_addresses {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Email Addresses"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__user__email_addresses}) as events__extensions__vulns__vulnerabilities__about__user__email_addresses ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__resources_type_count {
      view_label: "Events: Src Process Ancestors File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__pe_file__resources_type_count}) as events__src__process_ancestors__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__signature_info__x509 {
      view_label: "Events: Src Process Ancestors File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__pe_file__signature_info__x509}) as events__src__process_ancestors__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__about__process__file__pe_file__resources_language_count_str {
      view_label: "Events: About Process File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__about.process__file__pe_file__resources_language_count_str}) as events__about__process__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__about__security_result__verdict__verdict__mandiant_sources {
      view_label: "Events: About Security Result Verdict Verdict Mandiant Sources"
      sql: LEFT JOIN UNNEST(${events__about__security_result.verdict__verdict__mandiant_sources}) as events__about__security_result__verdict__verdict__mandiant_sources ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__signature_info__sigcheck__signer {
      view_label: "Events: About Process Ancestors File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__signature_info__sigcheck__signer}) as events__about__process_ancestors__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__signature_info__sigcheck__x509 {
      view_label: "Events: Intermediary Process File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__signature_info__sigcheck__x509}) as events__intermediary__process__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__verdict_info__ioc_stats {
      view_label: "Events: Intermediary Security Result Verdict Info Ioc Stats"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result__verdict_info.ioc_stats}) as events__intermediary__security_result__verdict_info__ioc_stats ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__imports {
      view_label: "Events: Intermediary Process Ancestors File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__pe_file__imports}) as events__intermediary__process_ancestors__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__email__subject {
      view_label: "Events: Security Result About Ip Geo Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__email__subject}) as events__security_result__about__ip_geo_artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__smtp__server_response {
      view_label: "Events: Security Result About Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__smtp__server_response}) as events__security_result__about__artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__resources_type_count {
      view_label: "Events: Security Result About File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__pe_file__resources_type_count}) as events__security_result__about__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__signature_info__x509 {
      view_label: "Events: Security Result About File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__pe_file__signature_info__x509}) as events__security_result__about__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__resource {
      view_label: "Events: Security Result About Process File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__pe_file__resource}) as events__security_result__about__process__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user_management_chain__email_addresses {
      view_label: "Events: Security Result About User Management Chain Email Addresses"
      sql: LEFT JOIN UNNEST(${events__security_result__about__user_management_chain.email_addresses}) as events__security_result__about__user_management_chain__email_addresses ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Target Ip Geo Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__tls__client__supported_ciphers}) as events__target__ip_geo_artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__signature_info__signer {
      view_label: "Events: Target Process Ancestors File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__pe_file__signature_info__signer}) as events__target__process_ancestors__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__email__subject {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__email__subject}) as events__extensions__vulns__vulnerabilities__about__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__embedded_domains {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__embedded_domains}) as events__extensions__vulns__vulnerabilities__about__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__resource_ancestors {
      view_label: "Events: Extensions Vulns Vulnerabilities About Resource Ancestors"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__resource_ancestors}) as events__extensions__vulns__vulnerabilities__about__resource_ancestors ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process_ancestors}) as events__extensions__vulns__vulnerabilities__about__process_ancestors ;;
      relationship: one_to_many
    }
    join: events__src__security_result__verdict__verdict__third_party_sources {
      view_label: "Events: Src Security Result Verdict Verdict Third Party Sources"
      sql: LEFT JOIN UNNEST(${events__src__security_result.verdict__verdict__third_party_sources}) as events__src__security_result__verdict__verdict__third_party_sources ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__signature_info__sigcheck__x509 {
      view_label: "Events: Src Process Ancestors File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__signature_info__sigcheck__x509}) as events__src__process_ancestors__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__about__artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: About Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__about.artifact__network__http__parsed_user_agent__annotation}) as events__about__artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__resource {
      view_label: "Events: Intermediary Process Ancestors File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__pe_file__resource}) as events__intermediary__process_ancestors__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__signature_info__sigcheck__x509 {
      view_label: "Events: Security Result About File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__signature_info__sigcheck__x509}) as events__security_result__about__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__imports__functions {
      view_label: "Events: Security Result About Process File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process__file__pe_file__imports.functions}) as events__security_result__about__process__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__command_line_history {
      view_label: "Events: Security Result About Process Ancestors Command Line History"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.command_line_history}) as events__security_result__about__process_ancestors__command_line_history ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__tech__attribute__permissions {
      view_label: "Events: Security Result About Domain Tech Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__tech__attribute__permissions}) as events__security_result__about__domain__tech__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__zone__attribute__permissions {
      view_label: "Events: Security Result About Domain Zone Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__zone__attribute__permissions}) as events__security_result__about__domain__zone__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__registrant__time_off {
      view_label: "Events: Security Result About Domain Registrant Time Off"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__registrant__time_off}) as events__security_result__about__domain__registrant__time_off ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__registrant__attribute__roles {
      view_label: "Events: Security Result About Domain Registrant Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__registrant__attribute__roles}) as events__security_result__about__domain__registrant__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__registrant__attribute__labels {
      view_label: "Events: Security Result About Domain Registrant Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__registrant__attribute__labels}) as events__security_result__about__domain__registrant__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__target__process__file__pe_file__resources_language_count_str {
      view_label: "Events: Target Process File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events.target__process__file__pe_file__resources_language_count_str}) as events__target__process__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__target__security_result__verdict__verdict__mandiant_sources {
      view_label: "Events: Target Security Result Verdict Verdict Mandiant Sources"
      sql: LEFT JOIN UNNEST(${events__target__security_result.verdict__verdict__mandiant_sources}) as events__target__security_result__verdict__verdict__mandiant_sources ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__signature_info__sigcheck__signer {
      view_label: "Events: Target Process Ancestors File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__signature_info__sigcheck__signer}) as events__target__process_ancestors__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Observer Ip Geo Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__tls__client__supported_ciphers}) as events__observer__ip_geo_artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__signature_info__signer {
      view_label: "Events: Observer Process Ancestors File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__pe_file__signature_info__signer}) as events__observer__process_ancestors__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__capabilities_tags {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__capabilities_tags}) as events__extensions__vulns__vulnerabilities__about__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__action {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Action"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__security_result__action}) as events__extensions__vulns__vulnerabilities__about__security_result__action ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__tech__department {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Tech Department"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__tech__department}) as events__extensions__vulns__vulnerabilities__about__domain__tech__department ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__zone__department {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Zone Department"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__zone__department}) as events__extensions__vulns__vulnerabilities__about__domain__zone__department ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__investigation__comments {
      view_label: "Events: Extensions Vulns Vulnerabilities About Investigation Comments"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__investigation__comments}) as events__extensions__vulns__vulnerabilities__about__investigation__comments ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user__group_identifiers {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__user__group_identifiers}) as events__extensions__vulns__vulnerabilities__about__user__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__resources_type_count {
      view_label: "Events: About Process Ancestors File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__pe_file__resources_type_count}) as events__about__process_ancestors__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__signature_info__x509 {
      view_label: "Events: About Process Ancestors File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__pe_file__signature_info__x509}) as events__about__process_ancestors__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__signature_info__signers {
      view_label: "Events: Intermediary Process File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__pe_file__signature_info__signers}) as events__intermediary__process__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__intermediary__user_management_chain__attribute__permissions {
      view_label: "Events: Intermediary User Management Chain Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__intermediary__user_management_chain.attribute__permissions}) as events__intermediary__user_management_chain__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__associations__industries_affected {
      view_label: "Events: Intermediary Security Result Associations Industries Affected"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result__associations.industries_affected}) as events__intermediary__security_result__associations__industries_affected ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__imports__functions {
      view_label: "Events: Intermediary Process Ancestors File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors__file__pe_file__imports.functions}) as events__intermediary__process_ancestors__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__dns__answers {
      view_label: "Events: Security Result About Ip Geo Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__dns__answers}) as events__security_result__about__ip_geo_artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__resource_ancestors__attribute__roles {
      view_label: "Events: Security Result About Resource Ancestors Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result__about__resource_ancestors.attribute__roles}) as events__security_result__about__resource_ancestors__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__resource_ancestors__attribute__labels {
      view_label: "Events: Security Result About Resource Ancestors Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result__about__resource_ancestors.attribute__labels}) as events__security_result__about__resource_ancestors__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user_management_chain__group_identifiers {
      view_label: "Events: Security Result About User Management Chain Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__security_result__about__user_management_chain.group_identifiers}) as events__security_result__about__user_management_chain__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__embedded_domains {
      view_label: "Events: Security Result About Process Ancestors File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__embedded_domains}) as events__security_result__about__process_ancestors__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__admin__attribute__permissions {
      view_label: "Events: Security Result About Domain Admin Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__admin__attribute__permissions}) as events__security_result__about__domain__admin__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__target__artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Target Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events.target__artifact__network__http__parsed_user_agent__annotation}) as events__target__artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Principal Ip Geo Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__tls__client__supported_ciphers}) as events__principal__ip_geo_artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__signature_info__signer {
      view_label: "Events: Principal Process Ancestors File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__pe_file__signature_info__signer}) as events__principal__process_ancestors__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__observer__process__file__pe_file__resources_language_count_str {
      view_label: "Events: Observer Process File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events.observer__process__file__pe_file__resources_language_count_str}) as events__observer__process__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__verdict__verdict__mandiant_sources {
      view_label: "Events: Observer Security Result Verdict Verdict Mandiant Sources"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.verdict__verdict__mandiant_sources}) as events__observer__security_result__verdict__verdict__mandiant_sources ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__signature_info__sigcheck__signer {
      view_label: "Events: Observer Process Ancestors File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__signature_info__sigcheck__signer}) as events__observer__process_ancestors__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__dns__answers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__dns__answers}) as events__extensions__vulns__vulnerabilities__about__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__group__email_addresses {
      view_label: "Events: Extensions Vulns Vulnerabilities About Group Email Addresses"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__group__email_addresses}) as events__extensions__vulns__vulnerabilities__about__group__email_addresses ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__security_result}) as events__extensions__vulns__vulnerabilities__about__security_result ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__admin__department {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Admin Department"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__admin__department}) as events__extensions__vulns__vulnerabilities__about__domain__admin__department ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__signature_info__signers {
      view_label: "Events: Src Process Ancestors File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__pe_file__signature_info__signers}) as events__src__process_ancestors__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__about__security_result__verdict__verdict__third_party_sources {
      view_label: "Events: About Security Result Verdict Verdict Third Party Sources"
      sql: LEFT JOIN UNNEST(${events__about__security_result.verdict__verdict__third_party_sources}) as events__about__security_result__verdict__verdict__third_party_sources ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__signature_info__sigcheck__x509 {
      view_label: "Events: About Process Ancestors File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__signature_info__sigcheck__x509}) as events__about__process_ancestors__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__resources_language_count {
      view_label: "Events: Intermediary Process File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__pe_file__resources_language_count}) as events__intermediary__process__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__resources_type_count_str {
      view_label: "Events: Intermediary Process File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__pe_file__resources_type_count_str}) as events__intermediary__process__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__signature_info__sigcheck__signers {
      view_label: "Events: Intermediary Process File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__signature_info__sigcheck__signers}) as events__intermediary__process__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__cloud__project__attribute__permissions {
      view_label: "Events: Security Result About Cloud Project Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__cloud__project__attribute__permissions}) as events__security_result__about__cloud__project__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__signature_info__signers {
      view_label: "Events: Security Result About File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__pe_file__signature_info__signers}) as events__security_result__about__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__capabilities_tags {
      view_label: "Events: Security Result About Process Ancestors File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__capabilities_tags}) as events__security_result__about__process_ancestors__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__resources_type_count {
      view_label: "Events: Target Process Ancestors File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__pe_file__resources_type_count}) as events__target__process_ancestors__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__signature_info__x509 {
      view_label: "Events: Target Process Ancestors File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__pe_file__signature_info__x509}) as events__target__process_ancestors__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__principal__process__file__pe_file__resources_language_count_str {
      view_label: "Events: Principal Process File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events.principal__process__file__pe_file__resources_language_count_str}) as events__principal__process__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__verdict__verdict__mandiant_sources {
      view_label: "Events: Principal Security Result Verdict Verdict Mandiant Sources"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.verdict__verdict__mandiant_sources}) as events__principal__security_result__verdict__verdict__mandiant_sources ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__signature_info__sigcheck__signer {
      view_label: "Events: Principal Process Ancestors File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__signature_info__sigcheck__signer}) as events__principal__process_ancestors__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__observer__artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Observer Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events.observer__artifact__network__http__parsed_user_agent__annotation}) as events__observer__artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__category {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Category"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.category}) as events__extensions__vulns__vulnerabilities__about__security_result__category ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__resources_language_count {
      view_label: "Events: Src Process Ancestors File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__pe_file__resources_language_count}) as events__src__process_ancestors__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__resources_type_count_str {
      view_label: "Events: Src Process Ancestors File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__pe_file__resources_type_count_str}) as events__src__process_ancestors__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__signature_info__sigcheck__signers {
      view_label: "Events: Src Process Ancestors File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__signature_info__sigcheck__signers}) as events__src__process_ancestors__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__dns__authority {
      view_label: "Events: Security Result About Ip Geo Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__dns__authority}) as events__security_result__about__ip_geo_artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__dhcp__options {
      view_label: "Events: Security Result About Ip Geo Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__dhcp__options}) as events__security_result__about__ip_geo_artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__resources_language_count {
      view_label: "Events: Security Result About File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__pe_file__resources_language_count}) as events__security_result__about__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__resources_type_count_str {
      view_label: "Events: Security Result About File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__pe_file__resources_type_count_str}) as events__security_result__about__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__signature_info__sigcheck__signers {
      view_label: "Events: Security Result About File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__signature_info__sigcheck__signers}) as events__security_result__about__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__billing__attribute__permissions {
      view_label: "Events: Security Result About Domain Billing Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__billing__attribute__permissions}) as events__security_result__about__domain__billing__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__target__security_result__verdict__verdict__third_party_sources {
      view_label: "Events: Target Security Result Verdict Verdict Third Party Sources"
      sql: LEFT JOIN UNNEST(${events__target__security_result.verdict__verdict__third_party_sources}) as events__target__security_result__verdict__verdict__third_party_sources ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__signature_info__sigcheck__x509 {
      view_label: "Events: Target Process Ancestors File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__signature_info__sigcheck__x509}) as events__target__process_ancestors__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__principal__artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Principal Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events.principal__artifact__network__http__parsed_user_agent__annotation}) as events__principal__artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__resources_type_count {
      view_label: "Events: Observer Process Ancestors File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__pe_file__resources_type_count}) as events__observer__process_ancestors__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__signature_info__x509 {
      view_label: "Events: Observer Process Ancestors File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__pe_file__signature_info__x509}) as events__observer__process_ancestors__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__dns__authority {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__dns__authority}) as events__extensions__vulns__vulnerabilities__about__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__dhcp__options {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__dhcp__options}) as events__extensions__vulns__vulnerabilities__about__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__email__cc {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__email__cc}) as events__extensions__vulns__vulnerabilities__about__artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__section {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__pe_file__section}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__embedded_ips {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__embedded_ips}) as events__extensions__vulns__vulnerabilities__about__process__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__campaigns {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Campaigns"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.campaigns}) as events__extensions__vulns__vulnerabilities__about__security_result__campaigns ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__tech__phone_numbers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Tech Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__tech__phone_numbers}) as events__extensions__vulns__vulnerabilities__about__domain__tech__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__billing__department {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Billing Department"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__billing__department}) as events__extensions__vulns__vulnerabilities__about__domain__billing__department ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__zone__phone_numbers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Zone Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__zone__phone_numbers}) as events__extensions__vulns__vulnerabilities__about__domain__zone__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user__time_off {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Time Off"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__user__time_off}) as events__extensions__vulns__vulnerabilities__about__user__time_off ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__user__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__user__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__user__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__user__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__signature_info__signers {
      view_label: "Events: About Process Ancestors File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__pe_file__signature_info__signers}) as events__about__process_ancestors__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__dns__additional {
      view_label: "Events: Security Result About Ip Geo Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__dns__additional}) as events__security_result__about__ip_geo_artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__dns__questions {
      view_label: "Events: Security Result About Ip Geo Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__dns__questions}) as events__security_result__about__ip_geo_artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__signature_info__signer {
      view_label: "Events: Security Result About Process File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__pe_file__signature_info__signer}) as events__security_result__about__process__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user_management_chain__time_off {
      view_label: "Events: Security Result About User Management Chain Time Off"
      sql: LEFT JOIN UNNEST(${events__security_result__about__user_management_chain.time_off}) as events__security_result__about__user_management_chain__time_off ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user_management_chain__attribute__roles {
      view_label: "Events: Security Result About User Management Chain Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__security_result__about__user_management_chain.attribute__roles}) as events__security_result__about__user_management_chain__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user_management_chain__attribute__labels {
      view_label: "Events: Security Result About User Management Chain Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__security_result__about__user_management_chain.attribute__labels}) as events__security_result__about__user_management_chain__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__resources_type_count {
      view_label: "Events: Principal Process Ancestors File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__pe_file__resources_type_count}) as events__principal__process_ancestors__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__signature_info__x509 {
      view_label: "Events: Principal Process Ancestors File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__pe_file__signature_info__x509}) as events__principal__process_ancestors__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__observer__security_result__verdict__verdict__third_party_sources {
      view_label: "Events: Observer Security Result Verdict Verdict Third Party Sources"
      sql: LEFT JOIN UNNEST(${events__observer__security_result.verdict__verdict__third_party_sources}) as events__observer__security_result__verdict__verdict__third_party_sources ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__signature_info__sigcheck__x509 {
      view_label: "Events: Observer Process Ancestors File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__signature_info__sigcheck__x509}) as events__observer__process_ancestors__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__dns__additional {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__dns__additional}) as events__extensions__vulns__vulnerabilities__about__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__dns__questions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__dns__questions}) as events__extensions__vulns__vulnerabilities__about__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__email__bcc {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__email__bcc}) as events__extensions__vulns__vulnerabilities__about__artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__embedded_urls {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__embedded_urls}) as events__extensions__vulns__vulnerabilities__about__process__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__admin__phone_numbers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Admin Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__admin__phone_numbers}) as events__extensions__vulns__vulnerabilities__about__domain__admin__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__asset__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Asset Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__asset__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__asset__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__asset__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Asset Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__asset__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__asset__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__src__ip_geo_artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Src Ip Geo Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__src__ip_geo_artifact.network__http__parsed_user_agent__annotation}) as events__src__ip_geo_artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__resources_language_count {
      view_label: "Events: About Process Ancestors File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__pe_file__resources_language_count}) as events__about__process_ancestors__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__resources_type_count_str {
      view_label: "Events: About Process Ancestors File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__pe_file__resources_type_count_str}) as events__about__process_ancestors__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__signature_info__sigcheck__signers {
      view_label: "Events: About Process Ancestors File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__signature_info__sigcheck__signers}) as events__about__process_ancestors__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Intermediary Ip Geo Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__tls__client__supported_ciphers}) as events__intermediary__ip_geo_artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__signature_info__signer {
      view_label: "Events: Intermediary Process Ancestors File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__pe_file__signature_info__signer}) as events__intermediary__process_ancestors__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__signature_info__sigcheck__signer {
      view_label: "Events: Security Result About Process File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__signature_info__sigcheck__signer}) as events__security_result__about__process__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__section {
      view_label: "Events: Security Result About Process Ancestors File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__pe_file__section}) as events__security_result__about__process_ancestors__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__signature_info__signers {
      view_label: "Events: Target Process Ancestors File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__pe_file__signature_info__signers}) as events__target__process_ancestors__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__principal__security_result__verdict__verdict__third_party_sources {
      view_label: "Events: Principal Security Result Verdict Verdict Third Party Sources"
      sql: LEFT JOIN UNNEST(${events__principal__security_result.verdict__verdict__third_party_sources}) as events__principal__security_result__verdict__verdict__third_party_sources ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__signature_info__sigcheck__x509 {
      view_label: "Events: Principal Process Ancestors File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__signature_info__sigcheck__x509}) as events__principal__process_ancestors__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__email__to {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__email__to}) as events__extensions__vulns__vulnerabilities__about__artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user_management_chain {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Management Chain"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__user_management_chain}) as events__extensions__vulns__vulnerabilities__about__user_management_chain ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__tags {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Tags"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__tags}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__tags ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__tech__email_addresses {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Tech Email Addresses"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__tech__email_addresses}) as events__extensions__vulns__vulnerabilities__about__domain__tech__email_addresses ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__zone__email_addresses {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Zone Email Addresses"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__zone__email_addresses}) as events__extensions__vulns__vulnerabilities__about__domain__zone__email_addresses ;;
      relationship: one_to_many
    }
    join: events__intermediary__process__file__pe_file__resources_language_count_str {
      view_label: "Events: Intermediary Process File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__intermediary.process__file__pe_file__resources_language_count_str}) as events__intermediary__process__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__verdict__verdict__mandiant_sources {
      view_label: "Events: Intermediary Security Result Verdict Verdict Mandiant Sources"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.verdict__verdict__mandiant_sources}) as events__intermediary__security_result__verdict__verdict__mandiant_sources ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__signature_info__sigcheck__signer {
      view_label: "Events: Intermediary Process Ancestors File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__signature_info__sigcheck__signer}) as events__intermediary__process_ancestors__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__smtp__server_response {
      view_label: "Events: Security Result About Ip Geo Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__smtp__server_response}) as events__security_result__about__ip_geo_artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__security_result__about__domain__registrant__attribute__permissions {
      view_label: "Events: Security Result About Domain Registrant Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result.about__domain__registrant__attribute__permissions}) as events__security_result__about__domain__registrant__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__resources_language_count {
      view_label: "Events: Target Process Ancestors File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__pe_file__resources_language_count}) as events__target__process_ancestors__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__resources_type_count_str {
      view_label: "Events: Target Process Ancestors File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__pe_file__resources_type_count_str}) as events__target__process_ancestors__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__signature_info__sigcheck__signers {
      view_label: "Events: Target Process Ancestors File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__signature_info__sigcheck__signers}) as events__target__process_ancestors__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__signature_info__signers {
      view_label: "Events: Observer Process Ancestors File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__pe_file__signature_info__signers}) as events__observer__process_ancestors__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__smtp__server_response {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__smtp__server_response}) as events__extensions__vulns__vulnerabilities__about__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__imports {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__pe_file__imports}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__group__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Group Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__group__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__group__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__group__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Group Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__group__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__group__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__command_line_history {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Command Line History"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__command_line_history}) as events__extensions__vulns__vulnerabilities__about__process__command_line_history ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__outcomes {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Outcomes"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.outcomes}) as events__extensions__vulns__vulnerabilities__about__security_result__outcomes ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__names {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Names"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__names}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__names ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__admin__email_addresses {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Admin Email Addresses"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__admin__email_addresses}) as events__extensions__vulns__vulnerabilities__about__domain__admin__email_addresses ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__billing__phone_numbers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Billing Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__billing__phone_numbers}) as events__extensions__vulns__vulnerabilities__about__domain__billing__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__registrant__department {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Registrant Department"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__registrant__department}) as events__extensions__vulns__vulnerabilities__about__domain__registrant__department ;;
      relationship: one_to_many
    }
    join: events__src__process_ancestors__file__pe_file__resources_language_count_str {
      view_label: "Events: Src Process Ancestors File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__src__process_ancestors.file__pe_file__resources_language_count_str}) as events__src__process_ancestors__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__about__ip_geo_artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: About Ip Geo Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__about__ip_geo_artifact.network__http__parsed_user_agent__annotation}) as events__about__ip_geo_artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__intermediary__artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Intermediary Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__intermediary.artifact__network__http__parsed_user_agent__annotation}) as events__intermediary__artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__security_result__about__network__http__parsed_user_agent__annotation {
      view_label: "Events: Security Result About Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__security_result.about__network__http__parsed_user_agent__annotation}) as events__security_result__about__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Security Result About Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__tls__client__supported_ciphers}) as events__security_result__about__artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__file__pe_file__resources_language_count_str {
      view_label: "Events: Security Result About File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__security_result.about__file__pe_file__resources_language_count_str}) as events__security_result__about__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__resources_type_count {
      view_label: "Events: Security Result About Process File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__pe_file__resources_type_count}) as events__security_result__about__process__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__signature_info__x509 {
      view_label: "Events: Security Result About Process File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__pe_file__signature_info__x509}) as events__security_result__about__process__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__security_result__about__resource_ancestors__attribute__permissions {
      view_label: "Events: Security Result About Resource Ancestors Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result__about__resource_ancestors.attribute__permissions}) as events__security_result__about__resource_ancestors__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__signature_info__signers {
      view_label: "Events: Principal Process Ancestors File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__pe_file__signature_info__signers}) as events__principal__process_ancestors__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__resources_language_count {
      view_label: "Events: Observer Process Ancestors File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__pe_file__resources_language_count}) as events__observer__process_ancestors__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__resources_type_count_str {
      view_label: "Events: Observer Process Ancestors File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__pe_file__resources_type_count_str}) as events__observer__process_ancestors__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__signature_info__sigcheck__signers {
      view_label: "Events: Observer Process Ancestors File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__signature_info__sigcheck__signers}) as events__observer__process_ancestors__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__smtp__rcpt_to {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__smtp__rcpt_to}) as events__extensions__vulns__vulnerabilities__about__artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__resource {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__pe_file__resource}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__embedded_domains {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__embedded_domains}) as events__extensions__vulns__vulnerabilities__about__process__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__resource__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Resource Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__resource__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__resource__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__resource__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Resource Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__resource__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__resource__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__tech__group_identifiers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Tech Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__tech__group_identifiers}) as events__extensions__vulns__vulnerabilities__about__domain__tech__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__zone__group_identifiers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Zone Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__zone__group_identifiers}) as events__extensions__vulns__vulnerabilities__about__domain__zone__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__resources_type_count {
      view_label: "Events: Intermediary Process Ancestors File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__pe_file__resources_type_count}) as events__intermediary__process_ancestors__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__signature_info__x509 {
      view_label: "Events: Intermediary Process Ancestors File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__pe_file__signature_info__x509}) as events__intermediary__process_ancestors__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__signature_info__sigcheck__x509 {
      view_label: "Events: Security Result About Process File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__signature_info__sigcheck__x509}) as events__security_result__about__process__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__imports {
      view_label: "Events: Security Result About Process Ancestors File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__pe_file__imports}) as events__security_result__about__process_ancestors__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__target__ip_geo_artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Target Ip Geo Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__target__ip_geo_artifact.network__http__parsed_user_agent__annotation}) as events__target__ip_geo_artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__resources_language_count {
      view_label: "Events: Principal Process Ancestors File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__pe_file__resources_language_count}) as events__principal__process_ancestors__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__resources_type_count_str {
      view_label: "Events: Principal Process Ancestors File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__pe_file__resources_type_count_str}) as events__principal__process_ancestors__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__signature_info__sigcheck__signers {
      view_label: "Events: Principal Process Ancestors File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__signature_info__sigcheck__signers}) as events__principal__process_ancestors__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__email__subject {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__email__subject}) as events__extensions__vulns__vulnerabilities__about__artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__cloud__vpc__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Cloud Vpc Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__cloud__vpc__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__cloud__vpc__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__cloud__vpc__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Cloud Vpc Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__cloud__vpc__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__cloud__vpc__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__imports__functions {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__file__pe_file__imports.functions}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__capabilities_tags {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__capabilities_tags}) as events__extensions__vulns__vulnerabilities__about__process__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__admin__group_identifiers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Admin Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__admin__group_identifiers}) as events__extensions__vulns__vulnerabilities__about__domain__admin__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__billing__email_addresses {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Billing Email Addresses"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__billing__email_addresses}) as events__extensions__vulns__vulnerabilities__about__domain__billing__email_addresses ;;
      relationship: one_to_many
    }
    join: events__about__process_ancestors__file__pe_file__resources_language_count_str {
      view_label: "Events: About Process Ancestors File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__about__process_ancestors.file__pe_file__resources_language_count_str}) as events__about__process_ancestors__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__intermediary__security_result__verdict__verdict__third_party_sources {
      view_label: "Events: Intermediary Security Result Verdict Verdict Third Party Sources"
      sql: LEFT JOIN UNNEST(${events__intermediary__security_result.verdict__verdict__third_party_sources}) as events__intermediary__security_result__verdict__verdict__third_party_sources ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__signature_info__sigcheck__x509 {
      view_label: "Events: Intermediary Process Ancestors File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__signature_info__sigcheck__x509}) as events__intermediary__process_ancestors__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__resource {
      view_label: "Events: Security Result About Process Ancestors File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__pe_file__resource}) as events__security_result__about__process_ancestors__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__observer__ip_geo_artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Observer Ip Geo Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__observer__ip_geo_artifact.network__http__parsed_user_agent__annotation}) as events__observer__ip_geo_artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__associations {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Associations"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.associations}) as events__extensions__vulns__vulnerabilities__about__security_result__associations ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__rule_labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Rule Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.rule_labels}) as events__extensions__vulns__vulnerabilities__about__security_result__rule_labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__registrant__phone_numbers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Registrant Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__registrant__phone_numbers}) as events__extensions__vulns__vulnerabilities__about__domain__registrant__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__asset__software__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Asset Software Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__asset__software.permissions}) as events__extensions__vulns__vulnerabilities__about__asset__software__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__user__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__user__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__signature_info__signers {
      view_label: "Events: Security Result About Process File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__pe_file__signature_info__signers}) as events__security_result__about__process__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__user_management_chain__attribute__permissions {
      view_label: "Events: Security Result About User Management Chain Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__security_result__about__user_management_chain.attribute__permissions}) as events__security_result__about__user_management_chain__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__imports__functions {
      view_label: "Events: Security Result About Process Ancestors File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors__file__pe_file__imports.functions}) as events__security_result__about__process_ancestors__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__target__process_ancestors__file__pe_file__resources_language_count_str {
      view_label: "Events: Target Process Ancestors File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__target__process_ancestors.file__pe_file__resources_language_count_str}) as events__target__process_ancestors__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__principal__ip_geo_artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Principal Ip Geo Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__principal__ip_geo_artifact.network__http__parsed_user_agent__annotation}) as events__principal__ip_geo_artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__email__cc {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Email Cc"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__email__cc}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__email__cc ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__dns__answers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__dns__answers}) as events__extensions__vulns__vulnerabilities__about__artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user_management_chain__department {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Management Chain Department"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__user_management_chain.department}) as events__extensions__vulns__vulnerabilities__about__user_management_chain__department ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__category_details {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Category Details"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.category_details}) as events__extensions__vulns__vulnerabilities__about__security_result__category_details ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__verdict_info {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Verdict Info"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.verdict_info}) as events__extensions__vulns__vulnerabilities__about__security_result__verdict_info ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__tech__time_off {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Tech Time Off"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__tech__time_off}) as events__extensions__vulns__vulnerabilities__about__domain__tech__time_off ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__tech__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Tech Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__tech__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__domain__tech__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__tech__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Tech Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__tech__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__domain__tech__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__billing__group_identifiers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Billing Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__billing__group_identifiers}) as events__extensions__vulns__vulnerabilities__about__domain__billing__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__zone__time_off {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Zone Time Off"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__zone__time_off}) as events__extensions__vulns__vulnerabilities__about__domain__zone__time_off ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__zone__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Zone Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__zone__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__domain__zone__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__zone__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Zone Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__zone__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__domain__zone__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__asset__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Asset Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__asset__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__asset__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__signature_info__signers {
      view_label: "Events: Intermediary Process Ancestors File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__pe_file__signature_info__signers}) as events__intermediary__process_ancestors__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__resources_language_count {
      view_label: "Events: Security Result About Process File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__pe_file__resources_language_count}) as events__security_result__about__process__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__resources_type_count_str {
      view_label: "Events: Security Result About Process File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__pe_file__resources_type_count_str}) as events__security_result__about__process__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__signature_info__sigcheck__signers {
      view_label: "Events: Security Result About Process File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__signature_info__sigcheck__signers}) as events__security_result__about__process__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__observer__process_ancestors__file__pe_file__resources_language_count_str {
      view_label: "Events: Observer Process Ancestors File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__observer__process_ancestors.file__pe_file__resources_language_count_str}) as events__observer__process_ancestors__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__email__bcc {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Email Bcc"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__email__bcc}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__email__bcc ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__section {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__pe_file__section}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__admin__time_off {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Admin Time Off"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__admin__time_off}) as events__extensions__vulns__vulnerabilities__about__domain__admin__time_off ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__admin__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Admin Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__admin__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__domain__admin__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__admin__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Admin Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__admin__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__domain__admin__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__registrant__email_addresses {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Registrant Email Addresses"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__registrant__email_addresses}) as events__extensions__vulns__vulnerabilities__about__domain__registrant__email_addresses ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__resources_language_count {
      view_label: "Events: Intermediary Process Ancestors File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__pe_file__resources_language_count}) as events__intermediary__process_ancestors__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__resources_type_count_str {
      view_label: "Events: Intermediary Process Ancestors File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__pe_file__resources_type_count_str}) as events__intermediary__process_ancestors__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__signature_info__sigcheck__signers {
      view_label: "Events: Intermediary Process Ancestors File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__signature_info__sigcheck__signers}) as events__intermediary__process_ancestors__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__principal__process_ancestors__file__pe_file__resources_language_count_str {
      view_label: "Events: Principal Process Ancestors File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__principal__process_ancestors.file__pe_file__resources_language_count_str}) as events__principal__process_ancestors__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__email__to {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Email To"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__email__to}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__email__to ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__dns__authority {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__dns__authority}) as events__extensions__vulns__vulnerabilities__about__artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__dhcp__options {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__dhcp__options}) as events__extensions__vulns__vulnerabilities__about__artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__cloud__project__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Cloud Project Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__cloud__project__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__cloud__project__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__cloud__project__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Cloud Project Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__cloud__project__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__cloud__project__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__signature_info__signer {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__pe_file__signature_info__signer}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__group__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Group Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__group__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__group__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__dns__additional {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__dns__additional}) as events__extensions__vulns__vulnerabilities__about__artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__dns__questions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__dns__questions}) as events__extensions__vulns__vulnerabilities__about__artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__signature_info__sigcheck__signer {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__signature_info__sigcheck__signer}) as events__extensions__vulns__vulnerabilities__about__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__resource__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Resource Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__resource__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__resource__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user_management_chain__phone_numbers {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Management Chain Phone Numbers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__user_management_chain.phone_numbers}) as events__extensions__vulns__vulnerabilities__about__user_management_chain__phone_numbers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__embedded_ips {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Embedded Ips"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__embedded_ips}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__embedded_ips ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__billing__time_off {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Billing Time Off"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__billing__time_off}) as events__extensions__vulns__vulnerabilities__about__domain__billing__time_off ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__billing__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Billing Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__billing__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__domain__billing__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__billing__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Billing Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__billing__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__domain__billing__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__registrant__group_identifiers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Registrant Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__registrant__group_identifiers}) as events__extensions__vulns__vulnerabilities__about__domain__registrant__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__intermediary__ip_geo_artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Intermediary Ip Geo Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__intermediary__ip_geo_artifact.network__http__parsed_user_agent__annotation}) as events__intermediary__ip_geo_artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Security Result About Ip Geo Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__tls__client__supported_ciphers}) as events__security_result__about__ip_geo_artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__signature_info__signer {
      view_label: "Events: Security Result About Process Ancestors File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__pe_file__signature_info__signer}) as events__security_result__about__process_ancestors__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__smtp__rcpt_to {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Smtp Rcpt To"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__smtp__rcpt_to}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__smtp__rcpt_to ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__tls__client__supported_ciphers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__tls__client__supported_ciphers}) as events__extensions__vulns__vulnerabilities__about__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__cloud__vpc__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Cloud Vpc Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__cloud__vpc__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__cloud__vpc__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__imports {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__pe_file__imports}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__detection_fields {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Detection Fields"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.detection_fields}) as events__extensions__vulns__vulnerabilities__about__security_result__detection_fields ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__embedded_urls {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Embedded Urls"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__embedded_urls}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__embedded_urls ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process__file__pe_file__resources_language_count_str {
      view_label: "Events: Security Result About Process File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__security_result.about__process__file__pe_file__resources_language_count_str}) as events__security_result__about__process__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__signature_info__sigcheck__signer {
      view_label: "Events: Security Result About Process Ancestors File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__signature_info__sigcheck__signer}) as events__security_result__about__process_ancestors__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__email__subject {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Email Subject"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__email__subject}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__email__subject ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__smtp__server_response {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__smtp__server_response}) as events__extensions__vulns__vulnerabilities__about__artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__resources_type_count {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__pe_file__resources_type_count}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__signature_info__x509 {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__pe_file__signature_info__x509}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__resource {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__pe_file__resource}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user_management_chain__email_addresses {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Management Chain Email Addresses"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__user_management_chain.email_addresses}) as events__extensions__vulns__vulnerabilities__about__user_management_chain__email_addresses ;;
      relationship: one_to_many
    }
    join: events__intermediary__process_ancestors__file__pe_file__resources_language_count_str {
      view_label: "Events: Intermediary Process Ancestors File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__intermediary__process_ancestors.file__pe_file__resources_language_count_str}) as events__intermediary__process_ancestors__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__security_result__about__artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Security Result About Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__security_result.about__artifact__network__http__parsed_user_agent__annotation}) as events__security_result__about__artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__signature_info__sigcheck__x509 {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__signature_info__sigcheck__x509}) as events__extensions__vulns__vulnerabilities__about__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__imports__functions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process__file__pe_file__imports.functions}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__command_line_history {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors Command Line History"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.command_line_history}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__command_line_history ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__tech__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Tech Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__tech__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__domain__tech__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__zone__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Zone Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__zone__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__domain__zone__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__registrant__time_off {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Registrant Time Off"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__registrant__time_off}) as events__extensions__vulns__vulnerabilities__about__domain__registrant__time_off ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__registrant__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Registrant Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__registrant__attribute__roles}) as events__extensions__vulns__vulnerabilities__about__domain__registrant__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__registrant__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Registrant Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__registrant__attribute__labels}) as events__extensions__vulns__vulnerabilities__about__domain__registrant__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__resources_type_count {
      view_label: "Events: Security Result About Process Ancestors File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__pe_file__resources_type_count}) as events__security_result__about__process_ancestors__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__signature_info__x509 {
      view_label: "Events: Security Result About Process Ancestors File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__pe_file__signature_info__x509}) as events__security_result__about__process_ancestors__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__dns__answers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Dns Answers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__dns__answers}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__dns__answers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__resource_ancestors__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About Resource Ancestors Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__resource_ancestors.attribute__roles}) as events__extensions__vulns__vulnerabilities__about__resource_ancestors__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__resource_ancestors__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About Resource Ancestors Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__resource_ancestors.attribute__labels}) as events__extensions__vulns__vulnerabilities__about__resource_ancestors__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user_management_chain__group_identifiers {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Management Chain Group Identifiers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__user_management_chain.group_identifiers}) as events__extensions__vulns__vulnerabilities__about__user_management_chain__group_identifiers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__associations__alias {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Associations Alias"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result__associations.alias}) as events__extensions__vulns__vulnerabilities__about__security_result__associations__alias ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__embedded_domains {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Embedded Domains"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__embedded_domains}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__embedded_domains ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__admin__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Admin Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__admin__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__domain__admin__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__signature_info__sigcheck__x509 {
      view_label: "Events: Security Result About Process Ancestors File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__signature_info__sigcheck__x509}) as events__security_result__about__process_ancestors__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__cloud__project__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Cloud Project Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__cloud__project__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__cloud__project__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__signature_info__signers {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__pe_file__signature_info__signers}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__capabilities_tags {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Capabilities Tags"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__capabilities_tags}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__capabilities_tags ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__dns__authority {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Dns Authority"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__dns__authority}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__dns__authority ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__dhcp__options {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Dhcp Options"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__dhcp__options}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__dhcp__options ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__resources_language_count {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__pe_file__resources_language_count}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__resources_type_count_str {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__pe_file__resources_type_count_str}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__signature_info__sigcheck__signers {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__signature_info__sigcheck__signers}) as events__extensions__vulns__vulnerabilities__about__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__associations__country_code {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Associations Country Code"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result__associations.country_code}) as events__extensions__vulns__vulnerabilities__about__security_result__associations__country_code ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__attack_details__tactics {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Attack Details Tactics"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.attack_details__tactics}) as events__extensions__vulns__vulnerabilities__about__security_result__attack_details__tactics ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__billing__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Billing Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__billing__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__domain__billing__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__signature_info__signers {
      view_label: "Events: Security Result About Process Ancestors File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__pe_file__signature_info__signers}) as events__security_result__about__process_ancestors__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__dns__additional {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Dns Additional"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__dns__additional}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__dns__additional ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__dns__questions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Dns Questions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__dns__questions}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__dns__questions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__signature_info__signer {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__pe_file__signature_info__signer}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user_management_chain__time_off {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Management Chain Time Off"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__user_management_chain.time_off}) as events__extensions__vulns__vulnerabilities__about__user_management_chain__time_off ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user_management_chain__attribute__roles {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Management Chain Attribute Roles"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__user_management_chain.attribute__roles}) as events__extensions__vulns__vulnerabilities__about__user_management_chain__attribute__roles ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user_management_chain__attribute__labels {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Management Chain Attribute Labels"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__user_management_chain.attribute__labels}) as events__extensions__vulns__vulnerabilities__about__user_management_chain__attribute__labels ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__resources_language_count {
      view_label: "Events: Security Result About Process Ancestors File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__pe_file__resources_language_count}) as events__security_result__about__process_ancestors__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__resources_type_count_str {
      view_label: "Events: Security Result About Process Ancestors File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__pe_file__resources_type_count_str}) as events__security_result__about__process_ancestors__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__signature_info__sigcheck__signers {
      view_label: "Events: Security Result About Process Ancestors File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__signature_info__sigcheck__signers}) as events__security_result__about__process_ancestors__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__signature_info__sigcheck__signer {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__signature_info__sigcheck__signer}) as events__extensions__vulns__vulnerabilities__about__process__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__section {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Section"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__pe_file__section}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__section ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__smtp__server_response {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Smtp Server Response"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__smtp__server_response}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__smtp__server_response ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__attack_details__techniques {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Attack Details Techniques"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.attack_details__techniques}) as events__extensions__vulns__vulnerabilities__about__security_result__attack_details__techniques ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__domain__registrant__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Domain Registrant Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__domain__registrant__attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__domain__registrant__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__security_result__about__ip_geo_artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Security Result About Ip Geo Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__security_result__about__ip_geo_artifact.network__http__parsed_user_agent__annotation}) as events__security_result__about__ip_geo_artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__network__http__parsed_user_agent__annotation {
      view_label: "Events: Extensions Vulns Vulnerabilities About Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__network__http__parsed_user_agent__annotation}) as events__extensions__vulns__vulnerabilities__about__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__tls__client__supported_ciphers}) as events__extensions__vulns__vulnerabilities__about__artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__file__pe_file__resources_language_count_str {
      view_label: "Events: Extensions Vulns Vulnerabilities About File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__file__pe_file__resources_language_count_str}) as events__extensions__vulns__vulnerabilities__about__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__resources_type_count {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__pe_file__resources_type_count}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__signature_info__x509 {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__pe_file__signature_info__x509}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__resource_ancestors__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Resource Ancestors Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__resource_ancestors.attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__resource_ancestors__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__signature_info__sigcheck__x509 {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__signature_info__sigcheck__x509}) as events__extensions__vulns__vulnerabilities__about__process__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__verdict_info__ioc_stats {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Verdict Info Ioc Stats"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result__verdict_info.ioc_stats}) as events__extensions__vulns__vulnerabilities__about__security_result__verdict_info__ioc_stats ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__imports {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Imports"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__pe_file__imports}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__imports ;;
      relationship: one_to_many
    }
    join: events__security_result__about__process_ancestors__file__pe_file__resources_language_count_str {
      view_label: "Events: Security Result About Process Ancestors File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__security_result__about__process_ancestors.file__pe_file__resources_language_count_str}) as events__security_result__about__process_ancestors__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__resource {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Resource"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__pe_file__resource}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__resource ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__signature_info__signers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__pe_file__signature_info__signers}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__user_management_chain__attribute__permissions {
      view_label: "Events: Extensions Vulns Vulnerabilities About User Management Chain Attribute Permissions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__user_management_chain.attribute__permissions}) as events__extensions__vulns__vulnerabilities__about__user_management_chain__attribute__permissions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__associations__industries_affected {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Associations Industries Affected"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result__associations.industries_affected}) as events__extensions__vulns__vulnerabilities__about__security_result__associations__industries_affected ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__imports__functions {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Imports Functions"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__imports.functions}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__imports__functions ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__resources_language_count {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__pe_file__resources_language_count}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__resources_type_count_str {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__pe_file__resources_type_count_str}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__signature_info__sigcheck__signers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__signature_info__sigcheck__signers}) as events__extensions__vulns__vulnerabilities__about__process__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__tls__client__supported_ciphers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Tls Client Supported Ciphers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__tls__client__supported_ciphers}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__tls__client__supported_ciphers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__signature_info__signer {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Signature Info Signer"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__pe_file__signature_info__signer}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__signature_info__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process__file__pe_file__resources_language_count_str {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__process__file__pe_file__resources_language_count_str}) as events__extensions__vulns__vulnerabilities__about__process__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__verdict__verdict__mandiant_sources {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Verdict Verdict Mandiant Sources"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.verdict__verdict__mandiant_sources}) as events__extensions__vulns__vulnerabilities__about__security_result__verdict__verdict__mandiant_sources ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__signature_info__sigcheck__signer {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Signature Info Sigcheck Signer"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__signature_info__sigcheck__signer}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__signature_info__sigcheck__signer ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Extensions Vulns Vulnerabilities About Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities.about__artifact__network__http__parsed_user_agent__annotation}) as events__extensions__vulns__vulnerabilities__about__artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__resources_type_count {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Resources Type Count"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__pe_file__resources_type_count}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__resources_type_count ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__signature_info__x509 {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Signature Info X509"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__pe_file__signature_info__x509}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__signature_info__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__security_result__verdict__verdict__third_party_sources {
      view_label: "Events: Extensions Vulns Vulnerabilities About Security Result Verdict Verdict Third Party Sources"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__security_result.verdict__verdict__third_party_sources}) as events__extensions__vulns__vulnerabilities__about__security_result__verdict__verdict__third_party_sources ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__signature_info__sigcheck__x509 {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Signature Info Sigcheck X509"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__signature_info__sigcheck__x509}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__signature_info__sigcheck__x509 ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__signature_info__signers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Signature Info Signers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__pe_file__signature_info__signers}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__signature_info__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__resources_language_count {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Resources Language Count"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__pe_file__resources_language_count}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__resources_language_count ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__resources_type_count_str {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Resources Type Count Str"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__pe_file__resources_type_count_str}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__resources_type_count_str ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__signature_info__sigcheck__signers {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Signature Info Sigcheck Signers"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__signature_info__sigcheck__signers}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__signature_info__sigcheck__signers ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__http__parsed_user_agent__annotation {
      view_label: "Events: Extensions Vulns Vulnerabilities About Ip Geo Artifact Network Http Parsed User Agent Annotation"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__ip_geo_artifact.network__http__parsed_user_agent__annotation}) as events__extensions__vulns__vulnerabilities__about__ip_geo_artifact__network__http__parsed_user_agent__annotation ;;
      relationship: one_to_many
    }
    join: events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__resources_language_count_str {
      view_label: "Events: Extensions Vulns Vulnerabilities About Process Ancestors File Pe File Resources Language Count Str"
      sql: LEFT JOIN UNNEST(${events__extensions__vulns__vulnerabilities__about__process_ancestors.file__pe_file__resources_language_count_str}) as events__extensions__vulns__vulnerabilities__about__process_ancestors__file__pe_file__resources_language_count_str ;;
      relationship: one_to_many
    }
}
