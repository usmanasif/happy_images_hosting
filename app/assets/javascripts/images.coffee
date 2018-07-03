bind_copy_text = ->
  $('body').on 'click', '.copy-text', ->
    text_field = $(this).siblings('.image-url-field')
    $(text_field).select()
    document.execCommand 'copy'

$ ->
  lightbox.init()
  bind_copy_text()
