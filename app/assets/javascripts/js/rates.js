$(function(){
  json = $('#scale').data('json');
//=>{key:value}
typeof(json);
//=>object
});

// Skip Button
function skip(){
  location.reload();
}

// End Button
function end(){
  location.href = "../../";
}
