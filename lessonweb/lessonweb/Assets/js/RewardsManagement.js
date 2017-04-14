$(function () {

    rewardstable =   $('#TableRewards').DataTable({
            columns: [
                {
                    data: "Reward",
                    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<a href='#' data-toggle='modal' data-target='#editReward' " +
                            "data-rewardid='" + oData.RewardID + "'\
                            data-rewardname='"+ oData.Reward + "'\
                            data-rewarddesc='"+ oData.RewardDesc + "'\
                            data-rewardcount='"+ oData.RewardCount + "'\
                            data-rewardtype='"+ oData.Type + "'\
                            data-rewarditem='"+ oData.RewardItem + "'\
                            data-rewardvalidtill='"+ oData.RewardValidity + "'\
                        data-title='View Reward'>" + sData + "</a>");
                    }
                },
                { data: "Type" },
                { data: "Detail" },
                {
                    data: "actions",
                    fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<a href='#' class='ti-pencil' data-toggle='modal' data-target='#editReward'\
                                                            data-rewardid='"+ oData.RewardID + "'\
                                                            data-rewardname='"+ oData.Reward + "'\
                                                            data-rewarddesc='"+ oData.RewardDesc+ "'\
                                                            data-rewardcount='"+ oData.RewardCount + "'\
                                                            data-rewardtype='"+ oData.Type + "'\
                                                            data-rewarditem='"+ oData.RewardItem + "'\
                                                            data-rewardvalidtill='"+ oData.RewardValidity + "'\
                                                            data-title='Edit Reward' style= 'margin-right: 10px; outline: none' ></a >"+
                            "<a href='#' class='ti-trash' data-toggle='modal' data-target='#deleteReward'" +
                            "data-rewardid='" + oData.RewardID + "' data-rewardname='" + oData.Reward + "' style='outline: none' ></a>");
                    }
                }
            ],
            dom: 'B',
            buttons: [
                {
                    classname: "btn btn-default",
                    text: 'Add Reward',
                    action: function (e, dt, node, config) {
                        $("#editReward").modal();
                    }
                }
            ],
            paging: false,
            ajax: "/web/JSONRewardsList.ashx",
        });

    //----------------------------- REWARDS------------------------------
    $('#editReward').on('hidden.bs.modal', function () {
        var modal = this;
        $("#editRewardForm")[0].reset();
        // clear all errors
        $("#grp_rewardname").removeClass("has-error");
        $("#grp_rewardtype").removeClass("has-error");
        $("#grp_rewarddetail").removeClass("has-error");
        $("#grp_rewardcount").removeClass("has-error");
        $("#grp_rewardvalidtill").removeClass("has-error");
    });
    $('#editReward').on('show.bs.modal', function (event) {
        var modal = $(this);

        var button = $(event.relatedTarget); // Button that triggered the modal
        var achid = button.data('rewardid'); // Extract info from data-* attributes
        var achname = button.data('rewardname');
        var desc = button.data('rewarddesc');
        var rewardtype = button.data("rewardtype");
        var rewarddetail = button.data("rewarditem");
        var rewardcount = button.data("rewardcount");
        var rewardvalidtill = button.data("rewardvalidtill");
        var nosave = button.data("nosave");
        var title = button.data("title");

        if (nosave == '1') {
            modal.find('#btnsavereward').hide();
        } else {
            modal.find('#btnsavereward').show();
        }

        if (!title) {
            modal.find('#editRewardLabel').text("New Reward");
        } else {
            modal.find('#editRewardLabel').text(title);
        }

        modal.find('#rewardid').val(achid);
        modal.find('#rewardname').val(achname);
        modal.find('#rewardtype').val(rewardtype);
        modal.find('#RewardDetail').val(rewarddetail);
        modal.find('#RewardCount').val(rewardcount);
        modal.find('#rewardvalidtill').val(rewardvalidtill);
        modal.find('#rewarddescription').text(desc!=null?desc:"");
    });
    $('#deleteReward').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var rewardid = button.data('rewardid') // Extract info from data-* attributes
        var rewardname = button.data('rewardname') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('#RewardName').text(rewardname);
        modal.data("RewardID", rewardid);
    });
});

function OnSubmitReward() {
    $("#grp_rewardname").removeClass("has-error");
    $("#grp_rewardtype").removeClass("has-error");
    $("#grp_rewarddetail").removeClass("has-error");
    $("#grp_rewardcount").removeClass("has-error");
    $("#grp_rewardvalidtill").removeClass("has-error");

    var cansubmit = true;
    if ($('#rewardname').val() == '') {
        cansubmit = false;
        $("#grp_rewardname").addClass("has-error");
    }
    if ($('#rewardtype').val() == '') {
        cansubmit = false;
        $("#grp_rewardtype").addClass("has-error");
    } else {
        if ($('#rewardtype').val() == 'DISCOUNT') {
            if ($('#RewardDetail').val() == '') {
                cansubmit = false;
                $("#grp_rewarddetail").addClass("has-error");
            }
            if ($('#RewardCount').val() == '') {
                cansubmit = false;
                $("#grp_rewardcount").addClass("has-error");
            }
        }
        if ($('#rewardtype').val() == 'OTHER') {
            if ($('#RewardDetail').val() == '') {
                cansubmit = false;
                $("#grp_rewarddetail").addClass("has-error");
            }
        }
    }

    if ($('#rewardvalidtill').val() != '') {
        if (Date.parse($('#rewardvalidtill').val()) == NaN) {
            cansubmit = false;
            $("#grp_rewardvalidtill").addClass("has-error");
        }
    }
    if (!cansubmit) {
        return;
    }

    var data = $('#editRewardForm').serialize();
    var formurl = $('#editRewardForm').action; 
    $.ajax({
        type: "POST",
        async: true,
        data: data,
        url: "savereward.ashx",
        
    }).done(function () { OnSuccessReward(); });
    $('#editReward').modal('hide');
}

function OnSuccessReward() {
    rewardstable.ajax.reload();
}

function doDeleteReward() {
    var rewardid = $("#deleteReward").data("RewardID");

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            OnSuccessReward();
        }
    };
    xhttp.open("GET", "deletereward.ashx?rewardid=" + rewardid, true);
    xhttp.send();
}
