$(function () {

    pilotclasstable = $('#TablePilotClass').DataTable({
            columns: [
                {
                    data: "PilotClass",
                    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<a href='#' data-toggle='modal' data-target='#editPilotClass' " +
                            "data-pilotclassid='" + oData.PilotClassID + "'\
                            data-pilotclassname='"+ oData.PilotClass + "'\
                            data-pilotclassdescription='"+ oData.PilotClassDescription + "'\
                        data-title='Edit Pilot Class'>" + sData + "</a>");
                    }
                },
                {
                    data: "Prerequisites",
                    className: "dt-center",
                    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<span class='badge badge-default badge-pill' style='margin:0 auto'>" + oData.Prerequisites + "</span>");
                    }
                },

                { data: "PilotClassDescription" },
                {
                    data: "actions",
                    fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<a href='#' class='ti-pencil' data-toggle='modal' data-target='#editPilotClass'\
                            data-pilotclassid='" + oData.PilotClassID + "'\
                            data-pilotclassname='"+ oData.PilotClass + "'\
                            data-pilotclassdescription='"+ oData.PilotClassDescription + "'\
                            data-title='Edit PilotClass' style= 'margin-right: 10px; outline: none' ></a >"+
                            "<a href='#' class='ti-trash' data-toggle='modal' data-target='#deletePilotClass'" +
                            "data-pilotclassid='" + oData.PilotClassID + "' data-pilotclassname='" + oData.PilotClass + "' style='outline: none' ></a>");
                    }
                }
            ],
            dom: 'B',
            buttons: [
                {
                    classname: "btn btn-default",
                    text: 'Add Pilot Class',
                    action: function (e, dt, node, config) {
                        $("#editPilotClass").modal();
                    }
                }
            ],
            paging: false,
            ajax: "/web/JSONPilotClassList.ashx",
    });

    //----------------------------- ACHIEVEMENTS------------------------------
    $('#editPilotClass').on('hidden.bs.modal', function () {
        var modal = this;
        $("#editPilotClassForm")[0].reset();
        // clear all errors
        $("#grp_pilotclassname").removeClass("has-error");
    });

    $('#editPilotClass').on('show.bs.modal', function (event) {
        var modal = $(this);

        var button = $(event.relatedTarget); // Button that triggered the modal
        var achid = button.data('pilotclassid'); // Extract info from data-* attributes
        var achname = button.data('pilotclassname');
        var desc = button.data('pilotclassdescription');
        var title = button.data("title");
        var nosave = button.data("nosave");

        if (nosave == '1') {
            modal.find('#btnsavepilotclass').hide();
        } else {
            modal.find('#btnsavepilotclass').show();
        }

        if (!title) {
            modal.find('#editPilotClassLabel').text("New Pilot Class");
        } else {
            modal.find('#editPilotClassLabel').text(title);
        }

        modal.find('#pilotclassid').val(achid);
        modal.find('#pilotclassname').val(achname);
        modal.find('#pilotclassdescription').text(desc != null ? desc : "");
    });
    $('#deletePilotClass').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var pilotclassid = button.data('pilotclassid') // Extract info from data-* attributes
        var pilotclassname = button.data('pilotclassname') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('#PilotClassName').text(pilotclassname);
        modal.data("PilotClassID", pilotclassid);
    });
});

function OnSubmitPilotClass() {
    $("#grp_pilotclassname").removeClass("has-error");
    var cansubmit = true;
    if ($('#pilotclassname').val() == '') {
        cansubmit = false;
        $("#grp_pilotclassname").addClass("has-error");
    }

    if (!cansubmit) {
        return;
    }
    var data = $('#editPilotClassForm').serialize();
    $.ajax({
        type: "POST",
        async: true,
        data: data,
        url: "savepilotclass.ashx",
        
    }).done(function () { OnSuccessPilotClass(); });
    $('#editPilotClass').modal('hide');
}

function OnSuccessPilotClass() {
    pilotclasstable.ajax.reload();
}
function doDeletePilotClass() {
    var pilotclassid = $("#deletePilotClass").data("PilotClassID");

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            OnSuccessPilotClass();
        }
    };
    xhttp.open("GET", "deletepilotclass.ashx?pilotclassid=" + pilotclassid, true);
    xhttp.send();
}

