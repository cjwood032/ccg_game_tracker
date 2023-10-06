function showGameOptions() {
    var modal = document.getElementById("optionalModal");
    var modalButton = document.getElementById("modalButton");
    if(modal.style.display != 'block')
    {
        modal.style.display = "block";
        modalButton.setAttribute("style","margin-top:60%");
        modalButton.setAttribute("textContent","close");
        this.value="close";
    }
    else
    {
        modal.style.display = 'none';
        modalButton.setAttribute("style","margin-top:0")
        modalButton.setAttribute("text","optional")
    }
    
    var submitButton = document.getElementById("submitGame")
    //submitButton.setAttribute("style","margin-top:60%")
    
};