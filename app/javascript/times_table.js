window.addEventListener('load',function(){
  const inputAnswer0 = document.getElementsByClassName("user_answer")[0];
  const inputAnswer1 = document.getElementsByClassName("user_answer")[1];
  const inputAnswer2 = document.getElementsByClassName("user_answer")[2];
  const answer0 = document.getElementsByName("answer")[0];
  const answer1 = document.getElementsByName("answer")[1];
  const answer2 = document.getElementsByName("answer")[2];
  const passing0 = document.getElementsByClassName("hidden_passing")[0];
  const passing1 = document.getElementsByClassName("hidden_passing")[1];
  const passing2 = document.getElementsByClassName("hidden_passing")[2];
  const failure0 = document.getElementsByClassName("hidden_failure")[0];
  const failure1 = document.getElementsByClassName("hidden_failure")[1];
  const failure2 = document.getElementsByClassName("hidden_failure")[2];
  
  const button = document.getElementById("result");
  button.addEventListener("click",() => {
    passing0.removeAttribute("style", "display:block;")
    failure0.removeAttribute("style", "display:block;")
    passing1.removeAttribute("style", "display:block;")
    failure1.removeAttribute("style", "display:block;")
    passing2.removeAttribute("style", "display:block;")
    failure2.removeAttribute("style", "display:block;")
    if (inputAnswer0.value == answer0.value) {
      passing0.setAttribute("style", "display:block;")
    } else {
      failure0.setAttribute("style", "display:block;")
    }
    if (inputAnswer1.value == answer1.value) {
      passing1.setAttribute("style", "display:block;")
    } else {
      failure1.setAttribute("style", "display:block;")
    }
    if (inputAnswer2.value == answer2.value) {
      passing2.setAttribute("style", "display:block;")
    } else {
      failure2.setAttribute("style", "display:block;")
    }
  })
})