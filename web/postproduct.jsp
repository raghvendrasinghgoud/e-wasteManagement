<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <meta name="copyright" content="MACode ID, https://macodeid.com/">

    <title>Post Product</title>
    <link rel="icon" href="images/logo.svg" type="image/icon type">
  <link rel="stylesheet" href="assets/css/maicons.css">

  <link rel="stylesheet" href="assets/css/bootstrap.css">

  <link rel="stylesheet" href="assets/vendor/animate/animate.css">

  <link rel="stylesheet" href="assets/css/theme.css">
  
    <style>
        .file-drop-area {
    position: relative;
    display: flex;
    align-items: center;
    max-width: 50%;
    padding: 25px;
    background-color: rgb(211, 192, 229);
    border: 1px dashed rgba(255, 255, 255, 0.4);
    border-radius: 3px;
    transition: .2s
}

.choose-file-button {
    flex-shrink: 0;
    background-color: rgba(255, 255, 255, 0.04);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 3px;
    padding: 8px 15px;
    margin-right: 10px;
    font-size: 12px;
    text-transform: uppercase
}

.file-message {
    font-size: small;
    font-weight: 300;
    line-height: 1.4;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis
}

.file-input {
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    widows: 100%;
    cursor: pointer;
    opacity: 0
}
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
    $(document).on('change', '.file-input', function() {


var filesCount = $(this)[0].files.length;

var textbox = $(this).prev();

if (filesCount === 1) {
var fileName = $(this).val().split('\\').pop();
textbox.text(fileName);
} else {
textbox.text(filesCount + ' files selected');
}



if (typeof (FileReader) != "undefined") {
var dvPreview = $("#divImageMediaPreview");
dvPreview.html("");
$($(this)[0].files).each(function () {
var file = $(this);
var reader = new FileReader();
reader.onload = function (e) {
var img = $("<img />");
img.attr("style", "width: 150px; height:100px; padding: 10px");
img.attr("src", e.target.result);
dvPreview.append(img);
}
reader.readAsDataURL(file[0]);
});
} else {
alert("This browser does not support HTML5 FileReader.");
}


});
</script>

<body>
     <%@include file="header.jsp" %>
        <div style="padding: 7% 30% 7% 30%;">
            <h2>Post For Sale</h2>
            <form action="saveproduct" method="post" onsubmit="true" enctype='multipart/form-data'>
                <!-- uploading image -->
                <div class="file-drop-area"> <span class="choose-file-button">Choose Files</span> <span
                        class="file-message">or drag and drop files here</span> <input type="file" name="image" class="file-input"
                        accept=".jfif,.jpg,.jpeg,.png,.gif" multiple> </div>
                <div id="divImageMediaPreview"> </div>
                <!-- Product name input -->
                <div class="form-group"><label class="text-muted" for="pname"> Name</label>
                    <input type="text" name="pname" class="form-control" id="pname" placeholder="Enter Product Name">
                    <span id="pnameerror" class="text-danger font-weight-bold"></span>
                </div>
                <!-- Brand name input -->
                <div class="form-group"><label class="text-muted" for="brandname">Brand</label>
                    <input type="text" name="brandname" class="form-control" id="lastname" placeholder="Enter Brand">
                    <span id="lnameerror" class="text-danger font-weight-bold"></span>
                </div>
                <!-- product price-->
                <div class="form-group"><label class="text-muted" for="pprice">Price</label>
                    <input type="number" name="pprice" class="form-control" id="pprice" aria-describedby="emailHelp"
                        placeholder="Enter Price">
                    <span id="priceerror" class="text-danger font-weight-bold"></span>
                </div>
                <!-- product weight-->
                <div class="form-group"><label class="text-muted" for="weight">weight</label>
                    <input type="number" name="weight" class="form-control" id="weight" aria-describedby="emailHelp"
                        placeholder="Enter weight">
                    <span id="weighterror" class="text-danger font-weight-bold"></span>
                </div>
                <!-- product description -->
                <div class="form-outline">
                <label class="text-muted" for="description">Description</label>
                <textarea style="margin-bottom:10px;" class="form-control" name="description" id="description" rows="4" placeholder="Enter product Description..."></textarea>
                </div>
                <!-- submit form -->
                <input type="submit" class="btn btn-primary" value="Post">
            </form>

        </div>
        <%@include file="footer.jsp" %>

        <script src="../assets/js/jquery-3.5.1.min.js"></script>

        <script src="../assets/js/bootstrap.bundle.min.js"></script>

        <script src="../assets/js/google-maps.js"></script>

        <script src="../assets/vendor/wow/wow.min.js"></script>

        <script src="../assets/js/theme.js"></script>
        <!-- validation js file -->
<!--        <script src="../assets/js/script.js"></script>-->
</body>

</html>