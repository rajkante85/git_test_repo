# The name of this view in Looker is "Persons2"
view: persons_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: [db_sse.Persons2] ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "City" in Explore.

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: person_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.PersonID ;;
  }
  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [name, persons.person_id, persons.first_name, persons.last_name]
  }
}
