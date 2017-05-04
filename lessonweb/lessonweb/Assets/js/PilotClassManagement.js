$(function () {
    //$('.pilotlogopicker').selectpicker();
    pilotclasstable = $('#TablePilotClass').DataTable({
            columns: [
                {
                    data: "PilotClass",
                    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<a href='#' data-toggle='modal' data-target='#editPilotClass' " +
                            "data-pilotclassid='" + oData.PilotClassID + "'\
                            data-pilotclassname='"+ oData.PilotClass + "'\
                            data-pilotlogo='"+ oData.PilotLogo+ "'\
                            data-pilotclassdescription='"+ oData.PilotClassDescription + "'\
                        data-title='Edit Pilot Class'>" + sData + "</a>");
                    }
                },
                {
                    data: "Prerequisites",
                    className: "dt-center",
                    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<span class='badge badge-default badge-pill' style='margin:0 auto'>" + oData.Prerequisites + "</span>" +
                            "<a href='#' class='ti-layers-alt' style='margin-left:10px' data-toggle='modal' data-target='#editPilotClassDependencies'\
                            data-pilotclassid='" + oData.PilotClassID+ "'\
                            data-pilotclassname='"+ oData.PilotClass + "'\
                            data-pilotlogo='"+ oData.PilotLogo+ "'\
                            data-title='Edit Dependencies' style= 'margin-right: 10px; outline: none' ></a >");
                    }
                },

                { data: "PilotClassDescription" },
                {
                    data: "actions",
                    fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<a href='#' class='ti-pencil' data-toggle='modal' data-target='#editPilotClass'\
                            data-pilotclassid='" + oData.PilotClassID + "'\
                            data-pilotclassname='"+ oData.PilotClass + "'\
                            data-pilotlogo='"+ oData.PilotLogo+ "'\
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

    $('#pilotlogo').on('change', function () {
        var selected = $(this).find("option:selected").val();
        updatePilotLogo(selected);
    });

    function updatePilotLogo(sel) {
        $("#pilotlogoimg").attr('src', "/Assets/img/custom/96/" + sel + "_96px.png");
    }

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
        var logo = button.data('pilotlogo');
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
        if (logo != null) {
            //$('#pilotlogo').selectpicker("val", logo);
            $('#pilotlogo').val(logo);
            updatePilotLogo(logo);
        } else {
            $('#pilotlogo').val("Helicopter");
            updatePilotLogo("Helicopter");
        }
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


$('#editPilotClassDependencies').on('show.bs.modal', function (event) {
    var modal = $(this);

    var button = $(event.relatedTarget); // Button that triggered the modal
    var achid = button.data('pilotclassid'); // Extract info from data-* attributes
    var achname = button.data('pilotclassname');
    var title = button.data("title");
    if (!title) {
        modal.find('#editPilotClassLabel').text("Dependencies");
    } else {
        modal.find('#editPilotClassLabel').text(achname);
    }

    modal.find('#deppilotclassid').val(achid);

    // Now load all the pilotclasss and populate into the list box
    var achlist = $("#pilotclassrequiredachievements");
    achlist.empty();

    $.getJSON("JSONGetPrereqs.ashx?pilotclassid=" + achid, function (data) {
        var achitems = [];

        $.each(data, function (key, val) {
            if (key == 'Achievements') {
                $.each(val, function (index, obj) {
                    if (achid != obj.id) { // dont show this same pilotclass
                        achitems.push("<li class=\"list-group-item\" " + (obj.depends == '1' ? "data-checked='true'" : "") + " data-achievementid='" + obj.id + "' >" + obj.name + "</li>");
                    }
                });
            }
        });
        achlist.append(achitems.join(''));
        doUpdateCheckBoxes();
    });
});


function OnSubmitPilotClassDependencies() {
    var checkedPilotClasss = [], counter = 0;
    $("#pilotclassrequiredachievements li.active").each(function (idx, li) {
        checkedPilotClasss.push($(li).data('achievementid'));
    });

    var achid = $("#deppilotclassid").val();

    var Dependencies = { "PilotClassID": achid };
    Dependencies["Achievements"] = checkedPilotClasss;

    var data = JSON.stringify(Dependencies);
    $.ajax({
        type: "POST",
        async: true,
        data: data,
        url: "savepilotclassdeps.ashx",

    }).done(function () { OnSuccessPilotClass(); });
    $('#editPilotClassDependencies').modal('hide');
}