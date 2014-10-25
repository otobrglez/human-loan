//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

$(document).ready ->

  $("#live-inquiries").on 'click', 'a.more-details', (e)->
    e.preventDefault() if e.preventDefault?

    $("li.inquiry").removeClass 'iq-open'

    next = (inquiry = $(e.currentTarget).parents('.inquiry')).next()

    inquiry.addClass('iq-open')

    return if next.hasClass('open')

    $(".inquiry-details").slideUp 'fast', (li)=>
      $(this).removeClass('open')

    next.slideDown 'fast', (li)=> $(this).addClass('open')
