# Sortable tables <table class='sortable'></>
@sortable_tables = ()->
  $('.sortable').sortable(
    axis: 'y'
    items: 'tr'
    cursor: 'move'

    sort: (e, ui) ->
      ui.item.addClass('active-item-shadow')
    stop: (e, ui) ->
      ui.item.removeClass('active-item-shadow')
    update: (e, ui) ->
      update_url = $('.sortable').data('sort-url')
      # this will not work with paginated items, as the index is zero on every page
      updated_order = []
      $('tbody tr').each (i) ->
        updated_order.push
          id: $(this).data('id')
          position: i + 1

      $.ajax(
        type: 'PUT'
        url: update_url
        dataType: 'json'
        data: { row_order_position: updated_order }
      )
  )

$ ->
  sortable_tables()