<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="WebApplication1.StartPage"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.1.1.js"></script>
    <link  src="/MyCSS.css" type="text/css" rel="stylesheet" />
    <script src="Scripts/jquery-ui-1.8.20.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div contenteditable="true" id="editor">
    <div>
    Dog capitale elephant
    </div>
    <div>
    Another paragraph.
    </div>
</div>
Current word: <span id="word"></span>
     <script type="text/javascript">
         var wrapwords = function () {
             $('#editor > div').each(function () {
                 $(this).html($(this).text().replace(/\b(\w+)\b/g, "<span>$1</span>"));
             });

             $('#editor span').hover(
                 function () {
                     $('#word').text($(this).text());
                     var word_elem = $(this);
                     $.ajax({
                         url: '/api/values/',
                         data: {
                             id: $(this).text()
                         },
                         success: function (data) {
                             $(word_elem).attr('title',data);
                         }
                     });
                 },
                 function () {
                     $('#word').text(''); $(this).css('background-color', '');
                     //$('#result').hide();
                 }
             );
         };

         $('#editor').on('focus', function () {
             $('#editor span').contents().unwrap();
         });

         $('#editor').on('blur', function () {
             wrapwords();
         });

         wrapwords();
         $(document).tooltip();
         </script>
        
    </form>
</body>
</html>
