$(document).ready(function() {
  var timeout;
  var results = [];
  var selectedIndex = -1;

  // Evento para moverse hacia abajo en las opciones del autocompletado
  function moveDown() {
    selectedIndex = Math.min(selectedIndex + 1, results.length - 1);
    highlightOption();
  }

  // Evento para moverse hacia arriba en las opciones del autocompletado
  function moveUp() {
    selectedIndex = Math.max(selectedIndex - 1, -1);
    highlightOption();
  }

  // Función para resaltar la opción seleccionada
  function highlightOption() {
    $('#search-results a').removeClass('selected');
    if (selectedIndex > -1) {
      $('#search-results a').eq(selectedIndex).addClass('selected');
    }
  }

  // Evento para seleccionar la opción marcada y redirigir al usuario a la página correspondiente
  function selectOption() {
    if (selectedIndex > -1) {
      var url = $('#search-results a').eq(selectedIndex).attr('href');
      window.location.href = url;
    }
  }

  $('#search-form input[name="search_text"]').on('input', function() {
    var query = $(this).val().trim();

    clearTimeout(timeout);
    timeout = setTimeout(function() {
      if (query.length > 0) {
        $.ajax({
          url: searchProductsUrl,
          data: {'search_text': query},
          success: function(response) {
            results = response.data;
            selectedIndex = -1;
            var html = '';

            $.each(results, function(index, result) {
              var categorySlug = result.category_slug ? result.category_slug : '';
              html += '<a href="/collections/' + categorySlug + '/' + result.slug + '/">';
              html += '<div style="display:flex; align-items:center">';
              html += '<div style="margin-right:10px"><img src="' + result.image + '" style="width:50px;height:50px;"></div>';
              html += '<div>' + result.name + ' - ' + result.category_name + '</div>';
              html += '</div></a><br>';
            });

            $('#search-results').html(html).show();
          }
        });
      } else {
        $('#search-results').html('').hide();
      }
    }, 500);
  });

  // Evento para detectar cuando se presionan teclas en el campo de búsqueda
  $('#search-form input[name="search_text"]').on('keydown', function(event) {
    if (results.length > 0) {
      switch(event.keyCode) {
        case 38: // Flecha arriba
          moveUp();
          event.preventDefault();
          break;
        case 40: // Flecha abajo
          moveDown();
          event.preventDefault();
          break;
        case 13: // Enter
          selectOption();
          event.preventDefault();
          break;
      }
    }
  });

  // Evento para detectar cuando se hace clic en una opción del autocompletado
  $('#search-results').on('click', 'a', function(event) {
    event.preventDefault();
    var index = $('#search-results a').index(this);
    selectedIndex = index;
    selectOption();
  });
});
