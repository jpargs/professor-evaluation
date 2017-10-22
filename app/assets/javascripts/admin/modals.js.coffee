$ ->
  $(document).on "click", ".toggle-delete-modal", (event) ->
    event.preventDefault()
    data_type = $(this).data("type")
    data_href = $(this).data("href")
    $('#'+data_type+'_delete_modal').modal("toggle")
    $('.delete-'+data_type).attr('href', data_href)
    return
  
  $(document).on "click", ".add-cocoon", (event) ->
    event.preventDefault()
    $(".chosen-select").chosen({
      placeholder_text_multiple: "Select option(s)..."
    });
