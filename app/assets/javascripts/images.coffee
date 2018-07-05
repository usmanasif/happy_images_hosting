bind_copy_text = ->
  $('body').on 'click', '.copy-text', ->
    text_field = $(this).siblings('.image-url-field')
    $(text_field).select()
    document.execCommand 'copy'

bind_copy_url = ->
  $('body').on 'click', '#copy-url', ->
    $(this).select()
    document.execCommand 'copy'

bind_dropzone = ->
  Dropzone.autoDiscover = false

  dropzone = new Dropzone('.dropzone',
    maxFiles: 1
    uploadMultiple: false
    parallelUploads: 1
    maxFilesize: 0.256
    paramName: 'image[file]'
    addRemoveLinks: false
    autoProcessQueue: false
    acceptedFiles: '.jpg, .jpeg, .png, .gif'
  )

  dropzone.on 'success', (file) ->
    @removeFile file
    window.location.href = '/'

  $('body').on 'click', '#upload-btn', ->
    dropzone.processQueue()

change_dropzone_html = ->
  $('.dz-message').html('
    <div class="drag-text">
      <h3>Drag or Drop Image</h3>
      <span>Or</span>
      <a href="#">Click to Upload</a>
    </div>
  ')

$ ->
  lightbox.init()
  bind_copy_text()
  bind_dropzone()
  change_dropzone_html()
  bind_copy_url()
