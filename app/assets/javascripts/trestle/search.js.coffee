//= require trestle/jquery-ui/jquery-ui
//= require trestle/jquery-ui/ui/widget
//= require trestle/jquery-ui/ui/widgets/autocomplete

setAutocomplite = ->
  $('.autocomplite').each ->
    field = $(this)

    field.autocomplete 
      source: (request, response) ->
        $.ajax
          url: field.data('remote-url')
          data: term: request.term
          dataType: 'json'
          type: 'GET'
          success: (data) ->
            response $.map(data, (item) ->
              [ {
                id: item.id
                value: item.value
              } ]
            )
      select: (event, ui) ->
        $("[name='#{field.attr('name').replace(/_autocomplite/, '')}']").val(ui.item.id)

document.addEventListener 'turbolinks:load', ->
  setAutocomplite()
