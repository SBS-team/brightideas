$('#input-rating').on 'rating.change', (event, value, caption) =>
  $.post window.location.pathname + "/rating",
    {
      rate: value
    }, null, "json"