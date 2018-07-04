bind_copy_text = ->
  $('body').on 'click', '.copy-text', ->
    text_field = $(this).siblings('.image-url-field')
    $(text_field).select()
    document.execCommand 'copy'

bind_dropzone = ->
  Dropzone.autoDiscover = false

  dropzone = new Dropzone('.dropzone',
    parallelUploads: 1
    maxFilesize: 0.256
    paramName: 'image[file]'
    addRemoveLinks: false
    autoProcessQueue: false)
  dropzone.on 'success', (file) ->
    @removeFile file
    console.log 123
    window.location.href = '/'

  $('body').on 'click', '#upload-btn', ->
    dropzone.processQueue()

$ ->
  lightbox.init()
  bind_copy_text()
  bind_dropzone()
