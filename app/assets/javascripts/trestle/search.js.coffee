//= require trestle/jquery-ui/jquery-ui
//= require trestle/jquery-ui/ui/widget
//= require trestle/jquery-ui/ui/widgets/autocomplete

$ ->
  $('.autocomplite').each ->
    field = $(this)

    field.autocomplete 
      source: (request, response) ->
        $.ajax
          url: field.data('remote-url')
          data: term: request.term
          dataType: 'json'
          type: 'GET'
      select: (event, ui) ->
        $("[name='#{field.attr('name').replace(/_autocomplite/, '')}']").val(ui.item.id)
