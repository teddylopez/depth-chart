
{

    function postDepthPosition(event, ui) {

      // Grab all field positions from div IDs
      var $field_positions = $('.edit-field-position').map(function() {
        return $(this).context.id
      }).get();

      // Create initial position_lists to be used for the depth_chart JSON object:
      var position_list = {};

      // Build out position_list objects with position keys and empty array values: { "left_field":[], etc... }
      $.each($field_positions, function(key, value) {
        position_list[value] = [];
      });

      // Assign key/value pairs when players are dropped into a container div: { "left_field":[98252], etc... }
      $.each($field_positions, function(index) {
        var pos = $field_positions[index];
        var container = $('#' + pos + " div");

        container.each(function(key, value){
          position_list[pos].push(value.dataset.playerId);
        });
      });

      // Toggle the player's 'x' button when a player is dropped into the depth chart and enable functionality
      $(".depth-positions .depth-player span:last-child").removeClass("hide").addClass("show").on("click", function(e) {
        var player = $(e.target.closest(".depth-player"));
        player.remove();
        postDepthPosition();
      });

      // Add class to dropped players to enable the 'clear all' functionality when button is clicked
      $(".depth-positions .depth-player").addClass("removeable");


      // Build out depth chart JSON object
      var depth_chart = {
        'position_list': position_list
      }

      // Stringify depth chart JSON object to be passed through AJAX
      var depth_string = JSON.stringify(depth_chart);

      $.ajax({
        url: "/charts/1/update",
        method: "POST",
        contentType: 'application/json',
        data: depth_string,
      }).done(function (data) {
        console.log("Successfully updated depth chart: " + depth_string);
      });

    }

    $(document).ready(function() {
      $(".sortable").sortable({
        update: postDepthPosition,
        revert: true
      }).on("sortupdate", postDepthPosition);
      $( ".draggable" ).draggable({
        connectToSortable: ".sortable",
        helper: "clone",
        revert: "invalid"
      }).on("sortupdate", postDepthPosition);

      // Remove individual players by clicking 'x' button
      $('.delete-player').on("click", function(e) {
        var player = $(e.target.closest("div"));
        player.remove();
        postDepthPosition();
      });

      // Clear depth chart by clicking on the button
      $(".delete-dc").on("click", function(e) {
        if (confirm("Are you sure you want to clear the chart?")) {
          e.preventDefault();
          var $list_players = $('.depth-positions').find('.removeable');
          $.each($list_players, function(position, player) {
            player.remove();
          });
          postDepthPosition();
        }
        return false
      });
    });

}
