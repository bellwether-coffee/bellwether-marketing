$ ->
  $('img.svg').each ->
    $img = $(this)
    imgID = $img.attr('id')
    imgClass = $img.attr('class')
    imgURL = $img.attr('src')
    $.get imgURL, ((data) ->
      # Get the SVG tag, ignore the rest
      $svg = $(data).find('svg')
      # Add replaced image's ID to the new SVG
      if typeof imgID != 'undefined'
        $svg = $svg.attr('id', imgID)
      # Add replaced image's classes to the new SVG
      if typeof imgClass != 'undefined'
        $svg = $svg.attr('class', imgClass + ' replaced-svg')
      # Remove any invalid XML tags as per http://validator.w3.org
      $svg = $svg.removeAttr('xmlns:a')
      # Check if the viewport is set, if the viewport is not set the SVG wont't scale.
      if !$svg.attr('viewBox') and $svg.attr('height') and $svg.attr('width')
        $svg.attr 'viewBox', '0 0 ' + $svg.attr('height') + ' ' + $svg.attr('width')
      # Replace image with new SVG
      $img.replaceWith $svg
    ), 'xml'


  $(".contact form").submit (event) ->
    event.preventDefault()
    form = $(this)
    contactName = form.find('[name=name]').val()
    email = form.find('[name=email]').val()
    message = form.find('[name=body]').val()
    interest = form.find('[name=interest]')
    text = $(".contact p.error-text")
    formData = form.serialize()

    if contactName == ""
      text.fadeOut ->
        text.html("We need your name to continue.")
        text.fadeIn()
    else if email == ""
      text.fadeOut ->
        text.html("We need your email to continue.")
        text.fadeIn()
    else if message == ""
      text.fadeOut ->
        text.html("We need your company to continue.")
        text.fadeIn()
    else
      form.find(":input").prop("disabled", true)
      $.post("https://formkeep.com/f/963bc7468876", formData, () ->
        slowAway = ->
          $(form).fadeOut()
        Accept: "application/javascript"
        form.find(":input").prop("disabled", false)
        swal
          title: 'Success!'
          text: 'Thanks for you interest in Bellwether. You\'ll here from us soon.'
          type: 'success'
          timer: 2000
        window.setTimeout(slowAway, 2100)
        text.html("Thanks for you interest in Bellwether. You\'ll here from us soon.")
        text.fadeIn()
      ).fail ->
        form.find(":input").prop("disabled", false)
        swal
          title: 'Whoops!'
          text: 'Something went wrong. Please try again.'
          type: 'error'
          timer: 2000
