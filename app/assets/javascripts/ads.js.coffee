class AdsPanel

  initialized = false

  init: ->
    if !initialized
      _setSeenBtnsEvents()
      intialized = true

  _markAsSeen = (element, seen) ->
    application_id = 
    advertisement_id = parseInt($(element).attr('data-advertisement-id'))
    company_id = parseInt($(element).attr('data-company-id'))
    token = $(element).attr('data-token')
    url = "/companies/" + company_id + "/ads/" + advertisement_id + "/seen?token=" + token
    data =
      application_id: parseInt($(element).attr('data-application-id'))
      seen: seen

    $.post(url, data).then ->
      parent = $(element).closest('tr')
      if seen
        parent.removeClass('not-seen')
      else
        parent.addClass('not-seen')
      


  _setSeenBtnsEvents = ->
    rows = $('.applications-admin-table .application-row')
    $(rows).find('.mark-as-seen').click ->
      _markAsSeen(this, true)
    $(rows).find('.mark-as-not-seen').click ->
      _markAsSeen(this, false)
    $(rows).find('.download-resume').click ->
      _markAsSeen(this, true)
    
@Buala.AdsPanel = new AdsPanel()
