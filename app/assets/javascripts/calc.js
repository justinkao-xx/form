window.onload = function () {
var div = document.getElementById("buttons");
var btn1 = document.createElement("button"); btn1.innerHTML = "Add one calculator"; btn1.id = "one";
div.appendChild(btn1);
btn1.onclick = function () {make_buttons ('calc');};
};

function make_buttons (id) {
	var div_id = Math.floor(Math.random()*999);
	var input_id = Math.floor(Math.random()*999);
	var operators = ["*","/","+","-","=","c","DEL"];
	var parent = document.getElementById(id);
	var in_div = document.createElement("div"); in_div.id = div_id;
	parent.appendChild(in_div);
    	var input = document.createElement("input"); input.type = 'text'; input.id = input_id; input.readOnly=true;
    	in_div.appendChild(input);
    	for (var i = 0;i < 10; i++){  // make buttons with numbers
        	var btn = document.createElement ("button");
        	if (i === 0 || i === 6) {
        		var br = document.createElement("br");
        		in_div.appendChild(br);
        	}
        	btn.innerHTML = i;
        	btn.id = i;
        	in_div.appendChild(btn);
        	(function(index) {btn.onclick = function() {document.getElementById(input_id).value += index;};})(i);
    	}
  	for (var j = 0; j < operators.length; j++) {   // make buttons with operators
  		var btn = document.createElement ("button");
  		btn.innerHTML = operators[j];
  		btn.id = operators[j];
  		in_div.appendChild(btn);
  		if (operators[j] === "=") {
  			btn.onclick = function () {document.getElementById(input_id).value = eval(document.getElementById (input_id).value);};
  		}
  		else if (operators[j] === "c") {
  			btn.onclick = function () {document.getElementById(input_id).value = '';};
  		}
  		else if (operators[j] === "DEL") {
  			btn.onclick = function () {clearBox(div_id);};
  		}
  		else {
  			(function(index) {btn.onclick = function() {document.getElementById(input_id).value += index;};})(operators[j]);
  		}	
  	};
};

function clearBox(elementID) // delete the selected instance of calc
{
    document.getElementById(elementID).innerHTML='';
    
}