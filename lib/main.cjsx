{ComponentRegistry} = require 'nylas-exports'
MarkdownButton = require './markdown-button'

module.exports =
  activate: (@state) ->
    ComponentRegistry.register MarkdownButton,
      role: 'Composer:ActionButton'

  serialize: ->

  deactivate: ->
    ComponentRegistry.unregister(MarkdownButton)
