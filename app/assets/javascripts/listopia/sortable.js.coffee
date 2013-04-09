# http://stackoverflow.com/a/8936202
#
# ActiveAdmin already includes the necessary jquery in active_admin/base,
# so just add this to javascripts/active_admin.js after //= require active_admin/base
# 
# 
# Serialize and Sort 
# 
# model_name - you guessed it, the name of the model we are calling sort on.
#              This is the actual variable name, no need to change it.
#
sendSortRequestOfModel = (ui) ->
  formData = $(ui).sortable('serialize')
  formData += '&' + $('meta[name=csrf-param]').attr('content') + 
    '=' + encodeURIComponent($('meta[name=csrf-token]').attr('content'))
  $.ajax
    type: 'post'
    data: formData
    dataType: 'json'
    url: '/list_items/sort'

# Don't forget we are sorting ListItems, so list_items refers specifically to that.
jQuery ($) ->
  if $('.ui-sortable').length
    $( '.ui-sortable' ).disableSelection()
    $( '.ui-sortable' ).sortable
      axis: 'y'
      cursor: 'move'
      update: (event, ui) ->
        sendSortRequestOfModel($(event.target).closest(".ui-sortable"))