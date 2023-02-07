
var ord;
var field;
var object;

function alternateOrd(){
    if(ord === "asc")
        ord = "desc";
    else
        ord = "asc";
    console.log(ord);
    orderTable(field,ord);
}

function selectedField(field){
    field = this.field;
    alternateOrd();
}

function orderTable(field="id",ord="asc"){
   object = field + " " + ord;
}
