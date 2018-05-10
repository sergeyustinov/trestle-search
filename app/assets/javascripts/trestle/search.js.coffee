//= require trestle/jquery-ui/jquery-ui
//= require trestle/jquery-ui/ui/widget
//= require trestle/jquery-ui/ui/widgets/autocomplete

setValue = (field, val) ->
  $("[name='#{field.attr('name').replace(/_autocomplite/, '')}']").val(val)

setAutocomplite = ->
  $('.autocomplite').each ->
    field = $(this)

    field.blur ->
      if(field.val().length == 0)
        setValue field, ''

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
        setValue field, ui.item.id

document.addEventListener 'turbolinks:load', ->
  setAutocomplite()
