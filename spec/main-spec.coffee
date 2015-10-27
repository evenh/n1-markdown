{ComponentRegistry} = require 'nylas-exports'
{activate, deactivate} = require '../lib/main'

MarkdownButton = require '../lib/markdown-button'

describe "activate", ->
  it "should register the markdown button", ->
    spyOn(ComponentRegistry, 'register')
    activate()
    expect(ComponentRegistry.register).toHaveBeenCalledWith(MarkdownButton, {role: 'Composer:ActionButton'})

describe "deactivate", ->
  it "should unregister the markdown button", ->
    spyOn(ComponentRegistry, 'unregister')
    deactivate()
    expect(ComponentRegistry.unregister).toHaveBeenCalledWith(MarkdownButton)
