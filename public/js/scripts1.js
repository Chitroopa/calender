$(document).ready(function() {

  function post(path, params, method) {
    method = method || "post";
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
        if(params.hasOwnProperty(key)) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
         }
    }

    document.body.appendChild(form);
    form.submit();
}

  var previousMonth = 0;
  var nextMonth = 0;
  $('.previous-icon').click(function(){
    previousMonth++;
  console.log(previousMonth);
    post('/previous-month/', {previous_month_id: previousMonth});
  });
  $('.next-icon').click(function(){
    nextMonth++;
  });
});
