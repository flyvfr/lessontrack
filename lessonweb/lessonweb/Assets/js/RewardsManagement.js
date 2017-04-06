$(function () {

    $("#editTask").on("submit", function (e) {
        var selected = $(this).find("option:selected").val();
        if (selected == '0') {
            e.preventDefault();
            return;
        }


        var data = {};
        data['tasktype'] = selected;
        data['taskname'] = $('#taskname').val();
        data['description'] = $('#description').val();

        $("#grp_taskname").removeClass("has-error");
        $("#grp_actype").removeClass("has-error");
        $("#grp_hours").removeClass("has-error");
        $("#grp_classname").removeClass("has-error");
        $("#grp_lessonname").removeClass("has-error");
        $("#grp_manuever").removeClass("has-error");
        $("#grp_airport").removeClass("has-error");
        $("#grp_destination").removeClass("has-error");
        $("#grp_pinnacle").removeClass("has-error");

        var cansubmit = true;
        if ($('#taskname').val() == '') {
            cansubmit = false;
            $("#grp_taskname").addClass("has-error");
        }
        switch (selected) {
            case '1':
                data['maneuver'] = $('#maneuver').val();
                if ($('#maneuver').val() == '') {
                    cansubmit = false;
                    $("#grp_manuever").addClass("has-error");
                }
                break;
            case '2':
            case '4':
                data['lessonname'] = $('#lessonname').val();
                if ($('#lessonname').val() == '') {
                    cansubmit = false;
                    $("#grp_lessonname").addClass("has-error");
                }
                break;
            case '8':
                data['ChooseAC'] = $('#ChooseAC').val();
                data['hours'] = $('#hours').val();
                if ($('#ChooseAC').val() == '') {
                    cansubmit = false;
                    $("#grp_actype").addClass("has-error");
                }
                if ($('#hours').val() == '') {
                    cansubmit = false;
                    $("#grp_hours").addClass("has-error");
                }
                break;
            case '16':
                data['airport'] = $('#airport').val();
                if ($('#airport').val() == '') {
                    cansubmit = false;
                    $("#grp_airport").addClass("has-error");
                }
                break;
            case '32':
                data['pinnacle'] = $('#pinnacle').val();
                if ($('#pinnacle').val() == '') {
                    cansubmit = false;
                    $("#grp_pinnacle").addClass("has-error");
                }
                break;
            case '64':
                data['destination'] = $('#destination').val();
                if ($('#destination').val() == '') {
                    cansubmit = false;
                    $("#grp_destination").addClass("has-error");
                }
                break;
            case '128':
                data['classname'] = $('#classname').val();
                if ($('#classname').val() == '') {
                    cansubmit = false;
                    $("#grp_classname").addClass("has-error");
                }
                break;
            default:
                return;
        }

        if (!cansubmit) {
            e.preventDefault();
            return;
        }

        $.ajax({
            type: "POST",
            async: true,
            url: e.action,
            complete: OnSuccess()
        });

    });

    function OnSuccess() {
        window.document.location.reload(); // then reload the page.(3)
    }

    $('.selectpicker').on('change', function () {
        var selected = $(this).find("option:selected").val();
        updateControlsForTaskType(selected);
    });

    function updateControlsForTaskType(selected) {
        if (selected == '2' || selected == '4') { // Lesson
            $('.lessonrow').show();
        } else {
            $('.lessonrow').hide();
        }

        if (selected == '1') { // Lesson
            $('.maneuverrow').show();
        } else {
            $('.maneuverrow').hide();
        }

        if (selected == '8') { // Lesson
            $('.flighthoursrow').show();
        } else {
            $('.flighthoursrow').hide();
        }
        if (selected == '16') { // Lesson
            $('.airportrow').show();
        } else {
            $('.airportrow').hide();
        }
        if (selected == '32') { // Lesson
            $('.pinnaclerow').show();
        } else {
            $('.pinnaclerow').hide();
        }
        if (selected == '64') { // Lesson
            $('.destinationrow').show();
        } else {
            $('.destinationrow').hide();
        }
        if (selected == '128') { // Lesson
            $('.classrow').show();
        } else {
            $('.classrow').hide();
        }
    }

    $('#editTask').on('hidden.bs.modal', function () {
        var modal = this;
        $("#editTaskForm")[0].reset();
        // clear all errors
        $("#grp_taskname").removeClass("has-error");
        $("#grp_actype").removeClass("has-error");
        $("#grp_hours").removeClass("has-error");
        $("#grp_classname").removeClass("has-error");
        $("#grp_lessonname").removeClass("has-error");
        $("#grp_manuever").removeClass("has-error");
        $("#grp_airport").removeClass("has-error");
        $("#grp_destination").removeClass("has-error");
        $("#grp_pinnacle").removeClass("has-error");
    });

    $('#editTask').on('show.bs.modal', function (event) {
        var modal = $(this);

        var button = $(event.relatedTarget); // Button that triggered the modal
        var taskid = button.data('taskid'); // Extract info from data-* attributes
        var taskname = button.data('taskname');
        var tasktype = button.data("tasktype");
        var title = button.data("title");
        var nosave = button.data("nosave");

        if (nosave == '1') {
            modal.find('#btnsavetask').hide();
        } else {
            modal.find('#btnsavetask').show();
        }

        if (!title) {
            modal.find('#editTaskLabel').text("New Task");
        } else {
            modal.find('#editTaskLabel').text(title);
        }

        modal.find('#taskid').val(taskid);
        modal.find('#ChooseTaskType').val(tasktype);
        modal.find('#taskname').val(taskname);
        modal.find('#ChooseAC').val(button.data("actype"));
        modal.find('#Hours').val(button.data("hours"));
        modal.find('#classname').val(button.data("classname"));
        modal.find('#lessonname').val(button.data("lessonname"));
        modal.find('#maneuver').val(button.data("maneuver"));
        modal.find('#airport').val(button.data("airport"));
        modal.find('#destination').val(button.data("detail"));
        modal.find('#pinnacle').val(button.data("detail"));

        modal.find('#description').text(button.data("description"));
        updateControlsForTaskType(tasktype);
    });

    $('#deleteTask').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var taskid = button.data('taskid') // Extract info from data-* attributes
        var taskname = button.data('taskname') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('#TaskName').text(taskname);
        modal.data("TaskID", taskid);
    });

    function doDelete() {
        var taskid = $("#deleteTask").data("TaskID");

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                location.reload();
            }
        };
        xhttp.open("GET", "deletetask.ashx?taskid=" + taskid, true);
        xhttp.send();
        /*
        $.ajax({
            type: "GET",
            async: false,
            url: "deletetask.ashx?taskid=" + taskid,
            complete: OnSuccess
        });*/
    }

});



