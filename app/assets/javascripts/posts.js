
$(document).on("turbolinks:load", function() {
  var selectizeCallback = null;

  $(".tag-modal").on("hide.bs.modal", function(e) {
    if (selectizeCallback != null) {
      selectizeCallback();
      selecitzeCallback = null;
    }

    $("#new_tag").trigger("reset");
    $.rails.enableFormElements($("#new_tag"));
  });

  $("#new_tag").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      method: "POST",
      url: $(this).attr("action"),
      data: $(this).serialize(),
      success: function(response) {
        selectizeCallback({value: response.id, text: response.name});
        selectizeCallback = null;

        $(".tag-modal").modal('toggle');
      }
    });
  });

  $(".selectize").selectize({
    create: function(input, callback) {
      selectizeCallback = callback;

      $(".tag-modal").modal();
      $("#tag_name").val(input);
    }
  });
});





app.Urban_terms = function() {
  this._input = $('#q');
  this._initAutocomplete();
};

app.Urban_terms.prototype = {
  _initAutocomplete: function() {
    this._input
      .autocomplete({
        source: '/urban_terms/search',
        appendTo: '#urban_terms-search-results',
        select: $.proxy(this._select, this)
      })
      .autocomplete('instance')._renderItem = $.proxy(this._render, this);
  },

  _render: function(ul, item) {
    var markup = [
      '<span class="img">',
        '<img src="' + item.image_url + '" />',
      '</span>',
      '<span class="title">' + item.title + '</span>',
      '<span class="description">' + item.description + '</span>',
      //'<span class="price">' + item.price + ' ' + item.published_at + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },

  _select: function(e, ui) {
    this._input.val(ui.item.url);
    window.location.replace(ui.item.url);
    return true;
  }
};
