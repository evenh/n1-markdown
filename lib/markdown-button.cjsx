{Utils, DraftStore, React} = require 'nylas-exports'
{RetinaImg} = require 'nylas-component-kit'

sanitizeHtml = require 'sanitize-html'

# Using Showdown as Markdown parser with GitHub Flavored Markdown defaults
showdown = require 'showdown'
converter = new showdown.Converter({
    simplifiedAutoLink: true,
    strikethrough: true,
    tables: true,
    ghCodeBlocks: true,
    tasklists: true
  })

class MarkdownButton extends React.Component
  @displayName: 'MarkdownButton'

  @htmlOptions: {
    allowedTags: [],
    allowedAttributes: []
  }

  @propTypes:
    draftClientId: React.PropTypes.string.isRequired

  render: =>
    <div className="n1-markdown">
      <button className="btn btn-toolbar" onClick={ => @_onClick()} ref="button">
        Markdown to HTML
      </button>
    </div>

  _onClick: =>
    DraftStore.sessionForClientId(@props.draftClientId).then (session) =>
      text = sanitizeHtml(session.draft().body, @htmlOptions)
      text = text.replace(/<p>/gi, '')
      text = text.replace(/<\/p>/gi, '\n\n')

      newBody = converter.makeHtml(text)
      session.changes.add({ body: newBody })


module.exports = MarkdownButton
