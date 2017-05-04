function addTaskTodo(user, taskid, achievement) {
    $.mobile.loading('show');
    $.ajax({
        type: "GET",
        url: "AddTaskToDo.ashx?email=" + user + "&taskid=" + taskid,
        cache: false,
        dataType: "text",
        complete: function () {
            $.mobile.loading('hide');
            navToAchievementOrTodo(achievement);
        }
    });
};

function navToAchievementOrTodo(achievement) {
    if (achievement) {
        $.mobile.changePage('PlanAchievement.aspx?AchievementID=' + achievement, {
            allowSamePageTransition: true,
            transition: 'none',
            reloadPage: true
        });
    } else {
        $.mobile.changePage('todo.aspx', {
            allowSamePageTransition: true,
            transition: 'none',
            reloadPage: true
        });
    }
}

function removeTaskTodo(user, taskid) {
    $.mobile.loading('show');
    $.ajax({
        type: "GET",
        url: "RemoveTaskToDo.ashx?email=" + user + "&taskid=" + taskid,
        cache: false,
        dataType: "text",
        complete: function () {
            $.mobile.loading('hide');
            $.mobile.changePage(window.location.href, {
                allowSamePageTransition: true,
                transition: 'none',
                reloadPage: true
            });
        }
    });
};

function addTaskComplete(user, taskid, achievement) {
    var reviewer = $("#Reviewer").val();
    var CompletionDate = $("#CompletionDate").val();
    
    if (reviewer == "") {
        window.alert("Please select an instructor to review this task.");
        return;
    }

    $.mobile.loading('show');
    $.ajax({
        type: "GET",
        url: "AddTaskComplete.ashx?email=" + user + "&taskid=" + taskid + "&date=" + encodeURIComponent(CompletionDate) + "&reviewer=" + reviewer,
        cache: false,
        dataType: "text",
        complete: function () {
            $.mobile.loading('hide');
            navToAchievementOrTodo(achievement);
        }
    });
};

function refreshPage() {
    $.mobile.changePage(
        window.location.href,
        {
            allowSamePageTransition: true,
            transition: 'none',
            showLoadMsg: false,
            reloadPage: true
        }
    );
};