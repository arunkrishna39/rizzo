# ------------------------------------------------------------------------------
# Handling pjax calls
# @constructor
# @param {#object} args
#   url - the remote url for the ajax call
#   parent - The parent dom element for the events, defaults to body
#   container - defaults to js-pjax-container
#   success - Callback function to fire on pjax success
#   error - Callback function to fire on pjax error
# ------------------------------------------------------------------------------

define ['jquery', 'jplugs/jquery.pjax'], ($) ->

  class Lpjax

    config =
      container : '#js-pjax-container'
      parent    : 'body'
      url       : ''
      success   : ->
      error     : ->

    constructor: (args) ->
      $.extend config, args
      @addCallbacks()
      $.pjax
        url       : config.url
        container : config.container

    addCallbacks: ->
      $(config.parent).on 'pjax:success', config.success
      $(config.parent).on 'pjax:error', config.error