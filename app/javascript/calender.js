window.addEventListener('load',function(){
  if(localStorage.getItem("date")){
  const before = localStorage.getItem("date");
  const before_set = document.getElementById(before+"");
  before_set.setAttribute("bgcolor","red");
  }

  const today = new Date();
  const date = today.getDate();
  const month = today.getMonth()+1;
  const year = today.getFullYear();
  const set = document.getElementById(year+"-"+("0"+month).slice(-2)+"-"+("0"+date).slice(-2));
  const button = document.getElementById("result");

  button.addEventListener("click",() => {
  const color = set.setAttribute("bgcolor","red");
  localStorage.setItem("date",year+"-"+("0"+month).slice(-2)+"-"+("0"+date).slice(-2));
  })
})