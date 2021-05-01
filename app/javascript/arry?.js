
window.addEventListener('load',function(){
  const history = [];
  if(localStorage.getItem("date")){
    history = JSON.parse(localStorage.getItem("data"));
  }
    // const before = localStorage.getItem("date");
  history.forEach(today => {
    const before = document.getElementById(today+"");
    before.setAttribute("bgcolor","red");
  })

  const today = new Date();
  const date = today.getDate();
  const month = today.getMonth()+1;
  const year = today.getFullYear();
  const set = document.getElementById(year+"-"+("0"+month).slice(-2)+"-"+("0"+date).slice(-2));

  const button = document.getElementById("result");
  button.addEventListener("click",() => {
  const color = set.setAttribute("bgcolor","red");
  history.push(year+"-"+("0"+month).slice(-2)+"-"+("0"+date).slice(-2));
  localStorage.setItem("date",JSON.stringify(history));
  });
})