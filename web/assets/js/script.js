
function  hide_company_name(event) {
    let elem = document.getElementById("Comapny_name_input")
    if (event.target.value === "company") {
        elem.style.display = "block"
    } else {
        elem.style.display = "none"

    }
}
let flag=true;
 function emailExists() {
    let email=document.getElementById("email").value;
    let req = new XMLHttpRequest();
    console.log("we are in getdata");

     req.onreadystatechange = ()=> {
        
        if (req.readyState === 4 && req.status === 200){
            console.log("we are in onreadystatechange");
        console.log(req.responseText);
        if (req.responseText === "true"){
            document.getElementById("emailerror").innerHTML="Email already registered";
            console.log(req.responseText+" in true condition check");
            flag=false;
        }
        else{
            document.getElementById("emailerror").innerHTML="";
             console.log(req.responseText+" in false condition check");
             flag=true;
            
        }
        }
        
//      document.getElementsByClassName('email')[0].innerHTML=req.responseText;
    };
req.open("GET", `checkEmailExist?email=${email}`, true);
req.send();
}
function phoneExists() {
    let phone=document.getElementById("phone").value;
    let req = new XMLHttpRequest();
    console.log("we are in getdata");

     req.onreadystatechange = ()=> {
        
        if (req.readyState === 4 && req.status === 200){
            console.log("we are in onreadystatechange");
        console.log(req.responseText);
        if (req.responseText === "true"){
            document.getElementById("phoneerror").innerHTML="number is already registered";
            console.log(req.responseText+" in true condition check");
            flag=false;
        }
        else{
            document.getElementById("phoneerror").innerHTML="";
             console.log(req.responseText+" in false condition check");
             flag=true;
            
        }
        }
        
//      document.getElementsByClassName('email')[0].innerHTML=req.responseText;
    };
req.open("GET", `checkPhoneExist?phone=${phone}`, true);
req.send();
}

function validation() {
    var namereg = /^[A-Za-z ]{3,30}$/;
    var emailreg = /^[A-Za-z0-9._]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
    var phonereg = /^[0-9]{10}$/g;
    var pinreg = /^[0-9]{6}$/g;

    var fname = document.getElementById("firstname").value;
    var lname = document.getElementById("lastname").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    var password = document.getElementById("password").value;
    var confirmpassword = document.getElementById("confirmpassword").value;
    var pin = document.getElementById("pin").value;

    //debug
    console.log(fname + " " + lname + " " + email + " " + phone + " " + password + " ");


    // cheking first name
    if (namereg.test(fname)) {
        document.getElementById("fnameerror").innerHTML = " ";
    } else {
        document.getElementById("fnameerror").innerHTML = "* Invalid first name";
        return false;
    }
    //checking lastrname
    if (namereg.test(lname)) {
        document.getElementById("lnameerror").innerHTML = " ";
    } else {
        document.getElementById("lnameerror").innerHTML = "* Invalid last name";
        return false;
    }
    //checking email
    if (emailreg.test(email)) {
        if(!flag) return false;
        document.getElementById("emailerror").innerHTML = "";

    } else {
        document.getElementById("emailerror").innerHTML = "* Invalid email";
        return false;
    }
    //checking phone
    if (phonereg.test(phone)) {
        if(!flag) return false;
        document.getElementById("phoneerror").innerHTML = " ";
    } else {
        document.getElementById("phoneerror").innerHTML = "* Invalid phone";
        return false;
    }
    //matching password
    if (password.match(confirmpassword)) {
        document.getElementById("passerror").innerHTML = " ";
    } else {
        document.getElementById("passerror").innerHTML = "* Invalid first name";
        return false;
    }
    //checking pincode
    if (pinreg.test(pin)) {
        document.getElementById("pinerror").innerHTML = " ";
    } else {
        document.getElementById("pinerror").innerHTML = "* Invalid first name";
        return false;
    }

    return true;
}

