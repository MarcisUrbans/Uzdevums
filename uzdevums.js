var last_clicked;
// var params = getSearchParameters();
function Allow() {
    if (!user.title.value.match(/[a-zA-Z]$/) && user.title.value != "") {
        user.title.value = "";
        alert("Please Enter only alphabets");
    }
}
function show(shown, hidden) {
    document.getElementById(shown).style.display='block';
    document.getElementById(hidden).style.display='none';
    return false;
}
function saglabat(){
    var lietotaja_vards=document.getElementById("vards") ;
    var testa_izvele= document.getElementById("izvele");
    var testaNr=testa_izvele.options[testa_izvele.selectedIndex].value;

   window.location.replace("./Tests.php?test_id="+testaNr+"&question_id=0&full_name="+lietotaja_vards.value);
}
function turpinat(){
    var params = getSearchParameters();
    if (last_clicked===undefined){
        alert('izvelies atbildi!');
        return;
    }
    var questionNr=parseInt(params.question_id);
    var nextquestionNr=questionNr+1;
    // var rinduSk=parseInt(params.question_id.length);
    // if (nextquestionNr>rinduSk){
    //     window.location.replace("./Tests.php?galaLapa");
    //     alert(rinduSk);
    // } else {
    window.location.replace("./Tests.php?test_id="+params.test_id+"&question_id="+nextquestionNr+"&answer_id="+last_clicked);
    // }
    // var atbId=document.getElementById()
};
function alphaOnly(event) {
    var key = event.keyCode;
    return ((key >= 65 && key <= 90) || key == 8);
};

//No url dabū ārā parametrus. Get params.
function getSearchParameters() {
    var prmstr = window.location.search.substr(1);
    return prmstr != null && prmstr != "" ? transformToAssocArray(prmstr) : {};
}

function transformToAssocArray( prmstr ) {
    var params = {};
    var prmarr = prmstr.split("&");
    for ( var i = 0; i < prmarr.length; i++) {
        var tmparr = prmarr[i].split("=");
        params[tmparr[0]] = tmparr[1];
    }
    return params;
}


