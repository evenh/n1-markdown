(function() {
  var ComponentRegistry, MarkdownButton, activate, deactivate, _ref;

  ComponentRegistry = require('nylas-exports').ComponentRegistry;

  _ref = require('../lib/main'), activate = _ref.activate, deactivate = _ref.deactivate;

  MarkdownButton = require('../lib/markdown-button');

  describe("activate", function() {
    return it("should register the markdown button", function() {
      spyOn(ComponentRegistry, 'register');
      activate();
      return expect(ComponentRegistry.register).toHaveBeenCalledWith(MarkdownButton, {
        role: 'Composer:ActionButton'
      });
    });
  });

  describe("deactivate", function() {
    return it("should unregister the markdown button", function() {
      spyOn(ComponentRegistry, 'unregister');
      deactivate();
      return expect(ComponentRegistry.unregister).toHaveBeenCalledWith(MarkdownButton);
    });
  });

}).call(this);
