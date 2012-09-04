# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require sugar.min
#= require jquery.nicescroll.min
#= require twitter/bootstrap/dropdown
$(document).ready ->

  $('#main').niceScroll()

  # Control para clics en elementos del menu
  $('#menu li').on 'click', ->
    href = $(this).find('a').attr 'href'
    window.location = href if href

# Resetea el scrollbar para ajustarse a posición o contenido
$.fn.resetScroll = ->
  this.getNiceScroll().remove()
  this.niceScroll()
