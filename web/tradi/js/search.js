//====================API for Search Filter===================
var mouseOver = false;

function setMouseOverOnFilterBox(state){
    mouseOver=state;
}
function hideSearchFilterPanel(){
    if(mouseOver===false){
        $("#searhfilterpanel").removeClass("show");
    }
}
function showSearchFilter(){
    var txt=$('#txt_dependencia').val();
    $(".dropdown-item-seach").click(function (event){
        execSearch(this);
    });
    if(txt===""){
        $("#searhfilterpanel").removeClass("show");
        $('#txt_dependenciaid').val("");
    }else{
        $("#searhfilterpanel").addClass("show");
    }
}
function filtraropciones(event,txt,tb,colum) {
    txt=txt.toUpperCase();
    if(txt===""){$("#searhfilterpanel").removeClass("show");$('#txt_dependenciaid').val("");return;}
    /*==========search filter======*/
    $("#searhfilterpanel").addClass("show");
    var key=event.which || event.keyCode;
    
    var searhfilterpanel = document.getElementById("searhfilterpanel");
    var linodesall=searhfilterpanel.querySelectorAll("li");
    var exists=false;
    linodesall.forEach(function(li,b,c){
        li.classList.remove("d-none");
        if(key!==13 && key!==38 && key!==40 ){
            li.classList.remove("active");
        }
        if(li.innerText.toUpperCase().includes(txt)){
            li.classList.remove("d-none");
            exists=true;
        }else{
            li.classList.add("d-none");
        }
    });
    if(exists===false){$("#searhfilterpanel").removeClass("show"); return;}
    var linodes=searhfilterpanel.querySelectorAll("li:not(.d-none)");
    var pos=0;
    var posanterior=-1;
    if(key===38){/*key up*/
        linodes.forEach(function(li,b,c){
            if (li.classList.contains("active")){
                posanterior=b;
                pos=b-1;                
            }
        });
        if(pos > -1 ){
            linodes[pos].classList.add("active");
            linodes[posanterior].classList.remove("active");
        }
    }else if(key===40){/*key dowm*/       
        linodes.forEach(function(li,b,c){
            if (li.classList.contains("active")){
                posanterior=b;
                pos=b+1;                
            }
        });    
        //console.log(posanterior+"_"+pos+"___"+linodes.length);
        if(pos<linodes.length ){
            linodes[pos].classList.add("active");
            if(posanterior>-1)linodes[posanterior].classList.remove("active");
        }
        
    }else if(key===13){/*key enter*/
        var searhfilterpanel = document.getElementById("searhfilterpanel");
        var nodeslected=searhfilterpanel.querySelectorAll("li.active");
        //txt=nodeslected[0].innerText;
        execSearch(nodeslected[0]);
    }
}
function execSearch(txt){
        $('#txt_dependenciaid').val($(txt).attr("data"));
        $('#txt_dependencia').val($(txt).html());
        $("#searhfilterpanel").removeClass("show");
}
function displayThisOption(el){
    execSearch(el);
}
function clickItem(event,el){
    
}