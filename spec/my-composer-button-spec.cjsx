{React} = require 'nylas-exports'
ReactTestUtils = React.addons.TestUtils

MarkdownButton = require '../lib/markdown-button'

describe "MarkdownButton", ->
  beforeEach ->
    @component = ReactTestUtils.renderIntoDocument(
      <MarkdownButton draftClientId="test" />
    )

  it "should render into the page", ->
    expect(@component).toBeDefined()

  it "should have a displayName", ->
    expect(MarkdownButton.displayName).toBe('MarkdownButton')
