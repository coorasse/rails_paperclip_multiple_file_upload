class @Gallery
  constructor: ->
    $(document).on 'change', 'input[type=file]', (el)=>
      console.log 'input changed'
      @readURL(el.target)
      #@addPainting()
      return

    $('#paintings')
    .on 'cocoon:before-insert', (e,task_to_be_added)->
      console.log 'before insert'
      task_to_be_added.fadeIn('slow')
    .on 'cocoon:after-insert', (e, added_task)->
      console.log 'after insert'
    #added_task.css("background","red")
    .on 'cocoon:before-remove', (e, task)->
      console.log 'before remove'
      $(this).data('remove-timeout', 10000)
      task.fadeOut('slow')

#    if @isAdvancedUpload
#      form = $('form')
#      console.log form
#      form.addClass('has-advanced-upload')
#      $('.box__dragndrop')
#      .on 'drag dragstart dragend dragover dragenter dragleave drop', (e)->
#        e.preventDefault()
#        e.stopPropagation()
#      .on 'dragover dragenter', (e)->
#        $(e.target).addClass('is-dragover')
#      .on 'dragleave dragend drop', (e)->
#        $(e.target).removeClass('is-dragover')
#      .on 'drop', (e)->
#        droppedFiles = e.originalEvent.dataTransfer.files
#
#  isAdvancedUpload: ->
#    div = document.createElement('div');
#    return (('draggable' in div) || ('ondragstart' in div && 'ondrop' in div)) && 'FormData' in window && 'FileReader' in window

  readURL: (input) ->
    if input.files and input.files[0]

      reader = new FileReader

      reader.onload = (e) ->
        preview = $(input).parent().next('[data-image-preview]')
        image_tag = $('<img></img>').addClass('thumb').attr('src', e.target.result)
        preview.html(image_tag)
        return

      reader.readAsDataURL input.files[0]
    return

  addPainting: ->
    $('.add_fields[data-association="painting"]').click()

