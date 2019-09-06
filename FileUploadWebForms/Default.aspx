<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FileUploadWebForms.Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
       
        <div class="col-12">
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1>Upload Files</h1>
                <p>Ajax jQuery / WebForms / ASMX</p>
            </div>
        </div>

        <div>
            <label>Select Files:</label>
            <input type="file" id="files" multiple />
            <button type="button" id="btnUpload" class="btn btn-primary">Upload</button>
            <hr />
            <div class="col-md-3">
                <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                    
                </div>
            </div>
            </div>
        </div>
            </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>
        $("#btnUpload").on('click', function () {

            var formData = new FormData();

            var fileUpload = $('#files').get(0);
            var files = fileUpload.files;

            for (var i = 0; i < files.length; i++) {
                console.log(files[i].name);
                formData.append(files[i].name, files[i]);
            }

            $.ajax({
                url: "http://localhost:59260/service.asmx/Upload",
                type: 'POST',
                data: formData,
                success: function (data) {
                    
                },
                error: function (data) {
                    alert('error' + data)
                },
                cache: false,
                contentType: false,
                processData: false,
                xhr: function () {
                    var xhr = new window.XMLHttpRequest();
                    xhr.upload.addEventListener("progress", function (evt) {
                        if (evt.lengthComputable) {

                            var percentComplete = Math.round((evt.loaded / evt.total) * 100);
                            
                            $('.progress-bar').css('width', percentComplete + '%').attr('aria-valuenow', percentComplete);
                            $('.progress-bar').text(percentComplete + '%');

                            console.log(percentComplete);
                        }
                    }, false);
                    return xhr;  
                },
            });
        });
    </script>
</body>
</html>
