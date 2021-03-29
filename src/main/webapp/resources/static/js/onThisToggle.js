(function(){

  const toggleOnBtn = document.getElementsByClassName('onThisToggle');
  
  [...toggleOnBtn].forEach(element => element.addEventListener('click', function(){
    this.classList.toggle('on');
  }));
})();