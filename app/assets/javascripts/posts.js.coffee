# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".promotion_inc").click ->
    id = $(@).data('id')
    $.ajax
      type: "POST"
      url: "/increment_promotion"
      data: {id : id}
      complete: ->
      success: (data) ->
      error: (jqXHR, textStatus, errorThrown ) ->
