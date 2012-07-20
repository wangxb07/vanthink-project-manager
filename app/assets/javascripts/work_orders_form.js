/**
* work order form javascript
*/
$(document).ready(function() {
    $('#work_order_project_phase_id').change(function(){
        var $this = $(this);
        if ($this.val()=='') {
            return false;
        }
        $.ajax({
            'url':'/follower/project_associated_user_select_field/'+$(this).val(),
        }).success(function(data){
            $("#user_select_field_container").html(data);
        });
    });
});