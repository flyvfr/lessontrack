$(function () {

    achievementstable = $('#TableAchievements').DataTable({
            columns: [
                {
                    data: "Achievement",
                    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<a href='#' data-toggle='modal' data-target='#editAchievement' " +
                            "data-achievementid='" + oData.AchievementID + "'\
                            data-achievementname='"+ oData.Achievement + "'\
                            data-achievementdescription='"+ oData.AchievementDesc + "'\
                        data-title='Edit Achievement'>" + sData + "</a>");
                    }
                },
                { data: "Tasks" },
                { data: "Prerequisites" },
                {
                    data: "actions",
                    fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<a href='#' class='ti-pencil' data-toggle='modal' data-target='#editAchievement'\
                            data-achievementid='" + oData.AchievementID + "'\
                            data-achievementname='"+ oData.Achievement + "'\
                            data-achievementdescription='"+ oData.AchievementDesc + "'\
                            data-title='Edit Achievement' style= 'margin-right: 10px; outline: none' ></a >"+
                            "<a href='#' class='ti-trash' data-toggle='modal' data-target='#deleteAchievement'" +
                            "data-achievementid='" + oData.AchievementID + "' data-achievementname='" + oData.Achievement + "' style='outline: none' ></a>");
                    }
                }
            ],
            dom: 'B',
            buttons: [
                {
                    classname: "btn btn-default",
                    text: 'Add Achievement',
                    action: function (e, dt, node, config) {
                        $("#editAchievement").modal();
                    }
                }
            ],
            paging: false,
            ajax: "/web/JSONAchievementsList.ashx",
    });

    //----------------------------- ACHIEVEMENTS------------------------------
    $('#editAchievement').on('hidden.bs.modal', function () {
        var modal = this;
        $("#editAchivementForm")[0].reset();
        // clear all errors
        $("#grp_achievementname").removeClass("has-error");
    });

    $('#editAchievement').on('show.bs.modal', function (event) {
        var modal = $(this);

        var button = $(event.relatedTarget); // Button that triggered the modal
        var achid = button.data('achievementid'); // Extract info from data-* attributes
        var achname = button.data('achievementname');
        var desc = button.data('achievementdescription');
        var title = button.data("title");
        var nosave = button.data("nosave");

        if (nosave == '1') {
            modal.find('#btnsaveachievement').hide();
        } else {
            modal.find('#btnsaveachievement').show();
        }

        if (!title) {
            modal.find('#editAchievementLabel').text("New Achievement");
        } else {
            modal.find('#editAchievementLabel').text(title);
        }

        modal.find('#achievementid').val(achid);
        modal.find('#achievementname').val(achname);
        modal.find('#achievementdescription').text(desc != null ? desc : "");
    });
    $('#deleteAchievement').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var achievementid = button.data('achievementid') // Extract info from data-* attributes
        var achievementname = button.data('achievementname') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('#AchievementName').text(achievementname);
        modal.data("AchievementID", achievementid);
    });
});

function OnSubmitAchievement() {
    $("#grp_achievementname").removeClass("has-error");
    var cansubmit = true;
    if ($('#achievementname').val() == '') {
        cansubmit = false;
        $("#grp_achievementname").addClass("has-error");
    }

    if (!cansubmit) {
        return;
    }
    var data = $('#editAchivementForm').serialize();
    $.ajax({
        type: "POST",
        async: true,
        data: data,
        url: "saveachievement.ashx",
        
    }).done(function () { OnSuccessAchievement(); });
    $('#editAchievement').modal('hide');
}

function OnSuccessAchievement() {
    achievementstable.ajax.reload();
}
function doDeleteAchievement() {
    var achievementid = $("#deleteAchievement").data("AchievementID");

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            OnSuccessAchievement();
        }
    };
    xhttp.open("GET", "deleteachievement.ashx?achievementid=" + achievementid, true);
    xhttp.send();
}

