function validFname(){
    var namereg=/^[A-Za-z_ ]{3,30}$/;
    var fname=document.getElementById("firstname").value;
    if(namereg.test(fname)){
        document.getElementById("fnameerror").innerHTML=" ";
    }else{
        document.getElementById("fnameerror").innerHTML="* Invalid first name";
        return false;
    }
    return true;
}

function validLname(){
    var namereg=/^[A-Za-z_ ]{3,30}$/;
    var lname=document.getElementById("lastname").value;
    //checking lastrname
    if(namereg.test(lname)){
        document.getElementById("lnameerror").innerHTML=" ";
    }else{
        document.getElementById("lnameerror").innerHTML="* Invalid last name";
        return false;
    }
    return true;
}
function validEmail(){
    var emailreg=/^[A-Za-z0-9_]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
    var email=document.getElementById("email").value;
     //checking email
    if(emailreg.test(email)){
        document.getElementById("emailerror").innerHTML=" ";
    }else{
        document.getElementById("emailerror").innerHTML="* Invalid email";
        return false;
    }
    return true;
}

function validPhone(){
    var phonereg=/^[0-9]{10}$/g;
    var phone=document.getElementById("phone").value;
    //checking phone
    if(phonereg.test(phone)){
        document.getElementById("phoneerror").innerHTML=" ";
    }else{
        document.getElementById("phoneerror").innerHTML="* Invalid phone";
        return false;
    }
    return true;
}

function validPin(){
    var pinreg=/^[0-9]{6}$/g;
    var pin=document.getElementById("pin").value;
    //checking pincode
    if(pinreg.test(pin)){
        document.getElementById("pinerror").innerHTML=" ";
    }else{
        document.getElementById("pinerror").innerHTML="* Invalid first name";
        return false;
    }
    
    return true;
}
function validPass(){
    var password=document.getElementById("password").value;
    var confirmpassword=document.getElementById("confirmpassword").value;
    
    //matching password
    if(password.match(confirmpassword)){
        document.getElementById("passerror").innerHTML=" ";
    }else{
        document.getElementById("passerror").innerHTML="* Invalid first name";
        return false;
    }
    return true;
}

