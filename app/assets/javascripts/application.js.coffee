//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
# tree


$(document).ready ->

  $('a.more-details').on 'click', (e)->

    $("li.inquiry").removeClass 'iq-open'
    e.preventDefault() if e.preventDefault?

    next = (inquiry = $(e.currentTarget).parents('.inquiry')).next()

    inquiry.addClass('iq-open')

    console.log next

    return if next.hasClass('open')

    $(".inquiry-details").slideUp 'fast', (li)=>
      $(this).removeClass('open')

    next.slideDown 'fast', (li)=> $(this).addClass('open')
