$(function () {
  $('#showGroups').click(function(event) {
    event.preventDefault();
    $.ajax({
      type: "GET",
      url: this.href,
      success: function(data){
        let html = $("<div/>").append(data).find('#groupsTable').html();
        $('#groupsList').html(html);
      }
    });
  });
});
